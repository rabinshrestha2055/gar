import 'dart:convert';

class IMEPAYWEBModel {
  final String amount;
  final String tokenId;
  final String merchantCode;
  final String refId;

  IMEPAYWEBModel({this.merchantCode, this.amount, this.refId, this.tokenId});
  factory IMEPAYWEBModel.fromJson(Map<String, dynamic> json) => IMEPAYWEBModel(
      merchantCode: "GARJOO",
      tokenId: json['TokenId'],
      amount: json['Amount'],
      refId: json['RefId']);

  Map<String, String> toJson() => {
        "TokenId": tokenId,
        "MerchantCode": "GARJOO",
        "Amount": amount,
        "RefId": refId,
      };
}

IMEPAYWEBModel imeWebModelFromJson(String str) =>
    IMEPAYWEBModel.fromJson(json.decode(str));
String imePayWebToJson(IMEPAYWEBModel data) => json.encode(data.toJson());
