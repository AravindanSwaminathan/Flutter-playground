import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: Center(
              child: Text(
                'Welcome User',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          SizedBox(height: 80.0),
          Container(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            height: 60.0,
            child: Material(
              borderRadius: BorderRadius.circular(30.0),
              color: Colors.green,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                      context
                  );
                },
                child: Center(
                  child: Text(
                    'GO BACK',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
