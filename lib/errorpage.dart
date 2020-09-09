import 'package:flutter/material.dart';

class error_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Center(
              child: Text(
                'Details provided is Wrong',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
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
              color: Colors.blue,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(
                    context
                  );
                },
                child: Center(
                  child: Text(
                    'TRY AGAIN',
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
