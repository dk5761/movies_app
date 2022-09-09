import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/movieInfoBottomNavButton.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/movie_panel_info_widgets.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/play_button.dart';

import '../../../../utils/scroll_configuration.dart';

class MovieInfoPage extends ConsumerStatefulWidget {
  const MovieInfoPage({Key? key, required this.item, required this.context})
      : super(key: key);

  final Movie item;
  final BuildContext context;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieInfoPageState();
}

class _MovieInfoPageState extends ConsumerState<MovieInfoPage>
    with TickerProviderStateMixin {
  late Animation<double> slideAnimation;
  late AnimationController controller;
  late AnimationController opacityController;
  late Animation<double> appBarAnimation;
  late AnimationController appBarController;

  late Animation<double> opacityAnimation;
  late DraggableScrollableController dragController;

  final text =
      """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.""";

  @override
  void initState() {
    super.initState();

    //drag controller
    dragController = DraggableScrollableController();

    // modal slide up
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    slideAnimation = Tween<double>(begin: 0.35, end: 0.5).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutQuart));

    //play button
    opacityController = AnimationController(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 0),
        vsync: this);
    opacityAnimation =
        Tween<double>(begin: 0, end: 1).animate(opacityController);

    //start the slide animation as soon as the page loads
    controller.forward();

    appBarController = AnimationController(
        duration: const Duration(milliseconds: 500),
        reverseDuration: const Duration(milliseconds: 200),
        vsync: this);
    appBarAnimation = Tween<double>(begin: 0, end: 1).animate(appBarController);

    // adding the play animation in transition to the slide
    // when the slide animation reaches the end
    // we start the play animation

    dragController.addListener(() {
      var pixel = dragController.pixelsToSize(dragController.pixels);

      if (pixel > 0.51) {
        opacityController.reverse();
      } else {
        opacityController.forward();
      }

      print(pixel);

      if (pixel == 0.9) {
        appBarController.forward();
      } else if (pixel < 0.9) {
        appBarController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          leading: AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color.fromARGB(80, 30, 30, 30),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
                child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            )),
          ),
          backgroundColor: Colors.transparent,
          title: AnimatedBuilder(
              animation: appBarController,
              builder: (context, child) {
                return Opacity(
                  opacity: appBarAnimation.value,
                  child: Center(
                    child: Column(
                      children: [
                        Text(widget.item.title),
                        Text(widget.item.runtime),
                      ],
                    ),
                  ),
                );
              }),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.0),
              ],
            )),
          ),
          actions: [Icon(Icons.bookmark_outlined)],
        ),
        body: Stack(
          children: [
            Hero(
              tag: widget.item.id,
              child: Image.network(widget.item.poster_url,
                  height: MediaQuery.of(context).size.height / 1.7,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth),
            ),
            AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  // using an draggableScrollableSheet for the panel with drag animation
                  // using animated builder to animate the movie as the page loads.
                  return DraggableScrollableSheet(
                    controller: dragController,
                    initialChildSize: slideAnimation.value,
                    maxChildSize: 0.9,
                    minChildSize: slideAnimation.value,
                    builder: (context, scrollController) {
                      return Container(
                        padding: const EdgeInsets.only(top: 34),
                        decoration: const BoxDecoration(
                            border: Border(top: BorderSide.none),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                            color: Colors.white),
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: SingleChildScrollView(
                              controller: scrollController, child: child!),
                        ),
                      );
                    },
                  );
                },
                child: MoviePanelInfoWidgets(
                  item: widget.item,
                )),
            const Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: MovieInfoBottomNavButton()),
            Positioned.fill(
              top: MediaQuery.of(context).size.height / 2.4,
              child: AnimatedBuilder(
                animation: opacityController,
                builder: (context, child) {
                  return Opacity(
                      opacity: opacityAnimation.value,
                      child: const PlayButton());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
