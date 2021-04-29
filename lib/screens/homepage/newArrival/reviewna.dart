import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';


class ReviewNA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 1.5,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(parent: NeverScrollableScrollPhysics()),
            children: [
             
              SizedBox(height: 30),
             Container(
               
               child: Column(
                 children: [
                   Center(child: Text('You need to login for review',style: TextStyle(fontSize: 18),)),
                   SizedBox(height:30),
                   MaterialButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                   },
                    shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        color: Colors.red[300],
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                   ),
                    SizedBox(height:30),
                   Container(
            margin: EdgeInsets.only(left:60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Don't have an account? ",style: TextStyle(fontSize: 12),),
                InkWell(
                  child: Text(
                    'Create a new account.',
                    style: TextStyle(fontSize:12,color: Colors.red),
                  ),
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                )
              ],
            ),
          ),
               
                 ],
               ),
             ), 
            ],
          ),
        ),
      ),
    );
  }
}
