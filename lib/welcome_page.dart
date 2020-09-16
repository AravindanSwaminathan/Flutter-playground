import 'package:flutter/material.dart';

class welcome_page extends StatelessWidget {
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
                style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          SizedBox(height: 80.0),
          Container(
            padding: EdgeInsets.only(left: 90.0, right: 90.0),
            height: 55.0,
            child: Material(
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () {
                  Navigator.pop(
                      context
                  );
                },
                child: Center(
                  child: Text(
                    'GO BACK',
                    style: Theme.of(context).textTheme.headline5,
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
