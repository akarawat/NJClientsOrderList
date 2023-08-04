class FeedbackForm {
  String val1;
  String val2;
  String val3;
  String val4;
  String val5;
  String val6;
  String val7;
  String val8;
  String val9;
  String val10;
  String val11;
  String val12;
  String val13;
  String val14;
  String val15;
  String val16;
  String val17;
  String val18;
  String val19;
  String val20;
  String val21;
  String val22;
  String val23;
  String val24;

  //min_humid, max_humid, min_temp, max_temp, min_ec, max_ec
  FeedbackForm(
      this.val1,
      this.val2,
      this.val3,
      this.val4,
      this.val5,
      this.val6,
      this.val7,
      this.val8,
      this.val9,
      this.val10,
      this.val11,
      this.val12,
      this.val13,
      this.val14,
      this.val15,
      this.val16,
      this.val17,
      this.val18,
      this.val19,
      this.val20,
      this.val21,
      this.val22,
      this.val23,
      this.val24);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm(
        "${json['val1']}",
        "${json['val2']}",
        "${json['val3']}",
        "${json['val4']}",
        "${json['val5']}",
        "${json['val6']}",
        "${json['val7']}",
        "${json['val8']}",
        "${json['val9']}",
        "${json['val10']}",
        "${json['val11']}",
        "${json['val12']}",
        "${json['val13']}",
        "${json['val14']}",
        "${json['val15']}",
        "${json['val16']}",
        "${json['val17']}",
        "${json['val18']}",
        "${json['val19']}",
        "${json['val20']}",
        "${json['val21']}",
        "${json['val22']}",
        "${json['val23']}",
        "${json['val24']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'val1': val1,
        'val2': val2,
        'val3': val3,
        'val4': val4,
        'val5': val5,
        'val6': val6,
        'val7': val7,
        'val8': val8,
        'val9': val9,
        'val10': val10,
        'val11': val11,
        'val12': val12,
        'val13': val13,
        'val14': val14,
        'val15': val15,
        'val16': val16,
        'val17': val17,
        'val18': val18,
        'val19': val19,
        'val20': val20,
        'val21': val21,
        'val22': val22,
        'val23': val23,
        'val24': val24
      };
}
