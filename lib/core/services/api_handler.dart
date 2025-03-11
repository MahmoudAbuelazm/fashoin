import 'package:http/http.dart' as http;
import 'package:store_app/core/services/api_consts.dart' show baseApiUrl;

class ApiHandler {
  Future<void> getAllProducts() async {
    var uri = Uri.https(
      baseApiUrl,
      '/api/v1/products',
    );
    var response = await http.get(uri);
  }
}
