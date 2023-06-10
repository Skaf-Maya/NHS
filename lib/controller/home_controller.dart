import 'package:get/get.dart';
import 'package:nhs/data/model/all_products_model.dart';
import 'package:nhs/data/repository/all_products_repo.dart';

class HomeController extends GetxController implements GetxService {
  final AllProductsRepo allProductsRepo;
  HomeController({required this.allProductsRepo});

  List<AllProductsModdel>? _allProductsModel;

  List<AllProductsModdel> get allProductsList => _allProductsModel!;

  Future<void> getAllProductsList({bool allProducts = false}) async {
    if(_allProductsModel == null) {
      _allProductsModel = [];
      Response response = await allProductsRepo.getAllProductsList(allProducts);
      if (response.statusCode == 200) {
        response.body.forEach((products) {
          _allProductsModel!.add(AllProductsModdel.fromJson(products));
        });
        // print(allProductsList.length);
        // print('---------done---------------');
      } else {
        _allProductsModel = [];
      }
      update();
    }
  }
}
