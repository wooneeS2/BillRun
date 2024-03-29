import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'deal_list_service.dart';
import 'package:bilrun/model/deal_list_model.dart';

class LendDealListController extends GetxController {
  static var isLoading = true.obs;
  // ignore: deprecated_member_use
  static var dealLists = List<DealList>().obs;
  static String nowStatus;

  @override
  void onInit() {
    dealFetchList('rent_deal_list');
    super.onInit();
  }

  static Future dealFetchList(String status) async {
    try {
      isLoading(true);
      var dealList = await DealListService.fetchDealList('$status');

      if (dealList != null) {
        dealLists.value = dealList;
      } else if (dealList == null) {
        print('error');
        return Scaffold(
          body: Column(
            children: [Text('데이터 로드 실패')],
          ),
        );
      }
    } finally {
      isLoading(false);
    }
  }
}
