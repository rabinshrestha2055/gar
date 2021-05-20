import 'dart:convert';

class CashOnDelivery {
  final int userId;
  final String receiverName;
  final String receiverNumber;
  final String receiverEmail;
  final String shippingAddress;
  final int shippingCharge;
  final int subTotal;
  final int grandTotal;
  final List products;

  CashOnDelivery(
      {this.userId,
      this.receiverName,
      this.receiverNumber,
      this.receiverEmail,
      this.shippingAddress,
      this.shippingCharge,
      this.subTotal,
      this.grandTotal,
      this.products});

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "receiver_name": receiverName,
        "receiver_number": receiverNumber,
        "receiver_email": receiverEmail,
        "shipping_address": shippingAddress,
        "shipping_charge": shippingCharge,
        "sub_total": subTotal,
        "grand_total": grandTotal,
        "payment_mode": "cash",
        "products": products
      };
}

codToJson(CashOnDelivery data) => json.encode(data.toJson());
