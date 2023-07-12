class NumberTriviaResponse {
  String? text;
  int? number;
  bool? found;
  String? type;

  NumberTriviaResponse({this.text, this.number, this.found, this.type});

  NumberTriviaResponse.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    number = json['number'];
    found = json['found'];
    type = json['type'];
  }
}
