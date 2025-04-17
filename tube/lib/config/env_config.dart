import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static String get apiUrl {
    final url = dotenv.env['API_URL'];
    assert(url != null && url.isNotEmpty, 'API_URL não carregada!');
    return url!;
  }

  static String get apiKey {
    final key = dotenv.env['API_KEY'];
    assert(key != null && key.isNotEmpty, 'API_KEY não carregada!');
    return key!;
  }
}
