class Terms {
  List description;

  Terms({this.description});

  Map<String, dynamic> toJson() {
    return {
      "description": this.description,
    };
  }

  factory Terms.fromJson(Map<String, dynamic> json) {
    if(json!=null)
    {
      return Terms(
        description: json['description'] != null
            ? json['description'].map((value) => value).toList()
            : null,
      );
    }else return null;
  }
//

}
