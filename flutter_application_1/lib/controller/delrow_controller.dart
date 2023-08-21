import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:njoroder_application/model/delrow_model.dart';
import 'package:intl/intl.dart';

/// FormController is a class which does work of saving postPackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class DelRowController {
  // Google App Script Web URL.
  //V100 Can add data: AKfycbwqbpHyvJZM63saBauYLlH_Zrh43I-aAtDAzh3ytUaVl6W2T9_CWtyMrnOsIcU97ASDZw
  //V101 Add Items insert: AKfycbysXkSj5PF_gSa_2_UR8EAxajHwZNJUVZgsytcOkRK7AeDDxJ7j002h1RFdf8tXPkgb6g
  //V102 V1007: AKfycbwQb8f44KKivwaVIedyqjfgjm8DdMNiobqCaeti5pb0MFOE6Ebj_QHJJY_ybrCkHBRM7w
  //V200 : AKfycbz73qwueuzA6np4hKhWziCRW6CZf9CRn_Y79rZ7a2HmAUnfZjeojgIQjDCWMbFOtoffWw เพิ่มทีละหลายชุด
  //V203 : AKfycbzb5HmcJJPxqi2_ivR_PKSV8NShIUCp4OD4QqIxkPnYD-DpG34wsdgnUo-eHNB_etRtdg : Pilot >> V2005.2
  //V205.3 AKfycbx7zbMkU1XEI98mV4nNFKeWbXOUfWTlM2SZhXutfQRJhuHI2-GlvSPTaq_TGrtI394o : Fix error 1 row
  //APP V2 : AKfycbyd4vfECx0env4RkNqgdGSve1dyCEp466GICN76l1e4bqK1awTC4zgB5y4dQ_SlfQSwYA
  static const String URLApiByOne =
      "https://script.google.com/macros/s/AKfycbyd4vfECx0env4RkNqgdGSve1dyCEp466GICN76l1e4bqK1awTC4zgB5y4dQ_SlfQSwYA/exec"; // เปลี่ยนทุกครั้งที่มีการ Deploy
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [postPackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  String strBack = "";
  void submitDelForm(
      DelRowForm delrowForm, void Function(String) callback) async {
    try {
      String txtParams =
          "$URLApiByOne?func=${delrowForm.func}&val1=${delrowForm.val1}&val2=${delrowForm.val2}";
      await http.get(Uri.parse(txtParams)).then((response) {
        Map<String, dynamic> jdata =
            convert.jsonDecode(response.body)['status'];
        print('Codey, ${jdata['status']}!');
        //var strBack = callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
      print(strBack);
    }
  }
}
