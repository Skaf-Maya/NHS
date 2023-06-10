import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nhs/utils/styles.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        child: Center(
          child: Text("Wishlist Screen",style: titleMediumOpenSans),
        ),
      ),
    );
  }
}
