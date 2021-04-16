import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:provider/provider.dart';




class Category extends StatelessWidget {
  const Category({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryProvider>(
      create: (context)=>CategoryProvider(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 18, top: 10),
        child: Row(
          children: [
            Text(
              'Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(width:210),
        Image.asset("asset/arrow2.gif",width: 30,height:30,color: Colors.black,)
          ],
        ),
      ),
     
          Container(
        margin: EdgeInsets.only(left: 5, right: 15),
        height: 110,
        width: MediaQuery.of(context).size.width,
        child: Consumer<CategoryProvider>(
          builder:(context, value, child) {
            return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.getCat.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(left: 1, bottom: 1),
            height: 90,
            width: 90,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      
                      //Navigator.push(context, MaterialPageRoute(builder: (_)=>Home(title: value.getCat[index].name,)));
                      Scaffold.of(context).openDrawer();
                      
                    },
                    child: Card(
                      elevation: 9.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(40)),
                        width: 50,
                        height: 50,
                        child: Center(
                            child: Icon(
                          value.getCat[index].icon,
                          color: Colors.white,
                          size: 30,
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right:13.0),
                  child: Text(value.getCat[index].name,
                  style: TextStyle(fontSize: 12),),
                ),
              ],
            ),
          ),
        );
          }
        )
      )
    ])
      );
  }
}
