class Redirects {
  int index;
  String from;
  String to;

  Redirects({this.index, this.from, this.to});

  Map<String, dynamic> toJson() {
    return {
      "index": this.index,
      "from": this.from,
      "to": this.to,
    };
  }
  factory Redirects.fromJson(Map<String, dynamic> json) {
    return Redirects(
      index: json["index"],
      from: json["from"],
      to: json["to"],
    );
  }
}
