import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';

class PanelWidget extends ConsumerWidget {
  const PanelWidget({Key? key, required this.controller, required this.item})
      : super(key: key);

  final ScrollController controller;
  final Movie item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          heightFactor: 1,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.black),
          ),
        ),
      ],
    );
  }
}
