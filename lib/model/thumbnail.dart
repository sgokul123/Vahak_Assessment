class Thumbnail {
  String source;
  int width;
  int height;

  Thumbnail({this.source, this.width, this.height});

  Map<String, dynamic> toJson() {
    return {
      "source": this.source,
      "width": this.width,
      "height": this.height,
    };
  }

  factory Thumbnail.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      return Thumbnail(
        source: json["source"],
        width: json["width"],
        height: json["height"],
      );
    } else
      return null;
  }
}
