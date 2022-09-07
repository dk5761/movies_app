import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/common/test.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';

class CarouselItem extends ConsumerWidget {
  const CarouselItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final height = size.height / 2;
    final width = size.width / 1.75;

    final storageUrl =
        'https://firebasestorage.googleapis.com/v0/b/flutter-app-data.appspot.com/o/';

    final item = Movie.fromJson(carouselData[0]);

    getURL(String imageName) async {
      final fRef = FirebaseStorage.instance
          .ref()
          .child(item.title)
          .child("${imageName}.jpg");

      return await fRef.getDownloadURL();
    }

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      height: height,
      width: width,
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutter-app-data.appspot.com/o/${item.title}/poster.jpg",
                height: size.height / 1.7,
                width: double.infinity,
              ),
            ),
          ),
          Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: item.categories
                .map((e) => Text(
                      e,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 180, 175, 175),
                          fontSize: 14),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
