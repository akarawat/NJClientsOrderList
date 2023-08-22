import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:njoroder_application/model/formpost_model.dart';
import '../model/form_model.dart';
import 'package:intl/intl.dart';

/// FormController is a class which does work of saving postPackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormPostController {
  // Google App Script Web URL.
  //V100 Can add data: AKfycbwqbpHyvJZM63saBauYLlH_Zrh43I-aAtDAzh3ytUaVl6W2T9_CWtyMrnOsIcU97ASDZw
  //V101 Add Items insert: AKfycbysXkSj5PF_gSa_2_UR8EAxajHwZNJUVZgsytcOkRK7AeDDxJ7j002h1RFdf8tXPkgb6g
  //V102 V1007: AKfycbwQb8f44KKivwaVIedyqjfgjm8DdMNiobqCaeti5pb0MFOE6Ebj_QHJJY_ybrCkHBRM7w
  //V200 : AKfycbz73qwueuzA6np4hKhWziCRW6CZf9CRn_Y79rZ7a2HmAUnfZjeojgIQjDCWMbFOtoffWw เพิ่มทีละหลายชุด
  //V203 : AKfycbzb5HmcJJPxqi2_ivR_PKSV8NShIUCp4OD4QqIxkPnYD-DpG34wsdgnUo-eHNB_etRtdg : Pilot >> V2005.2
  //V205.3 AKfycbx7zbMkU1XEI98mV4nNFKeWbXOUfWTlM2SZhXutfQRJhuHI2-GlvSPTaq_TGrtI394o : Fix error 1 row
  //APP V2 : A#K#f#ycbyd4vfECx0env4RkNqgdGSve1dyCEp466GICN76l1e4bqK1awTC4zgB5y4dQ_SlfQSwYA
  static const String URLApiByOne =
      "https://script.google.com/macros/s/AKfycbw6nzls58G28NF2R4L5m475NMsyi3VdpvSjE4c_thSxVBOAxgVeOS9W9WmVtspOHowdEw/exec"; // เปลี่ยนทุกครั้งที่มีการ Deploy
  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  static const String URLGetStock =
      "https://script.google.com/macros/s/AKfycbw6nzls58G28NF2R4L5m475NMsyi3VdpvSjE4c_thSxVBOAxgVeOS9W9WmVtspOHowdEw/exec"; // API Get Stock

  /// Async function which saves feedback, parses [postPackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  String strBack = "";
  void submitForm(
      PostbackForm feedbackForm, void Function(String) callback) async {
    try {
      String txtParams =
          "$URLApiByOne?func=set&val1=${feedbackForm.val1}&val2=${feedbackForm.val2}&val3=${feedbackForm.val3}&val4=${feedbackForm.val4}&val5=${feedbackForm.val5}&val6=${feedbackForm.val6}&val7=${feedbackForm.val7}&val8=${feedbackForm.val8}&val9=${feedbackForm.val9}&val10=${feedbackForm.val10}&val11=${feedbackForm.val11}&val12=${feedbackForm.val12}&val13=${feedbackForm.val13}&val14=${feedbackForm.val14}&val15=${feedbackForm.val15}&val16=${feedbackForm.val16}&val17=${feedbackForm.val17}&val18=${feedbackForm.val18}&val19=${feedbackForm.val19}&val20=${feedbackForm.val20}&val21=${feedbackForm.val21}&val22=${feedbackForm.val22}&val23=${feedbackForm.val23}&val24=${feedbackForm.val24}&val25Post=${feedbackForm.val25Post}";
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

  void getStock(void Function(String) callback) async {
    try {
      String txtParams = URLGetStock;
      await http.get(Uri.parse(txtParams)).then((response) {
        Map<String, dynamic> jdata =
            convert.jsonDecode(response.body)['status'];
        print('Howdy, ${jdata['status']}!');
        //var strBack = callback(convert.jsonDecode(response.body)['status']);
      });
    } catch (e) {
      print(e);
    }
  }
}
