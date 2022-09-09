import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';
import 'package:movies_app/src/features/feed/presentation/pages/movie_info.dart';

class CarouselItem extends ConsumerWidget {
  const CarouselItem({Key? key, required this.item, this.active = false})
      : super(key: key);

  final Movie item;
  final bool active;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    double margin = active ? 16 : 34;

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MovieInfoPage(
                    item: item,
                    context: context,
                  )),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
        margin: EdgeInsets.symmetric(horizontal: margin / 2, vertical: margin),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromARGB(255, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                        offset:
                            active ? const Offset(0, 20) : const Offset(0, 0),
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: active ? -12 : -2)
                  ],
                ),
                duration: const Duration(seconds: 1),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Hero(
                    tag: item.id,
                    child: Image.network(item.poster_url,
                        height: size.height / 1.7,
                        width: double.infinity,
                        fit: BoxFit.cover, loadingBuilder:
                            (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              item.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: active
                      ? Colors.black
                      : Color.fromARGB(255, 130, 128, 128)),
            ),
            Wrap(
              children: item.categories
                  .map((e) => Text(
                        "$e,",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 180, 175, 175),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
