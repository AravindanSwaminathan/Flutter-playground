import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'welcome_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        buttonColor: Colors.blue,
        fontFamily: 'Georgia',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline5: TextStyle(fontSize: 28.0,color: Colors.white, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, color: Colors.black),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          bodyText1: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
        ),
      ),
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
                    'Sign In',
                    style: Theme.of(context).textTheme.headline6,
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
                      build_EmailColumn(),
                      build_PasswordColumn(),
                      SizedBox(height: 100.0),
                      build_LoginButton(),
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


  Widget build_LoginButton() {
    return Container(
      padding: EdgeInsets.only(left: 80.0, right: 80.0),
      height: 60.0,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          if (formKey.currentState.validate()) {
            Navigator.pushNamed(context, '/first');
          }
        },
        child: Center(
          child: Text(
            'LOGIN',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }


  Widget build_EmailColumn(){
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'EMAIL',
            labelStyle: Theme.of(context).textTheme.bodyText1,),
        validator: (input) =>
        !input.contains('@')
            ? 'Not a valid Email'
            : null,
        onSaved: (input) => _email,
      ),
    );
  }

  Widget build_PasswordColumn(){
    return Container(
      child: TextFormField(
        decoration: InputDecoration(
            labelText: 'PASSWORD',
            labelStyle: Theme.of(context).textTheme.bodyText2,),
        obscureText: true,
        validator: passwordValidator,
        onSaved: (input) => _password,
      ),
    );
  }

}
