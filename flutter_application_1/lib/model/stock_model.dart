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
class ResStockData {
  final List<String> mCode;
  final List<String> mName;
  final List<String> size36;
  final List<String> size40;
  final List<String> size42;
  final List<String> size44;
  final List<String> size48;
  final List<String> size52;
  final List<String> size56;
  final List<String> sizeM;
  final List<String> sizeL;
  final List<String> sizeXL;

  const ResStockData(
      {required this.mCode,
      required this.mName,
      required this.size36,
      required this.size40,
      required this.size42,
      required this.size44,
      required this.size48,
      required this.size52,
      required this.size56,
      required this.sizeL,
      required this.sizeM,
      required this.sizeXL});

  factory ResStockData.fromJson(Map<String, dynamic> json) {
    return ResStockData(
      mCode: json['mCode'] as List<String>,
      mName: json['mName'] as List<String>,
      size36: json['size36'] as List<String>,
      size40: json['size40'] as List<String>,
      size42: json['size42'] as List<String>,
      size44: json['size44'] as List<String>,
      size48: json['size48'] as List<String>,
      size52: json['size52'] as List<String>,
      size56: json['size56'] as List<String>,
      sizeM: json['sizeM'] as List<String>,
      sizeL: json['sizeL'] as List<String>,
      sizeXL: json['sizeXL'] as List<String>,
    );
  }
}
