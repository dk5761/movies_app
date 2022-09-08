import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/utils/scroll_configuration.dart';

import '../../domain/movie.dart';

class SliverPage extends ConsumerStatefulWidget {
  const SliverPage({Key? key, required this.item, required this.context})
      : super(key: key);
  final Movie item;
  final BuildContext context;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SliverPageState();
}

class _SliverPageState extends ConsumerState<SliverPage>
    with TickerProviderStateMixin {
  late Animation<double> slideAnimation;
  late AnimationController controller;
  late AnimationController opacityController;

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
        duration: const Duration(milliseconds: 1500), vsync: this);
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

    // adding the play animation in transition to the slide
    // when the slide animation reaches the end
    // we start the play animation

    controller.addListener(() {
      if (slideAnimation.value == 0.5) {
        opacityController.forward();
      }
    });

    dragController.addListener(() {
      var pixel = dragController.pixelsToSize(dragController.pixels);

      if (pixel > 0.51) {
        opacityController.reverse();
      } else {
        opacityController.forward();
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
                  return DraggableScrollableSheet(
                    controller: dragController,
                    initialChildSize: slideAnimation.value,
                    maxChildSize: 0.9,
                    minChildSize: slideAnimation.value,
                    builder: (context, scrollController) {
                      scrollController.addListener(() {
                        print(scrollController.position);
                      });
                      return Container(
                        // height: MediaQuery.of(context).size.height * 0.9 -
                        // MediaQuery.of(context).viewPadding.top,
                        padding:
                            const EdgeInsets.only(left: 26, right: 26, top: 34),
                        decoration: const BoxDecoration(
                            border: Border(top: BorderSide.none),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                            color: Colors.white),
                        child: ScrollConfiguration(
                          behavior: MyBehavior(),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.item.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Wrap(
                                  children: widget.item.categories
                                      .map((e) => Text(
                                            "$e,",
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 180, 175, 175),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Runtime : ${widget.item.runtime}",
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 180, 175, 175),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  text,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 83, 83, 83),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 15),
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: const Text(
                        "Buy Ticket",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned.fill(
              // left: 0,
              // right: 0,
              top: MediaQuery.of(context).size.height / 2.45,
              child: AnimatedBuilder(
                  animation: opacityController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: opacityAnimation.value,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(255, 255, 255, 255),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 12),
                                  color: Colors.grey,
                                  blurRadius: 15.0,
                                  spreadRadius: -10)
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.2,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: const Center(
                              child: Icon(
                            Icons.play_arrow_outlined,
                            size: 42,
                          )),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
