import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garjoo/colors.dart';
import 'package:garjoo/core.dart';

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 280.0,
        height: MediaQuery.of(context).size.height * 0.47,
        // height: 280.0,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 230,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Refine',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 19.0,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    // SizedBox(width: 110,),
                    TextButton(onPressed: () {}, child: Text('Clear All'))
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text('Market', style: TextStyle(color: black)),
            Container(
              width: 250,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2.0,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Market',
                        'Jobs',
                        'Service',
                        'Real Estate',
                        'Motor',
                        'Accomodation',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select Category",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              flex: 0,
              child: Row(
                children: [
                  Text('Price:', style: TextStyle(color: black)),
                  SizedBox(width: 8),
                  Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          border: Border.all(color: orange),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: TextField(
                              keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(border: InputBorder.none)))),
                ],
              ),
            ),
            SizedBox(height: 12),
            Container(
              child: Expanded(
                flex: 0,
                child: Row(
                  children: [
                    Text('Min:', style: TextStyle(color: black)),
                    SizedBox(width: 10),
                    Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: orange),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ))),
                    SizedBox(width: 20),
                    Text('Max:', style: TextStyle(color: black)),
                    SizedBox(width: 10),
                    Container(
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(color: orange),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none)))),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Location', style: TextStyle(color: black)),
            Container(
              width: 250,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2.0,
                child: DropdownButtonHideUnderline(
                  child: ButtonTheme(
                    alignedDropdown: true,
                    child: DropdownButton<String>(
                      value: _chosenValue,
                      style: TextStyle(color: Colors.black),
                      items: <String>[
                        'Kathmandu',
                        'Janakpur',
                        'Saptari',
                        'Rupandehi',
                        'Makawanpur',
                        'Accham',
                        'Bhaktapur',
                        'Lalitpur'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select Location",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          _chosenValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}