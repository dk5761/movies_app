import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/horizontal_image_list.dart';

class MoviePanelInfoWidgets extends ConsumerWidget {
  const MoviePanelInfoWidgets({Key? key, required this.item}) : super(key: key);

  final Movie item;

  final text =
      """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.""";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const SizedBox(
                height: 8,
              ),
              Wrap(
                children: item.categories
                    .map((e) => Text(
                          "$e,",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 180, 175, 175),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Runtime : ${item.runtime}",
                style: const TextStyle(
                    color: Color.fromARGB(255, 180, 175, 175),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 22, right: 22),
          child: Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 83, 83, 83),
                fontSize: 20,
                fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        HorizonalImageList(
          item: item,
          title: "Movie Snapshots :",
        ),
        const SizedBox(
          height: 70,
        )
      ],
    );
  }
}
