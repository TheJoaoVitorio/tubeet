import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tube/models/video_model/video_model.dart';

class VideoCard extends StatefulWidget {
  const VideoCard({Key? key, required this.video}) : super(key: key);

  final VideoModel video;

  @override
  State<VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  double _elevationShadow = 3.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MouseRegion(
          onEnter: (event) {
            setState(() {
              _elevationShadow = 10.0;
            });
          },
          onExit: (event) {
            setState(() {
              _elevationShadow = 3.0;
            });
          },
          child: SizedBox(
            width: 350,
            height: 320,
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
                  Image.network(
                    widget.video.thumbnail ??
                        'https://i.ytimg.com/vi/h8-qemIbXbo/maxresdefault.jpg',
                    width: 350,
                    height: 180,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          width: 350,
                          height: 180,
                          color: Colors.grey[800],
                          child: const Center(child: Icon(Icons.error)),
                        ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      widget.video.title,
                      style: GoogleFonts.oswald(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.video.channelTitle,
                            style: GoogleFonts.oswald(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        Row(
                          children: [
                            const Icon(
                              Icons.visibility,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.video.viewCount,
                              style: GoogleFonts.oswald(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.thumb_up,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              widget.video.likeCount,
                              style: GoogleFonts.oswald(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
