import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';

class FeaturedCategory extends StatelessWidget {
  const FeaturedCategory({Key key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Text(
          'Featured Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 10),
      ChangeNotifierProvider<UserDetailsProvider>(
        create: (context) => UserDetailsProvider(),
        
              child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 330,
          width: MediaQuery.of(context).size.width,
          child: Consumer<UserDetailsProvider>(
            builder: (context, value, child) => FutureBuilder(
              future: value.getFCategory(),
             builder: (context, snapshot) {
               if(snapshot.hasError){
                 return Center(child:CircularProgressIndicator());
               }
               else if(snapshot.connectionState==ConnectionState.done){
                 var response=snapshot.data as List<FeaturedCatModel>;
                 return GridView.builder(
                   shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 0,
                crossAxisSpacing: 0,
                crossAxisCount: 4,
                childAspectRatio: 3 / 4,
              ),
              physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
              itemCount: response.length,
              itemBuilder: (context, index) => Container(
                margin: EdgeInsets.only(right: 9),
                width: 73.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)),
                          width: 55,
                          height: 55,
                          child: Center(
                            child: Icon(Icons.shopping_bag_outlined,color:Colors.white),
                          
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
               }
               else{
                return Center(child: CircularProgressIndicator(),);
               }
             },
                      
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
    ]);
  }
}
