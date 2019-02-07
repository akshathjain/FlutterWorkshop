/*
Name: Akshath Jain
Date: 2/2/19
Purpose: displays weather in a nicely formatted card
*/

import 'package:flutter/material.dart';

class WeatherCard extends StatefulWidget{
  WeatherCard({Key key, this.name, this.temperature, this.onTap, this.color}) : super(key: key);
  final String name;
  final int temperature;
  final Color color;
  final Function onTap;

  @override
  _WeatherCardState createState() => new _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard>{
  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.temperature.toString() + "°",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  widget.name, 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onTap: widget.onTap,
        ),     
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow:[ 
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
              offset: Offset(0, 10.0)
            )
          ]
        ),
      ),
    );
  } 
}