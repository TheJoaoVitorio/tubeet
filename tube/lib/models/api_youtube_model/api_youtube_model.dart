import 'package:tube/config/env_config.dart' as env;
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiYoutubeModel {
  final Uri baseUrl = Uri.parse(env.EnvConfig.apiUrl);
  final _apiKey = env.EnvConfig.apiKey;

  Future<Map<String, dynamic>> getMostPopularVideos() async {
    final url = baseUrl.replace(
      path: '${baseUrl.path}search',
      queryParameters: {
        'part': 'snippet,contentDetails,statistics',
        'regionCode': 'BR',
        'key': _apiKey,
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Erro ao carregar vídeos: ${response.statusCode}");
    }
  }
}
