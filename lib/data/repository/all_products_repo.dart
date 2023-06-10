import 'package:get/get.dart';
import 'package:nhs/data/api/api_client.dart';
import 'package:nhs/utils/app_constants.dart';

class AllProductsRepo {
  final ApiClient apiClient;
  AllProductsRepo({required this.apiClient});

  Future<Response> getAllProductsList(bool allProducts) async {
    return await apiClient.getData(AppConstants.productsUrl, headers: allProducts ? {
      'Content-Type': 'application/json; charset=UTF-8',
    } : null);
  }


}