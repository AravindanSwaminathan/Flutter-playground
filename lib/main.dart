import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterplayground/errorpage.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => MyHomePage(),
        '/first' : (context) => welcome_page(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _emailcolumn(),
                      _passwordcolumn(),
                      SizedBox(height: 100.0),
                      _loginbutton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  Widget _loginbutton() {
    return Container(
      padding: EdgeInsets.only(left: 50.0, right: 50.0),
      height: 60.0,
      child: RaisedButton(
        color: Colors.green,
        onPressed: () {
          if (formKey.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return welcome_page();
                },
              ),
            );
          }
        },
        child: Center(
          child: Text(
            'LOGIN',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }


  Widget _emailcolumn(){
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            )),
        validator: (input) =>
        !input.contains('@')
            ? 'Not a valid Email'
            : null,
        onSaved: (input) => _email,
      ),
    );
  }

  Widget _passwordcolumn(){
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            )),
        obscureText: true,
        validator: passwordValidator,
        onSaved: (input) => _password,
      ),
    );
  }

}
