import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/form_model.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {
  // Google App Script Web URL.
  //V100 Can add data: AKfycbwqbpHyvJZM63saBauYLlH_Zrh43I-aAtDAzh3ytUaVl6W2T9_CWtyMrnOsIcU97ASDZw
  //V101 Add Items insert: AKfycbysXkSj5PF_gSa_2_UR8EAxajHwZNJUVZgsytcOkRK7AeDDxJ7j002h1RFdf8tXPkgb6g
  //V102 V1007: AKfycbwQb8f44KKivwaVIedyqjfgjm8DdMNiobqCaeti5pb0MFOE6Ebj_QHJJY_ybrCkHBRM7w
  //APP V2 : A#K#fycbyd4vfECx0env4RkNqgdGSve1dyCEp466GICN76l1e4bqK1awTC4zgB5y4dQ_SlfQSwYA
  static const String URLApiByOne =
      "https://script.google.com/macros/s/AKfycbxBp8PbJ5_r_vMHB9pkoVI5TX4LAxxCRoqpanm0gwzTFOrSt0LKpX3tVZIQgTB2NwSC7Q/exec"; // เปลี่ยนทุกครั้งที่มีการ Deploy
  static const String URLGoogle =
      'https://docs.google.com/spreadsheets/d/19vI6lRX-0AlYg5AbcUBG1N7epK59pjGblDFFPJCU-3I/';
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  String strBack = "";
  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      String txtParams = URLApiByOne +
          "?" +
          "val1=" +
          feedbackForm.val1 +
          "&" +
          "val2=" +
          feedbackForm.val2 +
          "&" +
          "val3=" +
          feedbackForm.val3 +
          "&" +
          "val4=" +
          feedbackForm.val4 +
          "&" +
          "val5=" +
          feedbackForm.val5 +
          "&" +
          "val6=" +
          feedbackForm.val6 +
          "&" +
          "val7=" +
          feedbackForm.val7 +
          "&" +
          "val8=" +
          feedbackForm.val8 +
          "&" +
          "val9=" +
          feedbackForm.val9 +
          "&" +
          "val10=" +
          feedbackForm.val10 +
          "&" +
          "val11=" +
          feedbackForm.val11 +
          "&" +
          "val12=" +
          feedbackForm.val12 +
          "&" +
          "val13=" +
          feedbackForm.val13 +
          "&" +
          "val14=" +
          feedbackForm.val14 +
          "&" +
          "val15=" +
          feedbackForm.val15 +
          "&" +
          "val16=" +
          feedbackForm.val16 +
          "&" +
          "val17=" +
          feedbackForm.val17 +
          "&" +
          "val18=" +
          feedbackForm.val18 +
          "&" +
          "val19=" +
          feedbackForm.val19 +
          "&" +
          "val20=" +
          feedbackForm.val20 +
          "&" +
          "val21=" +
          feedbackForm.val21 +
          "&" +
          "val22=" +
          feedbackForm.val22 +
          "&" +
          "val23=" +
          feedbackForm.val23 +
          "&" +
          "val24=" +
          feedbackForm.val24;
      await http.get(Uri.parse(txtParams)).then((response) {
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
