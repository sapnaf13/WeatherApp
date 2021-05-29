import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sample/Utilities/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/yup.gif'),
            //fit: BoxFit.cover,
            ),

        //  constraints: BoxConstraints.expand(),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                    // Colors.lightBlueAccent.shade400.withOpacity(0.4),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 30.0,
                      color: Colors.lightBlueAccent.shade400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    // icon: Icon(
                    //   Icons.location_city,
                    //   color: Colors.white,
                    // ),
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                  Timer(Duration(seconds: 6000), () {});
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.lightBlueAccent.shade400,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/bg.gif'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Icon(
              //   MdiIcons.earth,
              //   size: 100,
              //   color: Colors.blue.shade900,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
