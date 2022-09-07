import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../widgets/panel.dart';

class MovieInfoPage extends ConsumerWidget {
  const MovieInfoPage({Key? key, required this.item}) : super(key: key);

  final Movie item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Hero(
                tag: item.id,
                child: Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height / 1.7,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(item.poster_url))),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height / 1.9,
              child: Container(
                padding: const EdgeInsets.only(left: 26, right: 26, top: 34),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.white),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 28),
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
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        item.description,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 83, 83, 83),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
              ),
            ),
            Positioned.fill(
              // left: 0,
              // right: 0,
              top: MediaQuery.of(context).size.height / 2.14,
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
            ),
          ],
        ));
  }
}
