class DelRowForm {
  String func;
  String val1;
  String val2;
  //min_humid, max_humid, min_temp, max_temp, min_ec, max_ec
  DelRowForm(this.func, this.val1, this.val2);

  factory DelRowForm.fromJson(dynamic json) {
    return DelRowForm("${json['func']}", "${json['val1']}", "${json['val2']}");
  }
}
