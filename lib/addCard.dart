import 'package:flutter/material.dart';

class AddCard extends StatefulWidget{

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final _formKey = new GlobalKey<FormState>(); // outside the build() method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Color.fromRGBO(36, 43, 47, 1),
          padding: const EdgeInsets.symmetric(horizontal: 43.0),
          child: Form(
            key: _formKey,
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(    // new line
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildFirstName(),
                    _buildLastName(),
                    _buildCompany(),
                    _buildPhone(),
                    _buildEmail(),
                    _buildDescription(),
                    _buildConfirmButton(context)
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

InputDecoration _buildInputDecoration(String hint, String iconPath) {
  return InputDecoration(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(252, 252, 252, 1))),
      hintText: hint,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(151, 151, 151, 1))),
      hintStyle: TextStyle(color: Color.fromRGBO(252, 252, 252, 1)),
      icon: iconPath != '' ? Image.asset(iconPath) : null,
  );
}

Widget _buildFirstName() {
  return TextFormField(
    validator: (value) =>
    value.isEmpty ? "First name cannot be empty" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration:
    _buildInputDecoration("First name", ''),
  );
}

Widget _buildLastName() {
  return Container(
      //margin: const EdgeInsets.only(left: 40),
      child: TextFormField(
        validator: (value) =>
        value.isEmpty ? "Last name cannot be empty" : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration("Last name", ''),
      ));
}


Widget _buildCompany() {
  return Container(
      child: TextFormField(
        validator: (value) => value.isEmpty ||
            (value.isNotEmpty) //&& value != _passwordController.text)
            ? "Must not be empty"
            : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration("Company", ''),
      ));
}


Widget _buildPhone() {
  return Container(
      child: TextFormField(
        validator: (value) =>
        value.isEmpty ? "Phone cannot be empty and must be +380()" : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration("Phone", ''),
      ));
}


Widget _buildEmail() {
  return TextFormField(
    validator: (value) => !isEmail(value) ? "Sorry, we do not recognize this email address" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration: _buildInputDecoration("Email", ''),
  );
}

bool isEmail(String value) {
  String regex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(regex);

  return value.isNotEmpty && regExp.hasMatch(value);
}


Widget _buildDescription() {
  return TextFormField(
    validator: (value) =>
    value.length <= 6 ? "Description must be 6 or more characters in length" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration:
    _buildInputDecoration("Description", ''),
  );
}



Widget _buildConfirmButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 43.0),
    width: MediaQuery.of(context).size.width * 0.62,
    child: RaisedButton(
      child: const Text(
        "Confirm",
        style: TextStyle(
            color: Color.fromRGBO(40, 48, 52, 1),
            fontFamily: 'RadikalMedium',
            fontSize: 14),
      ),
      color: Colors.white,
      elevation: 4.0,
      onPressed: () {
        //_validateAndSubmit();
      },
    ),
  );
}