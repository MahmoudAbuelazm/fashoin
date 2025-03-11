import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


import '../../features/home/data/models/products_model.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.allProducts)
  Future<ProductsModel> getallProducts();
}
