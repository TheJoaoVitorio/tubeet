import 'package:flutter/material.dart';
import 'package:tube/components/carousel_card/carousel_card.dart';
import 'package:tube/components/carousel_circle_card/carousel_circle_card.dart';
import 'package:tube/components/listtile_header/listtile_header.dart';
import 'package:tube/models/video_model/video_model.dart';
import 'package:tube/services/api_youtube/api_youtube.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiYoutubeService apiYoutubeService = ApiYoutubeService();

  List<VideoModel> _videos = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _fetchTrailers();
  }

  @override
  void dispose() {
    _videos.clear();
    super.dispose();
  }

  Future<void> _fetchTrailers() async {
    try {
      final resultFetch = await apiYoutubeService.getTrailersFilms();
      setState(() {
        _videos = resultFetch;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(child: Text('Erro: $_errorMessage'));
    }

    return ListView(
      padding: EdgeInsets.all(18),
      children: [
        ListTitleHeader(titleHeader: 'Filmes', iconLeading: Icons.movie),
        CarouselCard(videos: _videos),
        SizedBox(height: 20),
        ListTitleHeader(titleHeader: 'Canais', iconLeading: Icons.subscriptions),
        CarouselCircleCard(),
      ],
    );
  }
}
