import 'dart:convert';

class IMEPAYRequestModel {
  final double amount;
  final String refId;

  IMEPAYRequestModel({this.amount, this.refId});
  Map<String, String> toJson() => {
        "MerchantCode": "GARJOO",
        "Amount": amount.toString(),
        "RefId": "PAYREF" + refId,
      };
}

String imePayRequestToJson(IMEPAYRequestModel data) =>
    json.encode(data.toJson());
