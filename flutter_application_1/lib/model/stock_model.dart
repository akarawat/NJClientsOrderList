/*
class ResStockData {
  List<String> arrModels = [];

  //min_humid, max_humid, min_temp, max_temp, min_ec, max_ec
  ResStockData(this.arrModels);

  factory ResStockData.fromJson(dynamic json) {
    return ResStockData("${json['arrModels']}" as List<String>);
  }

  // Method to make GET parameters.
  Map toJson() => {'arrModels': arrModels};
}
*/

class Data {
  final String mCode;
  final String mName;
  final String size36;
  final String size36S;
  final String size36R;

  final String size40;
  final String size40S;
  final String size40R;

  final String size42;
  final String size42S;
  final String size42R;

  final String size44;
  final String size44S;
  final String size44R;

  final String size48;
  final String size48S;
  final String size48R;

  final String size52;
  final String size52S;
  final String size52R;

  final String size56;
  final String size56S;
  final String size56R;

  final String sizeM;
  final String sizeMS;
  final String sizeMR;

  final String sizeL;
  final String sizeLS;
  final String sizeLR;

  final String sizeXL;
  final String sizeXLS;
  final String sizeXLR;

  Data(
      {required this.mCode,
      required this.mName,
      required this.size36,
      required this.size36S,
      required this.size36R,
      required this.size40,
      required this.size40S,
      required this.size40R,
      required this.size42,
      required this.size42S,
      required this.size42R,
      required this.size44,
      required this.size44S,
      required this.size44R,
      required this.size48,
      required this.size48S,
      required this.size48R,
      required this.size52,
      required this.size52S,
      required this.size52R,
      required this.size56,
      required this.size56S,
      required this.size56R,
      required this.sizeM,
      required this.sizeMS,
      required this.sizeMR,
      required this.sizeL,
      required this.sizeLS,
      required this.sizeLR,
      required this.sizeXL,
      required this.sizeXLS,
      required this.sizeXLR});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        mCode: json['mCode'],
        mName: json['mName'],
        size36: json['size36'],
        size36S: json['size36S'],
        size36R: json['size36R'],
        size40: json['size40'],
        size40S: json['size40S'],
        size40R: json['size40R'],
        size42: json['size42'],
        size42S: json['size42S'],
        size42R: json['size42R'],
        size44: json['size44'],
        size44S: json['size44S'],
        size44R: json['size44R'],
        size48: json['size48'],
        size48S: json['size48S'],
        size48R: json['size48R'],
        size52: json['size52'],
        size52S: json['size52S'],
        size52R: json['size52R'],
        size56: json['size56'],
        size56S: json['size56S'],
        size56R: json['size56R'],
        sizeM: json['sizeM'],
        sizeMS: json['sizeMS'],
        sizeMR: json['sizeMR'],
        sizeL: json['sizeL'],
        sizeLS: json['sizeLS'],
        sizeLR: json['sizeLR'],
        sizeXL: json['sizeXL'],
        sizeXLS: json['sizeXLS'],
        sizeXLR: json['sizeXLR']);
  }
}
