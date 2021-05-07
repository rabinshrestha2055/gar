import 'dart:convert';

class QuestionModel {
  final String question;
  final String answer;
  final int customerId;
  final int sellerID;
  final int productID;

  QuestionModel(
      {this.productID,
      this.sellerID,
      this.customerId,
      this.question,
      this.answer});

  Map<String, dynamic> tojson() => {
        'question': question,
        'answer': answer,
        'product_id': productID,
        'seller_id': sellerID,
        'customer_id': customerId
      };
}

String questionToJson(QuestionModel data) => json.encode(data.tojson());
