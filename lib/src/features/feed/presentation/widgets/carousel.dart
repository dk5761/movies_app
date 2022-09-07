import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/src/features/feed/presentation/widgets/carouselItem.dart';

class RecentCarousel extends ConsumerStatefulWidget {
  const RecentCarousel({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecentCarouselState();
}

class _RecentCarouselState extends ConsumerState<RecentCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselItem();
  }
}
