import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/carousel.dart';

class HomeFeedPage extends ConsumerWidget {
  const HomeFeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: const [
          Icon(Icons.movie),
          Text(
            "Movies",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: const [RecentCarousel()]),
      ),
    );
  }
}
