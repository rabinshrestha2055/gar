import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/category.dart';
import 'package:garjoo/models/cod.dart';

import 'package:garjoo/models/imePay.dart';
import 'package:garjoo/models/imePayWeb.dart';
import 'package:garjoo/models/limitedProduct.dart';
import 'package:garjoo/models/loginUser.dart';
import 'package:garjoo/models/reviewSpecific.dart';
import 'package:garjoo/models/reviewpost.dart';
import 'package:garjoo/models/similar.dart';
import 'package:garjoo/models/specificReview.dart';
import 'package:garjoo/models/storeBanner.dart';
import 'package:garjoo/models/storeTop.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'appurl .dart';

class UserDetailsProvider with ChangeNotifier {
  Future<List<Item>> getArrivals() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.arrival,
        headers: {
          "Accept": "application/json",
        },
      );

      return itemModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Item>> getDiscount() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.discount,
        headers: {
          "Accept": "application/json",
        },
      );
      //print(response.body);
      return itemModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Item>> getFCategory() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.fcategory,
        headers: {
          "Accept": "application/json",
        },
      );

      return itemModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Item>> getFProduct() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.fproducts,
        headers: {
          "Accept": "application/json",
        },
      );

      return itemModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Item>> getMenProduct() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.menfashion,
        headers: {
          "Accept": "application/json",
        },
      );

      return itemModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<Item>> getWomenProduct() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.womenfashion,
        headers: {
          "Accept": "application/json",
        },
      );

      return itemModelFromJson(response.body);
    } catch (e) {}
  }

  Future<http.Response> pauseAccount({userId}) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };

      var response = await http.put(
          BaseURl.baseUrl + AppURl.pauseAccout + userId.toString(),
          headers: headers);

      return response;
    } catch (e) {}
  }

  Future<http.Response> deleteAccount({userId}) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      var response = await http.delete(
          BaseURl.baseUrl + AppURl.deleteAccout + userId.toString(),
          headers: headers);
      return response;
    } catch (e) {}
  }

  Future<List<Item>> getRelatedProduct({String slug}) async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.relatedproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return relatedProductModelFromJson(response.body);
    } catch (e) {}
  }

  Future<Item> getDetails({String slug}) async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.relatedproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return detailsModelFromJson(response.body);
    } catch (e) {}
  }

//data

  Future<List<Item>> getStoreData({String slug}) async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.storeproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return visitStoreModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<Item>> getMarket() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.market,
        headers: {
          "Accept": "application/json",
        },
      );

      return marketModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<StoreTopModel>> getStoreTop() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.storetop,
        headers: {
          "Accept": "application/json",
        },
      );

      return storeTopModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<LimitedProductModel>> getStoreLimitedProduct() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.storetop,
        headers: {
          "Accept": "application/json",
        },
      );

      return limitedFromJson(response.body);
    } catch (e) {}
  }

  Future<http.Response> upteUser(String id) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.put(
          BaseURl.baseUrl + AppURl.updateuser + '/' + id,
          headers: headers);
      return response;
    } catch (e) {}
  }

  Future<List<Item>> getQuickLink1({String slug}) async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.quicklink + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return categoryItemModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<StoreBannerModel>> getBanner() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.storebanner,
        headers: {
          "Accept": "application/json",
        },
      );

      return storeBannerModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getParent() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.navigationParent,
        headers: {
          "Accept": "application/json",
        },
      );

      return response.body;
    } catch (e) {}
  }

  Future<List<ParentCategory>> getParent1() async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.navigationParent,
        headers: {
          "Accept": "application/json",
        },
      );

      return categoryFromJson(response.body);
    } catch (e) {}
  }

  Future<String> getFilterResult({category}) async {
    try {
      final response = await http.get(
        BaseURl.baseUrl + AppURl.filterResult + category + "/",
        headers: {
          "Accept": "application/json",
        },
      );
      print(response.body);
      return response.body;
    } catch (e) {}
  }

  Future<http.Response> login(UserModel loginModel) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.login,
        headers: headers,
        body: userModelToJson(loginModel),
      );
      print(response.body);
      return response;
    } catch (e) {}
  }

  Future<List<Item>> homeCarousel() async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.get(
        BaseURl.baseUrl + AppURl.homecarousel,
        headers: headers,
      );
      return itemModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<Item>> classifiedCarousel() async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.get(
        BaseURl.baseUrl + AppURl.classifiedcarousel,
        headers: headers,
      );
      return itemModelFromJson(response.body);
    } catch (e) {}
  }

  Future<http.Response> reviewPost(ReviewPost reviewpost) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.reviewPost,
        headers: headers,
        body: reviewPostToJson(reviewpost),
      );

      return response;
    } catch (e) {}
  }

  Future<http.Response> reviewSpecificPost(ReviewSpecific review) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      final headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + token
      };
      final response = await http.post(
          BaseURl.baseUrl + AppURl.specificReviewPost,
          headers: headers,
          body: reviewSpecificToJson(review));
      return response;
    } catch (e) {}
  }

  Future<List<SpecificReview1>> getSpecificReview(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    try {
      final headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + token
      };
      final response = await http.get(
        BaseURl.baseUrl + AppURl.specificReviewGet + id,
        headers: headers,
      );
      print(response.body);
      return sReviewModelFromJson(response.body);
    } catch (e) {}
  }

  Future<http.Response> customerRegister(UserModel registerModel) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.register,
        headers: headers,
        body: userModelToJson(registerModel),
      );

      return response;
    } catch (e) {}
  }

  Future<http.Response> imePay({IMEPAYRequestModel imepayRequestModel}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    print(token);
    try {
      final headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + token
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.imePay,
        headers: headers,
        body: imePayRequestToJson(imepayRequestModel),
      );

      return response;
    } catch (e) {}
  }

  Future<http.Response> cashOnDelivery({CashOnDelivery cashOnDelivery}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    print(token);
    try {
      final headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + token
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.cod,
        headers: headers,
        body: codToJson(cashOnDelivery),
      );

      return response;
    } catch (e) {}
  }

  Future<http.Response> imePayWeb({IMEPAYWEBModel imepayWebModel}) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.imePayWeb,
        headers: headers,
        body: imePayWebToJson(imepayWebModel),
      );

      return response;
    } catch (e) {}
  }

  Future<http.StreamedResponse> sellerRegister({
    String filename,
    UserModel registerModel,
  }) async {
    try {
      final request = http.MultipartRequest(
          'POST', Uri.parse(BaseURl.baseUrl + AppURl.register));
      var data = registerModel.tojson();
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      request.files.add(http.MultipartFile(
        'document',
        File(filename).readAsBytes().asStream(),
        File(filename).lengthSync(),
        filename: filename.split("/").last,
      ));
      var res = await request.send();
      return res;
    } catch (e) {}
  }

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", user.token);
    return true;
  }

  Future<bool> logoutUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove("token");

    return true;
  }

  Future<LoginUserModel> loginUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    try {
      final headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + token
      };
      final response = await http.get(
        BaseURl.baseUrl + AppURl.loginUser,
        headers: headers,
      );
      return loginUserModelFromJson(response.body);
    } catch (e) {}
  }

  Future<http.Response> verifyEmail({LoginUserModel email}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    try {
      final headers = {
        'content-type': 'application/json',
        'Authorization': 'Bearer ' + token
      };
      final response = await http.post(
        BaseURl.baseUrl + AppURl.verifyEmail,
        headers: headers,
        body: loginUserModelToJson(email),
      );
      return response;
    } catch (e) {}
  }
}
