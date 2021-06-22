import 'package:vahak_assessment/model/terms.dart';
import 'package:vahak_assessment/model/thumbnail.dart';

class Pages {
  int pageid;
  int ns;
  String title;
  int index;
  Thumbnail thumbnail;
  Terms terms;

  Map<String, dynamic> toJson() {
    return {
      "pageid": this.pageid,
      "ns": this.ns,
      "title": this.title,
      "index": this.index,
      "thumbnail": this.thumbnail,
      "terms": this.terms,
    };
  }

  Pages(
      {this.pageid,
      this.ns,
      this.title,
      this.index,
      this.thumbnail,
      this.terms});

  factory Pages.fromJson(Map<String, dynamic> json) {
    return Pages(
      pageid: json["pageid"],
      ns: json["ns"],
      title: json["title"],
      index: json["index"],
      thumbnail: Thumbnail.fromJson(json["thumbnail"]),
      terms: Terms.fromJson(json["terms"]),
    );
  }
}
