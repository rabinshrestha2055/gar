import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/models/datamodel.dart';
import 'package:garjoo/models/detailsmodel.dart';
import 'package:garjoo/models/limitedProduct.dart';
import 'package:garjoo/models/storeBanner.dart';
import 'package:garjoo/models/storeTop.dart';

import 'package:garjoo/models/visitstoremodel.dart';
import 'package:http/http.dart' as http;

class UserDetailsProvider with ChangeNotifier {
  Future<List<ArrivalModel>> getArrivals() async {
    try {
      final response = await http.get(
        AppURl.arrival ,
        headers: {
          "Accept": "application/json",
        },
      );
      return arrivalModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<DiscountModel>> getDiscount() async {
    try {
      final response = await http.get(
        AppURl.discount,
        headers: {
          "Accept": "application/json",
        },
      );
      //print(response.body);
      return discountModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<FeaturedCatModel>> getFCategory() async {
    try {
      final response = await http.get(
        AppURl.fcategory,
        headers: {
          "Accept": "application/json",
        },
      );

      return featuredCategoryModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<FeaturedProductModel>> getFProduct() async {
    try {
      final response = await http.get(
        AppURl.fproducts,
        headers: {
          "Accept": "application/json",
        },
      );

      return featuredProductModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<MenFashionModel>> getMenProduct() async {
    try {
      final response = await http.get(
        AppURl.menfashion,
        headers: {
          "Accept": "application/json",
        },
      );

      return menFashionModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<WomenFashionModel>> getWomenProduct() async {
    try {
      final response = await http.get(
        AppURl.womenfashion,
        headers: {
          "Accept": "application/json",
        },
      );

      return womenFashionModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<RelatedProModel>> getRelatedProduct({String slug}) async {
    try {
      final response = await http.get(
        AppURl.relatedproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return relatedProductModelFromJson(response.body);
    } catch (e) {}
  }

  Future<StoreModel> getStoreProduct({String slug}) async {
    try {
      final response = await http.get(
        AppURl.storeproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return storeModelFromJson(response.body);
    } catch (e) {}
  }

  Future<DetailsModel> getDetails({String slug}) async {
    try {
      final response = await http.get(
        AppURl.relatedproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return detailsProductModelFromJson(response.body);
    } catch (e) {}
  }

//data

  Future<List<DataModel>> getData({String slug}) async {
    try {
      final response = await http.get(
        AppURl.storeproduct + slug,
        headers: {
          "Accept": "application/json",
        },
      );

      return dataModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<MarketModel>> getMarket() async {
    try {
      final response = await http.get(
        AppURl.market,
        headers: {
          "Accept": "application/json",
        },
      );

      return marketModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<ServiceModel>> getService() async {
    try {
      final response = await http.get(
        AppURl.service,
        headers: {
          "Accept": "application/json",
        },
      );

      return servicesModelFromJson(response.body);
    } catch (e) {}
  }
   Future<List<StoreTopModel>> getStoreTop() async {
    try {
      final response = await http.get(
        AppURl.storetop ,
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
        AppURl.storetop,
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
      final response =
          await http.put(AppURl.updateuser + '/' + id, headers: headers);
      return response;
    } catch (e) {}
  }

  Future<List<NewPropertiesModel>> getnewProperties() async {
    try {
      final response = await http.get(
        AppURl.newproperties,
        headers: {
          "Accept": "application/json",
        },
      );

      return newPropertiesFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

    Future<List<QuickLinkModel>> getQuickLink({String slug}) async {
    try {
      final response = await http.get(
        AppURl.quicklink + slug,
        headers: {
          "Accept": "application/json",
        },
      );
       
      return quicklinkFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }






  Future<List<TopListingModel>> gettopListing() async {
    try {
      final response = await http.get(
        AppURl.toplisting,
        headers: {
          "Accept": "application/json",
        },
      );
      
      return toplistingFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }
   
   Future<List<StoreBannerModel>> getBanner() async {
    try {
      final response = await http.get(
        AppURl.storebanner,
        headers: {
          "Accept": "application/json",
        },
      );
    
      return storeBannerModelFromJson(response.body);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<http.Response> login(UserModel loginModel) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        AppURl.login,
        headers: headers,
        body: userModelToJson(loginModel),
      );
   
      return response;
    } catch (e) {}
  }

  Future<List<SlideCarousel>> homeCarousel() async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.get(
        AppURl.homecarousel,
        headers: headers,
      );
      return slidecarouselModelFromJson(response.body);
    } catch (e) {}
  }

  Future<List<AdsModel>> classifiedCarousel() async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.get(
        AppURl.classifiedcarousel,
        headers: headers,
      );
      return adsModelFromJson(response.body);
    } catch (e) {}
  }

  Future<http.Response> customerRegister(UserModel registerModel) async {
    try {
      final headers = {
        'content-type': 'application/json',
      };
      final response = await http.post(
        AppURl.register,
        headers: headers,
        body: userModelToJson(registerModel),
      );
    
      return response;
    } catch (e) {}
  }

  Future<http.StreamedResponse> sellerRegister({
    String filename,
    UserModel registerModel,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(AppURl.register));
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
}
