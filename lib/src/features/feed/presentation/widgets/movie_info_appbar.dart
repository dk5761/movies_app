import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/domain/movie.dart';

class MovieInfoAppBar extends ConsumerStatefulWidget {
  const MovieInfoAppBar(
      {Key? key,
      required this.item,
      required this.animationController,
      required this.animationValue})
      : super(key: key);

  final Movie item;
  final AnimationController animationController;
  final Animation<double> animationValue;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MovieInfoAppBarState();
}

class _MovieInfoAppBarState extends ConsumerState<MovieInfoAppBar> {
  @override
  Widget build(BuildContext context) {
    double get1st() {
      double value = widget.animationValue.value - 0.6;
      if (value > 1.0) {
        return 1.0;
      } else if (value < 0.0) {
        return 0;
      }
      return value;
    }

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (context, child) {
        return Container(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: [
                Colors.black.withOpacity(widget.animationValue.value),
                Colors.black.withOpacity(get1st()),
                Colors.black.withOpacity(0.0),
              ],
            ),
          ),
          child: child!,
        );
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.only(left: 12),
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
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
          AnimatedBuilder(
            animation: widget.animationController,
            builder: (context, child) {
              return Opacity(
                opacity: widget.animationValue.value,
                child: child,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.item.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.item.runtime,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Icon(Icons.bookmark_outlined)
        ],
      ),
    );
  }
}

// AppBar(
//               // toolbarHeight: 80,

//               elevation: 0,
//               leading: AnimatedContainer(
//                 duration: const Duration(seconds: 1),
//                 margin: const EdgeInsets.all(5),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(80, 30, 30, 30),
//                   borderRadius: BorderRadius.circular(50),
//                 ),
//                 child: Center(
//                     child: InkWell(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Icon(
//                     Icons.arrow_back_ios,
//                     color: Colors.white,
//                   ),
//                 )),
//               ),
//               // backgroundColor: Colors.red,
//               title: AnimatedBuilder(
//                   animation: appBarController,
//                   builder: (context, child) {
//                     return Opacity(
//                       opacity: appBarAnimation.value,
//                       child: Center(
//                         child: Column(
//                           children: [
//                             Text(widget.item.title),
//                             Text(widget.item.runtime),
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//               flexibleSpace: Hero(
//                 tag: widget.item.id,
//                 child: Image.network(widget.item.poster_url,
//                     height: MediaQuery.of(context).size.height / 1.7,
//                     width: double.maxFinite,
//                     fit: BoxFit.fitWidth),
//               ),
//               actions: [Icon(Icons.bookmark_outlined)],
//             ),