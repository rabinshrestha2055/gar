import 'package:flutter/material.dart';
import 'package:garjoo/core.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Checkout extends StatefulWidget {
  var sum;
  Checkout({Key key, this.sum}) : super(key: key);
  @override
  CheckoutState createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  var email, confirmpassword, cname, cemail, cphone, fname, lname, ctycode;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          backgroundColor: white,
          title: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Image.asset(
              'asset/garjoologo.png',
              height: 150,
              width: 150,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16, right: 12),
                child: Card(
                    elevation: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 10, bottom: 10),
                          child: Text(
                            'Checkout',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('SHIPPING ADDRESS',
                                  style: TextStyle(color: grey, fontSize: 15)),
                              SizedBox(width: 50),
                              Text('Edit Address',
                                  style: TextStyle(fontSize: 15, color: red)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 2),
                          child: Text(
                            'John Doe',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'No 123,Sub Street,',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 2),
                              child: Text(
                                'Main Street,',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            SizedBox(width: 190),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                  backgroundColor: Colors.grey[400],
                                  radius: 8,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    color: white,
                                    size: 10,
                                  )),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 2),
                          child: Text(
                            'City Name, Provice',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, bottom: 2),
                          child: Text(
                            'Country',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(height: 12)
                      ],
                    )),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Delivery Area',
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(width: 50),
                      Column(
                        children: [
                          Text('Inside Kathmandu Valley'),
                          SizedBox(height: 3),
                          Text('Edit Address',
                              style: TextStyle(fontSize: 15, color: red)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 220,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        height: 40,
                        child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                              fillColor: Colors.grey,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                              ),
                            )),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: red,
                                  borderRadius: BorderRadius.circular(18)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 8.0, bottom: 8, left: 12, right: 12),
                                child: Center(
                                  child: Text(
                                    'Verify Email',
                                    style:
                                        TextStyle(fontSize: 14, color: white),
                                  ),
                                ),
                              )),
                          SizedBox(width: 60),
                          Expanded(
                            child: Container(
                              height: 40,
                              child: TextFormField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    labelText: "Enter OTP",
                                    fillColor: Colors.grey,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 2.0, right: 2, top: 8),
                        child: Container(
                          width: 400,
                          child: Row(
                            children: [
                              Container(
                                width: 130,
                                height: 40,
                                margin: EdgeInsets.only(right: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.grey)),
                                child: IntlPhoneField(
                                  controller: _controller,
                                  onChanged: (value) {
                                    cphone = value.number;
                                    ctycode = value.countryCode;
                                  },
                                  initialCountryCode: 'NP',
                                  decoration: InputDecoration(
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: TextFormField(
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        labelText: "Phone",
                                        fillColor: Colors.grey,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                          borderSide: BorderSide(
                                            color: Colors.grey,
                                            width: 1.0,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TOTAL',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                          Text(
                            '\$${widget.sum}',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Shipping Charge -Rs.50',
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Order()));
                        },
                        child: Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                                color: red,
                                borderRadius: BorderRadius.circular(18)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'Proceed to checkout',
                                  style: TextStyle(color: white, fontSize: 12),
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: Text('Shipping is free for order of more than Rs.5000',
                    style: TextStyle(fontStyle: FontStyle.italic, color: red)),
              ),
            ],
          ),
        ));
  }
}
