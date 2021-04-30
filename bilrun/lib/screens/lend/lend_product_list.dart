import 'package:flutter/material.dart';
import 'package:bilrun/model/product_list_model.dart';
import 'package:get/get.dart';
import 'lend_like.dart';
import 'package:bilrun/screens/product_detail/product_detail_main.dart';

class LendProductTile extends StatelessWidget {
  final ProductList lendproduct;
  const LendProductTile(this.lendproduct);

  @override
  Widget build(BuildContext context) {
    switch (lendproduct.priceProp) {
      case "1h":
        lendproduct.priceProp = '시간 당';
        break;
      case "Week":
        lendproduct.priceProp = '주 당';
        break;
      case "Day":
        lendproduct.priceProp = '일 당';
        break;
    }

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: ()=>{ Get.to(DetailScreen(),arguments:lendproduct.id, )},
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width:Get.width*0.417,
                    height:Get.width*0.417,
                    child: Image.network(
                      'https://blog.kakaocdn.net/dn/wqpYE/btqITvqCt4a/xkeX4Gou1Osaz5VWKoiG4k/img.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                  right: 5,
                  child:ProductLike(), ),

              ],
            ),
          ),
          Container(
            width: 150,
            height: 22,
            padding: EdgeInsets.only(top: 3),

            child: Text("${lendproduct.name}",
                style: const TextStyle(
                    color: const Color(0xff191919),
                    fontWeight: FontWeight.w400,
                    fontFamily: "NotoSansCJKkr",
                    fontStyle: FontStyle.normal,
                    fontSize: 14.0),
                textAlign: TextAlign.left),
          ),

          Row(
            children: [

              Container(
                height: 18,
                child: Text("${lendproduct.price}",
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w700,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                height: 22,
                child: Text("원",
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                height: 18,
                child: Text("/${lendproduct.priceProp}",
                    style: const TextStyle(
                        color: const Color(0xff999999),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 12.0),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
          Row(
            children: [
              // CircleAvatar(
              //   backgroundImage: NetworkImage('${lendproduct.user.profile}'),
              //   radius: 16.0,
              // ),
              Container(
                height: 22,
                child: Text('${lendproduct.user.nickname}',
                    style: const TextStyle(
                        color: const Color(0xff191919),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 14.0),
                    textAlign: TextAlign.left),
              ),
              Container(
                height: 16,
                child: Text(" ᛫ 30분 전",
                    style: const TextStyle(
                        color: const Color(0xff999999),
                        fontWeight: FontWeight.w400,
                        fontFamily: "NotoSansCJKkr",
                        fontStyle: FontStyle.normal,
                        fontSize: 10.0),
                    textAlign: TextAlign.left),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
