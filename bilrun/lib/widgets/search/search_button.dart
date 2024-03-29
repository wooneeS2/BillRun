import 'package:flutter/material.dart';
import 'package:bilrun/widgets/search/search.dart';
import 'package:get/get.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.search),
        iconSize: 25.0,
        color: Colors.black,
        onPressed: () {
          Get.to(() => SearchbarScreen());
        });
  }
}
