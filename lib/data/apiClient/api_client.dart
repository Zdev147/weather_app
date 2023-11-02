import 'package:task/core/app_export.dart';

class ApiClient {
  static final dio = Dio();

  static get(String api, {Map<String, dynamic>? parameters}) async {
    try {
      final response = await dio.get(api, queryParameters: Map.from(parameters ?? {}));
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
