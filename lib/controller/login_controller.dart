import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nhs/data/model/response_model.dart';
import 'package:nhs/data/repository/auth_repo.dart';
import 'package:nhs/helper/route_helper.dart';

class LoginController extends GetxController implements GetxService {

  final AuthRepo authRepo;
  LoginController({required this.authRepo});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

   Future<ResponseModel> login(String email, String password) async {
    // if (emailController.text.isEmpty || !emailController.text.isEmail) {
    //   if(emailController.text.isEmpty) {
    //     showCustomSnackBar('please enter the email');
    //   }else if(!emailController.text.isEmail) {
    //     showCustomSnackBar('please enter valid email');
    //   }
    // }else if (passwordController.text.isEmpty) {
    //   showCustomSnackBar('please enter the password');
    // }
    // else {
      _isLoading = true;
      update();
      Response response = await authRepo.login(username: email, password: password);
      ResponseModel responseModel;
      if (response.statusCode == 200) {
        authRepo.saveUserToken(response.body['token']);
        await authRepo.updateToken();
        responseModel = ResponseModel(true, '${response.body['token']}');
      } else {
        responseModel = ResponseModel(false, response.statusText!);
      }
      _isLoading = false;
      update();
      return responseModel;
    // }
  }

  Future<void> updateToken() async {
    await authRepo.updateToken();
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

}
