import 'package:vahak_assessment/model/pages.dart';
import 'package:vahak_assessment/model/redirects.dart';

class WikiQuery {
  List redirects;
  List pages;

  WikiQuery({this.redirects, this.pages});

  Map<String, dynamic> toJson() {
    return {
      "redirects": this.redirects,
      "pages": this.pages,
    };
  }

  factory WikiQuery.fromJson(Map<String, dynamic> json) {
    return WikiQuery(
      redirects: json['redirects'] != null
          ? json['redirects']
              .map((value) => new Redirects.fromJson(value))
              .toList()
          : null,
      pages: json['pages'] != null
          ? json['pages'].map((value) => new Pages.fromJson(value)).toList()
          : null,
    );
  }
}
