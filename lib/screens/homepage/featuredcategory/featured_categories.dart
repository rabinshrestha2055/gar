import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:garjoo/core.dart';
import 'package:garjoo/screens/homepage/featuredcategory/featCatDetail.dart';
import 'package:provider/provider.dart';

class FeaturedCategory extends StatelessWidget {
  const FeaturedCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData getIconForName({String iconName}) {
      switch (iconName) {
        case 'car':
          {
            return FontAwesomeIcons.car;
          }
        case 'palette':
          {
            return FontAwesomeIcons.palette;
          }
        case 'volume-up':
          {
            return FontAwesomeIcons.volumeUp;
          }
        case 'child':
          {
            return FontAwesomeIcons.child;
          }
        case 'hotel':
          {
            return FontAwesomeIcons.hotel;
          }
        case 'robot':
          {
            return FontAwesomeIcons.robot;
          }
        case 'chair':
          {
            return FontAwesomeIcons.chair;
          }
        case 'female':
          {
            return FontAwesomeIcons.female;
          }
        case 'tshirt':
          {
            return FontAwesomeIcons.tshirt;
          }
        case 'file-invoice':
          {
            return FontAwesomeIcons.fileInvoice;
          }
        case 'industry':
          {
            return FontAwesomeIcons.industry;
          }
        case 'hand-holding-medical':
          {
            return FontAwesomeIcons.handHoldingMedical;
          }
          break;
        default:
          {
            return FontAwesomeIcons.google;
          }
      }
    }

    return ChangeNotifierProvider<UserDetailsProvider>(
      create: (context) => UserDetailsProvider(),
      child: Consumer<UserDetailsProvider>(
        builder: (context, value, child) => FutureBuilder(
          future: value.getFCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Container();
            } else if (snapshot.connectionState == ConnectionState.done) {
              var response = snapshot.data as List<FeaturedCatModel>;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text(
                      'Browse Through Featured Categories',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 12),
                    height: 315,
                    child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          crossAxisCount: 4,
                          childAspectRatio: 3 / 4,
                        ),
                        physics: ScrollPhysics(
                            parent: NeverScrollableScrollPhysics()),
                        itemCount: response.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => FeatureCatDetail(
                                            slug: response[index].slug,
                                            storetitle: response[index].name,
                                          )));
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 9),
                              width: 73.5,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Card(
                                      elevation: 2.0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        width: 55,
                                        height: 55,
                                        child: Center(
                                          //  child:Icon(getIconUsingPrefix(name: response[index].icon))
                                          child: Icon(
                                              getIconForName(
                                                  iconName:
                                                      response[index].icon),
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      response[index].name,
                                      style: TextStyle(fontSize: 11),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
