import 'package:store_app/core/network/api_result.dart';
import 'package:store_app/core/network/api_service.dart';

import '../../../../core/network/api_error_handler.dart';
import '../models/products_model.dart';

class HomeRepo{
  final ApiService _apiService;

  HomeRepo(this._apiService);


  Future<ApiResult<ProductsModel>>getAllProducts() async{
    try {
      final response = await _apiService.getallProducts();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}