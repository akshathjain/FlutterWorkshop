/*
Name: Akshath Jain
Date: 1/2/19
Purpose: displays weather
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
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: InkWell(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: Text(
              widget.name, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              )
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
              color: Colors.black12,
              blurRadius: 15.0
            )
          ]
        ),
      ),
    );
  } 
}