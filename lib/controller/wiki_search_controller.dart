import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:vahak_assessment/model/pages.dart';
import 'package:vahak_assessment/model/wiki_query.dart';
import 'package:vahak_assessment/repository/api_repository.dart';

class WikiSearchController extends GetxController {
  final _mySearchResult = List<Pages>.empty(growable: true).obs;
  TextEditingController searchController = TextEditingController();
  final _showPlaceHolder = true.obs;
  BuildContext context;
  APIRepository _apiRepository = Get.find();

  WikiSearchController({this.context});

  get showPlaceHolder => this._showPlaceHolder.value;

  set showPlaceHolder(value) => this._showPlaceHolder.value = value;

  get mySearchResult => this._mySearchResult.value;

  set mySearchResult(value) => this._mySearchResult.assignAll(value);

  void callIMDSearchLeadApi(
      {BuildContext context,
      String strRequest,
      operation,
      Function searchWikiResponse}) {
    _apiRepository.callAPIService(
        context: context,
        strRequest: strRequest,
        searchWikiResponse: (WikiQuery wikiQuery) {
          List<Pages> _leadList = List<Pages>.empty(growable: true);
          for (Pages item in wikiQuery.pages) {
            _leadList.add(item);
          }
          this.mySearchResult = _leadList;
          this.showPlaceHolder = false;
        },
        searchWikiError: () {
          this.showPlaceHolder = true;
        });
  }

  void clearList() {
    List<Pages> _leadList = List<Pages>.empty(growable: true);
    this.mySearchResult = _leadList;
    this.showPlaceHolder = true;
  }
}
