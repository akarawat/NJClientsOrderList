class DataSizeShr {
  final String sizeName;
  final String sizeN1;
  final String sizeN2;
  final String sizeN3;
  final String sizeN4;
  final String sizeN5;
  final String sizeN6;
  final String sizeN7;
  final String sizeN8;

  DataSizeShr(
      {required this.sizeName,
      required this.sizeN1,
      required this.sizeN2,
      required this.sizeN3,
      required this.sizeN4,
      required this.sizeN5,
      required this.sizeN6,
      required this.sizeN7,
      required this.sizeN8});

  factory DataSizeShr.fromJson(Map<String, dynamic> json) {
    return DataSizeShr(
        sizeName: json['sizeName'],
        sizeN1: json['sizeN1'],
        sizeN2: json['sizeN2'],
        sizeN3: json['sizeN3'],
        sizeN4: json['sizeN4'],
        sizeN5: json['sizeN5'],
        sizeN6: json['sizeN6'],
        sizeN7: json['sizeN7'],
        sizeN8: json['sizeN8']);
  }
}

class DataSizeTro {
  final String sizeName;
  final String sizeJ1;
  final String sizeJ2;
  final String sizeJ3;

  DataSizeTro(
      {required this.sizeName,
      required this.sizeJ1,
      required this.sizeJ2,
      required this.sizeJ3});

  factory DataSizeTro.fromJson(Map<String, dynamic> json) {
    return DataSizeTro(
        sizeName: 'Trosurers',
        sizeJ1: json['sizeJ1'],
        sizeJ2: json['sizeJ2'],
        sizeJ3: json['sizeJ3']);
  }
}
