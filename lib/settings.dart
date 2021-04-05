import 'package:flutter/material.dart';

class Settings extends StatefulWidget{

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                    _buildUserName(),
                    _buildPassword(),
                    _buildConfirmPassword(),
                    _buildSubmitButton(context)
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


final _firstNameController = TextEditingController(); //this line is outside the build() method

Widget _buildFirstName() {
  return TextFormField(
    controller: _firstNameController,
    validator: (value) =>
    value.isEmpty ? "First name cannot be empty" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration:
    _buildInputDecoration("First name", ''),
  );
}


final _lastNameController = TextEditingController(); //this line is outside the build() method

Widget _buildLastName() {
  return Container(
      child: TextFormField(
        controller: _lastNameController,
        validator: (value) =>
        value.isEmpty ? "Last name cannot be empty" : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration("Last name", ''),
      ));
}


final _userNameController = TextEditingController(); //this line is outside the build() method

Widget _buildUserName() {
  return TextFormField(
    controller: _userNameController,
    validator: (value) =>
    value.isEmpty ? "Username cannot be empty" : null,
    //validator: (value) => !isEmail(value) ? "Sorry, we do not recognize this email address" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration: _buildInputDecoration("Username", ''),
  );
}


final _passwordController = TextEditingController(); //this line is outside the build() method

Widget _buildPassword() {
  return TextFormField(
    obscureText: true,
    validator: (value) =>
    value.length <= 6 ? "Password must be 6 or more characters in length" : null,
    style: TextStyle(
        color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
    decoration:
    _buildInputDecoration("Password", ''),
  );
}


Widget _buildConfirmPassword() {
  return Container(
      child: TextFormField(
        obscureText: true,
        validator: (value) => value.isEmpty ||
            (value.isNotEmpty && value != _passwordController.text)
            ? "Must match the previous entry"
            : null,
        style: TextStyle(
            color: Color.fromRGBO(252, 252, 252, 1), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration("Confirm password", ''),
      ));
}

Widget _buildSubmitButton(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 43.0),
    width: MediaQuery.of(context).size.width * 0.62,
    child: RaisedButton(
      child: const Text(
        "Submit",
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