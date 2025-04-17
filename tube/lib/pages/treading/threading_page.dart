import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tube/components/video_card/video_card.dart';
import 'package:tube/models/video_model/video_model.dart';

class Threadingpage extends StatefulWidget {
  const Threadingpage({super.key});

  @override
  State<Threadingpage> createState() => _ThreadingpageState();
}

class _ThreadingpageState extends State<Threadingpage> {
  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet =
        MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1200;
    final isDesktop = MediaQuery.of(context).size.width >= 1200;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            pinned: true,
            floating: false,
            expandedHeight: 50,
            flexibleSpace: FlexibleSpaceBar(
              title: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.lightBlue,
                  child: Icon(Icons.whatshot, size: 28),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                title: Text("Em alta", style: TextStyle(fontSize: 28)),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth:
                      isMobile
                          ? 300
                          : isTablet
                          ? 800
                          : 1100, 
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        isMobile
                            ? 1
                            : isTablet
                            ? 2
                            : 3,
                    childAspectRatio:
                        isMobile
                            ? 1.2
                            : isTablet
                            ? 1.1
                            : 0.93,
                    crossAxisSpacing: isMobile ? 16 : 25,
                    mainAxisSpacing: isMobile ? 12 : 18,
                  ),
                  itemCount: 22,
                  itemBuilder: (BuildContext context, int index) {
                    return VideoCard(
                      video: VideoModel(
                        id: "$index",
                        title: "Título do vídeo $index asdadsdADASDASADA",
                        channelId: "2",
                        channelTitle: "Canal do vídeo",
                        thumbnail: "https://via.placeholder.com/150",
                        description: "Descrição do vídeo",
                        viewCount: "1200",
                        likeCount: "100",
                        publishedAt: "2023-10-01T00:00:00Z",
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
