import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:bilrun/screens/lend/lend_service.dart';
import 'package:bilrun/model/product_list_model.dart';





class LendProductController extends GetxController {

static  var isLoading = true.obs;
  // ignore: deprecated_member_use
static  var productList = List<ProductList>().obs;
  // ignore: deprecated_member_use
static  var newProductList = List<ProductList>().obs;






  @override
  void onInit() {
    fetchProducts();
    super.onInit();
    print("onit 실행됨");
  }



static  Future  fetchProducts() async {
    try {
      isLoading(true);
      var products = await ProductListService.fetchLendProducts();

      if (products != null) {
        productList.value = products;
        print("컨트롤러 실행됨");

      }
      else if(products == null){
        print('error');
        return Scaffold(
          body: Column(
            children: [
              Text('데이터 로드 실패')
            ],
          ),
        );

      }


    } finally {
      isLoading(false);
    }
  }






}

