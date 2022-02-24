import 'package:dio/dio.dart';
import 'package:dio_character_test/core/models/base_model.dart';

class NetworkManager {
  final _baseUrl = "https://rickandmortyapi.com/api";
  static NetworkManager? _instance;
  static NetworkManager get instance {
    if (_instance != null) return _instance!;
    _instance = NetworkManager._init();
    return _instance!;
  }

  late final Dio dio;

  NetworkManager._init() {
    dio = Dio(BaseOptions(baseUrl: _baseUrl));
    dio.interceptors.add(InterceptorsWrapper(
      onResponse: (e, handler) {
        final data = e.data;
        if (data is Map<String, dynamic>) {
          final model = BaseModel.fromJson(data);
          if (model.count == 0) {
            handler.reject(DioError(
              requestOptions: RequestOptions(path: e.realUri.path),
            ));
            return;
          }
          e.data = data["results"];
        }
        handler.next(e);
      },
    ));
  }
}
