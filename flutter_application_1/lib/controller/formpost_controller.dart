import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:njoroder_application/model/formpost_model.dart';
import '../model/form_model.dart';

/// FormController is a class which does work of saving postPackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormPostController {
  // Google App Script Web URL.
  //V100 Can add data: AKfycbwqbpHyvJZM63saBauYLlH_Zrh43I-aAtDAzh3ytUaVl6W2T9_CWtyMrnOsIcU97ASDZw
  //V101 Add Items insert: AKfycbysXkSj5PF_gSa_2_UR8EAxajHwZNJUVZgsytcOkRK7AeDDxJ7j002h1RFdf8tXPkgb6g
  //V102 V1007: AKfycbwQb8f44KKivwaVIedyqjfgjm8DdMNiobqCaeti5pb0MFOE6Ebj_QHJJY_ybrCkHBRM7w
  static const String URLApiByOne =
      "https://script.google.com/macros/s/AKfycbwQb8f44KKivwaVIedyqjfgjm8DdMNiobqCaeti5pb0MFOE6Ebj_QHJJY_ybrCkHBRM7w/exec"; // เปลี่ยนทุกครั้งที่มีการ Deploy
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  static const String URLGoogle =
      "https://script.google.com/macros/s/---/exec"; // API ค้นหา

  /// Async function which saves feedback, parses [postPackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  String strBack = "";
  void submitForm(
      PostbackForm postPackForm, void Function(String) callback) async {
    try {
      String txtParams = URLApiByOne +
          "?" +
          "val1=" +
          postPackForm.val1 +
          "&" +
          "val2=" +
          postPackForm.val2 +
          "&" +
          "val3=" +
          postPackForm.val3 +
          "&" +
          "val4=" +
          postPackForm.val4 +
          "&" +
          "val5=" +
          postPackForm.val5 +
          "&" +
          "val6=" +
          postPackForm.val6 +
          "&" +
          "val7=" +
          postPackForm.val7 +
          "&" +
          "val8=" +
          postPackForm.val8 +
          "&" +
          "val9=" +
          postPackForm.val9 +
          "&" +
          "val10=" +
          postPackForm.val10 +
          "&" +
          "val11=" +
          postPackForm.val11 +
          "&" +
          "val12=" +
          postPackForm.val12 +
          "&" +
          "val13=" +
          postPackForm.val13 +
          "&" +
          "val14=" +
          postPackForm.val14 +
          "&" +
          "val15=" +
          postPackForm.val15 +
          "&" +
          "val16=" +
          postPackForm.val16 +
          "&" +
          "val17=" +
          postPackForm.val17 +
          "&" +
          "val18=" +
          postPackForm.val18 +
          "&" +
          "val19=" +
          postPackForm.val19 +
          "&" +
          "val20=" +
          postPackForm.val20 +
          "&" +
          "val21=" +
          postPackForm.val21 +
          "&" +
          "val22=" +
          postPackForm.val22 +
          "&" +
          "val23=" +
          postPackForm.val23 +
          "&" +
          "val24=" +
          postPackForm.val24 +
          "&" +
          "val25Post=" +
          postPackForm.val25Post;
      await http.post(Uri.parse(txtParams)).then((response) {
        Map<String, dynamic> jdata =
            convert.jsonDecode(response.body)['status'];
        print('Howdy, ${jdata['status']}!');
        //var strBack = callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
      print(strBack);
    }
  }
}
