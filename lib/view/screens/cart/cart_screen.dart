import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/utils/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        child: Center(
          child: Text("Cart Screen",style: titleMediumOpenSans),
        ),
      ),
    );
  }
}
