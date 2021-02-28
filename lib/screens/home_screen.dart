import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_demo/helpers/constantes.dart';
import 'package:flutterfire_demo/services/AuthService.dart';
import 'package:flutterfire_demo/widgets/custom_button.dart';
import 'package:flutterfire_demo/widgets/custom_textField.dart';

class FireHome extends StatefulWidget {
  @override
  _FireHomeState createState() => _FireHomeState();
}

class _FireHomeState extends State<FireHome> {
  String _email, _password;
  AuthService authService = AuthService();
  bool _isDoneRegister = false,
      _isDoneSignIn = false,
      _isLoadingRegister = false,
      _isLoadingSignIn = false;
  String _message;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  validatorText: 'Insira um texto válido',
                  hintText: 'Email',
                  onChange: (value) {
                    _email = value;
                  },
                ),
                CustomTextField(
                  validatorText: 'Insira um texto válido',
                  hintText: 'Password',
                  onChange: (value) {
                    _password = value;
                  },
                  isPasswordField: true,
                ),
                _isDoneRegister || _isDoneSignIn
                    ? SizedBox(
                        height: 30,
                        child: Text(_message),
                      )
                    : SizedBox(),
                _isLoadingRegister
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onTapped: () {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              _isLoadingRegister = true;
                            });
                            authService
                                .register(_email, _password)
                                .whenComplete(() {})
                                .then((value) {
                              setState(() {
                                _isLoadingRegister = false;
                                _isDoneRegister = true;
                                _message = value;
                              });
                            });
                          }
                        },
                        buttonWidth: 300,
                        isPersonalized: false,
                        title: 'Register',
                      ),
                _isLoadingSignIn
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onTapped: () {
                          if (formKey.currentState.validate()) {
                            setState(() {
                              _isLoadingSignIn = true;
                            });
                            authService
                                .signIn(_email, _password)
                                .whenComplete(() {})
                                .then((value) {
                              setState(() {
                                _isLoadingSignIn = false;
                                _isDoneSignIn = true;
                                _message = value;
                              });
                            });
                          }
                        },
                        buttonWidth: 300,
                        isPersonalized: false,
                        title: 'Authenticate',
                      ),
                SizedBox(
                  height: 20,
                ),
                FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, phone_validation_screen),
                    child: Text('Usar número de telemóvel para validação'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
