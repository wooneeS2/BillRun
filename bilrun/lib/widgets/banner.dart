import 'package:bilrun/design/usedColors.dart';

import 'package:bilrun/screens/product_detail/service/product_detail_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';

class DetailBanner extends StatefulWidget {
  @override
  _DetailBannerState createState() => _DetailBannerState();
}

class _DetailBannerState extends State<DetailBanner> {
  DetailProductController detailController = Get.put(DetailProductController());

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          CarouselSlider(
            items: productImgList.map((e) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    child: Container(
                      width: Get.width,
                      height: Get.width * 1.11,
                      child: Image.network(
                        e,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: Get.height * 0.272,
              aspectRatio: 3,
              enlargeCenterPage: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  print(_current);
                });
              },
            ),
          ),
          Positioned(
              bottom: 10,
              left: 180,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: productImgList.map((url) {
                  int index = productImgList.indexOf(url);
                  return current == index
                      ? Container(
                          width: 18.0,
                          height: 6.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(3),
                            color: mainRed,
                          ),
                        )
                      : Container(
                          width: 6,
                          height: 6,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: mainGrey,
                          ),
                        );
                }).toList(),
              )),
        ],
      ),
    );
  }
}
