import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tube/models/video_model/video_model.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({
    Key? key,
    required this.video,
    this.width = 300,
    this.height = 300,
  }) : super(key: key);

  final VideoModel video;
  final double width;
  final double height;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  double _elevationShadow = 3.0;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth =
            constraints.maxWidth > widget.width
                ? widget.width
                : constraints.maxWidth;
        final cardHeight = cardWidth * (widget.height / widget.width);

        return Row(
          children: [
            MouseRegion(
              onEnter: (_) => setState(() => _elevationShadow = 10.0),
              onExit: (_) => setState(() => _elevationShadow = 3.0),
              child: SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  elevation: _elevationShadow,
                  shadowColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          widget.video.thumbnail,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) => Container(
                                color: Colors.grey[800],
                                child: const Center(child: Icon(Icons.error)),
                              ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(screenSize.width * 0.02),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                widget.video.title,
                                style: GoogleFonts.oswald(
                                  fontSize: 14 * textScaleFactor,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.video.channelTitle,
                                      style: GoogleFonts.oswald(
                                        fontSize: 14 * textScaleFactor,
                                        color: Colors.grey[600],
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Row(
                                    // mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(
                                        Icons.visibility,
                                        color: Colors.grey,
                                        size: 18 * textScaleFactor,
                                      ),
                                      SizedBox(width: screenSize.width * 0.005),
                                      Text(
                                        formatNumber(widget.video.viewCount),
                                        style: GoogleFonts.oswald(
                                          fontSize: 14 * textScaleFactor,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(width: screenSize.width * 0.01),
                                      Icon(
                                        Icons.thumb_up,
                                        color: Colors.grey,
                                        size: 18 * textScaleFactor,
                                      ),
                                      SizedBox(width: screenSize.width * 0.005),
                                      Text(
                                        formatNumber(widget.video.likeCount),
                                        style: GoogleFonts.oswald(
                                          fontSize: cardWidth * 0.045,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String formatNumber(String number) {
    int value = int.tryParse(number) ?? 0;

    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(1)} mi';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(1)} mil';
    } else {
      return value.toString();
    }
  }
}
