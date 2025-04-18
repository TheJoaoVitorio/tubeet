import 'package:tube/config/env_config.dart' as env;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tube/models/video_model/video_model.dart';

class ApiYoutubeService {
  final Uri baseUrl = Uri.parse(env.EnvConfig.apiUrl);
  final _apiKey = env.EnvConfig.apiKey;

  Future<List<VideoModel>> getMostPopularVideos() async {
    final url = baseUrl.replace(
      path: '${baseUrl.path}videos',
      queryParameters: {
        'part': 'snippet,contentDetails,statistics',
        'chart': 'mostPopular',
        'maxResults': '30',
        'regionCode': 'BR',
        'key': _apiKey,
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      return items.map((item) => VideoModel.fromMap(item)).toList();
    } else {
      throw Exception("Erro ao carregar vídeos: ${response.statusCode}");
    }
  }


  Future<List<VideoModel>> getTrailersFilms() async {
    final url = baseUrl.replace(
      path: '${baseUrl.path}search',
      queryParameters: {
        'part': 'snippet',
        'maxResults': '10',
        'q': 'Trailers films',
        'regionCode': 'BR',
        'key' : _apiKey
      }
    );

    final response = await http.get(url);

    if (response.statusCode == 200){
      final data = json.decode(response.body);
      final List<dynamic> items = data['items'];
      return items.map( (item) => VideoModel.fromMap(item)).toList();
    }else{
      throw Exception('Erro ao carregar videos: ${response.statusCode}');
    }
  }
}
