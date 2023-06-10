import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/controller/login_controller.dart';
import 'package:nhs/theme/light_theme.dart';
import 'package:nhs/utils/dimensions.dart';
import 'package:nhs/utils/images.dart';
import 'package:nhs/utils/styles.dart';
import 'package:nhs/view/base/custom_button.dart';
import 'package:nhs/view/base/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (loginController) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: context.width,
                    height: context.height * 0.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          light().backgroundColor,
                          light().primaryColor,
                          light().primaryColor,
                          light().primaryColor,
                        ],
                        begin: const FractionalOffset(0.0, 0.0),
                        end: const FractionalOffset(3.0, 0.0),
                      ),
                    ),
                    child: Center(child: Image.asset(Images.logo)),
                  ),
                  Positioned(
                    bottom: Dimensions.paddingSizeLarge,
                    left: Dimensions.paddingSizeVeryLarge,
                    child: Text("Log In", style: titleBoldOpenSans.copyWith(
                        color: light().cardColor),
                    ),
                  ),

                ],
              ),
              Container(
                width: context.width,
                height: context.height * 0.5,
                color: light().cardColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions
                      .paddingSizeVeryLarge,
                      vertical: Dimensions.paddingSizeMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        hintText: 'Email',
                        controller: loginController.emailController,
                        focusNode: loginController.emailFocus,
                        nextFocus: loginController.passwordFocus,
                        textAlignVertical: TextAlignVertical.center,
                        inputType: TextInputType.emailAddress,
                        isPassword: false,
                        suffixIcon: Icons.check_circle_outline,
                      ),
                      const SizedBox(
                          height: Dimensions.paddingSizeVeryLarge),
                      CustomTextField(
                        hintText: 'Password',
                        controller: loginController.passwordController,
                        focusNode: loginController.passwordFocus,
                        textAlignVertical: TextAlignVertical.center,
                        inputAction: TextInputAction.done,
                        inputType: TextInputType.visiblePassword,
                        isPassword: true,
                        onSubmit: (text) =>   loginController.login(
                            loginController.emailController.text,
                            loginController.passwordController.text) ,
                      ),
                      const SizedBox(height: Dimensions.paddingSizeLarge),
                      CustomButton(
                        width: context.width,
                        height: 74,
                        text: "Continue",
                        loading: loginController.isLoading,
                        textStyle: titleBoldSFPRODISPLAY.copyWith(
                            color: light().cardColor),
                        radius: Dimensions.veryLargeSizeRadius,
                        onPressed: () {
                          loginController.login(
                              loginController.emailController.text,
                              loginController.passwordController.text);
                        },
                      ),
                      const SizedBox(height: Dimensions.paddingSizeVeryLarge),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("NEED HELP?",
                            style: titleMediumSFPRODISPLAY.copyWith(
                                color: Colors.black.withOpacity(0.65)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

