import 'package:flutter/material.dart';
import 'package:tube/models/video_model/video_model.dart';

class CarouselCircleCard extends StatefulWidget {
  const CarouselCircleCard({super.key});

  //final List<VideoModel> videos;

  @override
  State<CarouselCircleCard> createState() => _CarouselCircleCardState();
}

class _CarouselCircleCardState extends State<CarouselCircleCard> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 50),
      child: CarouselView.weighted(
        flexWeights: const <int>[1, 1, 1, 1, 1],
        consumeMaxWeight: false,
        children: List<Widget>.generate(20, (int index) {
          return ColoredBox(
            color: Colors.primaries[index % Colors.primaries.length],
          );
        }),
      ),
    );
  }
}
