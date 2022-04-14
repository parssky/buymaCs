import 'package:flutter/material.dart';

class UpNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;


    //final double itemHeight = (size.height - kToolbarHeight - 80) / 20;
    final double itemWidth = size.width / 2;

    return Padding(
      padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: itemWidth/4,
        child: Center(
          child: Text(
              'id',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          ),
          Container(
            width: itemWidth/4,
            child: Center(
              child: Text(
              'title',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          ),
          Container(
            width: itemWidth/4,
            child: Center(
              child: Text(
              'coin name',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          ),
          Container(
            width: itemWidth/4,
            child: Center(
              child: Text(
              'date',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          ),
          Container(
            width: itemWidth/4,
            child: Center(
              child: Text(
              'date event',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
          ),
              Container(
              width: itemWidth/4,
                child: Center(
                  child: Text(
              'importance',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Colors.grey[700],
              ),
            ),
          ),
              ),
          Container(
            width: itemWidth/4,
              child: Center(
                child: Text(
                  'market cap',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }
}
