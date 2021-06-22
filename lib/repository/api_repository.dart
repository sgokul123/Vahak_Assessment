import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vahak_assessment/model/wiki_query.dart';
import 'package:vahak_assessment/repository/data_client.dart';
import 'package:vahak_assessment/utils/network_util.dart';
import 'package:vahak_assessment/utils/progres_dialogs.dart';

class APIRepository {
  void callAPIService(
      {BuildContext context,
      String strRequest,
      Function searchWikiResponse,
      Function searchWikiError}) async {
    bool isConnected = await NetworkUtil.isNetworkConnected();
    if (isConnected) {
      ProgressDialogs.showProgressDialog(context);
      String url = "https://en.wikipedia.org/w/api.php?";
      try {
        Response response = await DataClient(url)
            .dio
            .get("https://en.wikipedia.org/w/api.php", queryParameters: {
          'action': 'query',
          'format': 'json',
          'prop': 'pageimages|pageterms',
          'generator': 'prefixsearch',
          'redirects': 1,
          'gpssearch': "$strRequest",
          'formatversion': 2,
          'pilimit': 10,
          'gpslimit': 10,
          'wbptterms': 'description',
          'piprop': 'thumbnail',
          'pithumbsize': 50,
        });
        print(response.data);
        if (response != null && response.statusCode == 200) {
          print("---response---$response");
          Map<String, dynamic> json = response.data;
          WikiQuery wikiQuery = WikiQuery.fromJson(json["query"]);
          print("---response---${wikiQuery.toJson()}.");
          searchWikiResponse(wikiQuery);
        } else {
          searchWikiError();
        }
        ProgressDialogs.hideProgressDialog(context);
      } on Exception catch (e) {
        print(e);
        print("response");
        ProgressDialogs.hideProgressDialog(context);
      }
    }
  }
}
