import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/data/feed_repo.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/carouselItem.dart';

class Carousel extends ConsumerStatefulWidget {
  const Carousel({Key? key, this.title = ""}) : super(key: key);

  final String title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CarouselState();
}

class _CarouselState extends ConsumerState<Carousel> {
  late PageController _pageController;
  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allMovies = ref.watch(allMoviesProvider);
    final size = MediaQuery.of(context).size;
    final height = size.height / 1.6;
    final width = size.width / 1.75;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != "")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              widget.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
          ),
        allMovies.when(
            data: (data) {
              return ConstrainedBox(
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                constraints: BoxConstraints(maxHeight: height),

                // width: width,
                child: PageView.builder(
                  pageSnapping: true,
                  controller: _pageController,
                  itemCount: data.length,
                  onPageChanged: (page) {
                    setState(() {
                      activePage = page;
                    });
                  },
                  itemBuilder: (context, index) {
                    return CarouselItem(
                      item: data[index],
                      active: index == activePage,
                    );
                    // return Container(
                    //   margin: const EdgeInsets.all(10),
                    //   child: Image.network(data[index].poster_url),
                    // );
                  },
                ),
              );
            },
            error: (error, _) => Text(error.toString()),
            loading: () => const CircularProgressIndicator())
      ],
    );
  }
}
