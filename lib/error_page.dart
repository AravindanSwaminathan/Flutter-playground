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
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          SizedBox(height: 80.0),
          Container(
            padding: EdgeInsets.only(left: 50.0, right: 50.0),
            height: 60.0,
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
                    'TRY AGAIN',
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
