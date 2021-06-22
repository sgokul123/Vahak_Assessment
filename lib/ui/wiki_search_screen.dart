import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vahak_assessment/controller/wiki_search_controller.dart';
import 'package:vahak_assessment/ui/wiki_web_view.dart';
import 'package:vahak_assessment/utils/search_wiki_input.dart';

class WikiSearchScreen extends StatelessWidget {
  WikiSearchController _wikiSearchController;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<WikiSearchController>(
        () => WikiSearchController(context: context));
    return WillPopScope(
      onWillPop: () {
        return null;
      },
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Wiki Search",
                style: Theme.of(context).textTheme.headline5),
            backgroundColor: Colors.redAccent,
          ),
          body: GetX<WikiSearchController>(
              initState: (state) => Get.find<WikiSearchController>(),
              builder: (_controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      color: Colors.redAccent,
                      child: SearchWikiInput(
                        hint: "Input Search Key",
                        textEditingController: _controller.searchController,
                        context: context,
                        onValueChanged: (newValue) {
                          _controller.clearList();
                        },
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: (_controller.mySearchResult != null &&
                              _controller.mySearchResult.length > 0)
                          ? Container(
                              padding: EdgeInsets.only(left: 5.0, right: 5.0),
                              child: ListView.builder(
                                itemCount: _controller.mySearchResult.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                      onTap: () {
                                        Get.to(() => WikiWebView(_controller
                                            .mySearchResult[index]?.title
                                            .toString()
                                            .replaceAll(" ", "_")));
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(top: 5),
                                        child: Card(
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 60,
                                                height: 60,
                                                child: Image.network(
                                                  _controller
                                                          .mySearchResult[index]
                                                          .thumbnail
                                                          ?.source ??
                                                      "https://picsum.photos/seed/picsum/200/300",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Text(
                                                        _controller
                                                            .mySearchResult[
                                                                index]
                                                            ?.title,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline6,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 10.0),
                                                      child: Visibility(
                                                        visible: _controller
                                                                    .mySearchResult[
                                                                        index]
                                                                    ?.terms !=
                                                                null &&
                                                            _controller
                                                                    .mySearchResult[
                                                                        index]
                                                                    ?.terms
                                                                    ?.description !=
                                                                null,
                                                        child: Text(
                                                          _controller
                                                                      .mySearchResult[
                                                                          index]
                                                                      ?.terms
                                                                      ?.description !=
                                                                  null
                                                              ? _controller
                                                                  .mySearchResult[
                                                                      index]
                                                                  ?.terms
                                                                  ?.description[0]
                                                              : "",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            )
                          : _controller.showPlaceHolder ?? false
                              ? Container(
                                  color: Colors.white,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        /*Image(
                                          image: AssetImage(
                                              "AppImages.myLeadLogo"),
                                          width: 210.0,
                                        ),*/
                                        SizedBox(height: 10.0),
                                        Text(
                                          "No result found for search key",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : SizedBox(),
                    )),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
