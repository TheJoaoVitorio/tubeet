import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:tube/components/video_card/video_card.dart';
import 'package:tube/models/video_model/video_model.dart';
import 'package:tube/services/api_youtube/api_youtube.dart';

class Threadingpage extends StatefulWidget {
  const Threadingpage({super.key});

  @override
  State<Threadingpage> createState() => _ThreadingpageState();
}

class _ThreadingpageState extends State<Threadingpage> {

  final ApiYoutubeService apiYoutubeService = ApiYoutubeService();

  List<VideoModel> _videos = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    try {
      final resultFetch = await apiYoutubeService.getMostPopularVideos();
      setState((){
        _videos = resultFetch;
        _isLoading = false;
      });
    } catch (e){
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if(_isLoading){
      return const Center(child: CircularProgressIndicator(),);
    }

    if (_errorMessage.isNotEmpty) {
      return Center(child: Text('Erro: $_errorMessage'));
    }


    final isMobile = MediaQuery.of(context).size.width < 600;
    final isTablet = MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1200;
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
                  itemCount: _videos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VideoCard(video: _videos[index]);
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
