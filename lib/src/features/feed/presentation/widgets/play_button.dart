import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayButton extends ConsumerWidget {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Align(
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
    );
  }
}
