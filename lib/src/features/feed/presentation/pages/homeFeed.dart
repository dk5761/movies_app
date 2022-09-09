import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/carousel.dart';

class HomeFeedPage extends ConsumerWidget {
  const HomeFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(children: const [
          Icon(
            Icons.movie,
            color: Colors.black,
          ),
          Text(
            "Movies",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Carousel(
              title: "Recents",
            ),
            Container()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width * .155,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(14), topRight: Radius.circular(14))),
        child: const GNav(
          tabBackgroundColor: Color.fromARGB(255, 245, 245, 245),
          gap: 8,
          activeColor: Colors.black,
          padding: EdgeInsets.all(10),
          tabs: [
            GButton(
              icon: Icons.feed_outlined,
              text: "Feed",
            ),
            GButton(
              icon: Icons.bookmark_outline,
              text: "BookMarks",
            ),
            GButton(
              icon: Icons.person_outline,
              text: "Profile",
            )
          ],
        ),
      ),
    );
  }
}
