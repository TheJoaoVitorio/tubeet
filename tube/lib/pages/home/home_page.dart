import 'package:flutter/material.dart';
import 'package:tube/components/carousel_card/carousel_card.dart';
import 'package:tube/components/carousel_circle_card/carousel_circle_card.dart';
import 'package:tube/components/video_card/video_card.dart';
import 'package:tube/models/video_model/video_model.dart';
import 'package:tube/services/api_youtube/api_youtube.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiYoutubeService apiYoutubeService = ApiYoutubeService();

  List<VideoModel> _videosCategory = [];
  List<VideoModel> _videos = [];
  List<String> categories = [
    'Viagem',
    'Games',
    'Programação',
    'Esporte',
    'Música',
    'Counter-Strike 2',
    'Samba',
    'Memes',
    'Unboxing',
  ];

  bool _isLoading = true;
  bool _isCategoryLoading = false; // Novo loading específico para categorias
  String _categorySelected = '';
  String _errorMessage = '';
  int _selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _fetchTrailers();
    _categorySelected = categories[0];
    _fetchCategory(_categorySelected);
  }

  @override
  void dispose() {
    _videos.clear();
    _videosCategory.clear();
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

  Future<void> _fetchCategory(String category) async {
    setState(() {
      _isCategoryLoading = true;
    });

    try {
      final resultFetch = await apiYoutubeService.getVideosWithCategory(
        category,
      );
      setState(() {
        _videosCategory = resultFetch;
        _isCategoryLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _isCategoryLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage.isNotEmpty) {
      return Center(child: Text('Erro: $_errorMessage'));
    }

    return SingleChildScrollView( 
      padding: const EdgeInsets.all(18),
      child: Column( 
        children: [
          CarouselCard(videos: _videos),
          const SizedBox(height: 20),

          CarouselCircleCard(
            items: categories,
            initialSelectedIndex: _selectedCategoryIndex,
            onItemSelected: (itemIndex) {
              setState(() {
                _selectedCategoryIndex = itemIndex;
                _categorySelected = categories[itemIndex];
              });
              _fetchCategory(_categorySelected);
            },
          ),
          const SizedBox(height: 20),
          
          
          _isCategoryLoading
              ? const Center(child: CircularProgressIndicator())
              : GridView.builder(
                  shrinkWrap: true, 
                  physics: const NeverScrollableScrollPhysics(), 
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 1200
                        ? 3
                        : MediaQuery.of(context).size.width > 800
                            ? 3
                            : 1,
                    childAspectRatio: 16 / 12,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: _videosCategory.length,
                  itemBuilder: (context, index) {
                    return VideoCard(video: _videosCategory[index]);
                  },
                ),
        ],
      ),
    );
  }
}
