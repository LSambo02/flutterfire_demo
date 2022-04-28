import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutterfire_demo/helpers/constantes.dart';
import 'package:flutterfire_demo/services/auth_service.dart';
import 'package:flutterfire_demo/widgets/custom_button.dart';
import 'package:flutterfire_demo/widgets/custom_textField.dart';

class FireHome extends StatefulWidget {
  @override
  _FireHomeState createState() => _FireHomeState();
}

class _FireHomeState extends State<FireHome> {
  late String _email, _password;
  AuthService authService = AuthService();
  bool _isDoneRegister = false,
      _isDoneSignIn = false,
      _isLoadingRegister = false,
      _isLoadingGSignIn = false,
      _isLoadingSignIn = false;
  late String _message;
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
                          if (formKey.currentState!.validate()) {
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
                        title: 'Registo',
                      ),
                _isLoadingSignIn
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onTapped: () {
                          if (formKey.currentState!.validate()) {
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
                        title: 'Authenticar',
                      ),
                _isLoadingGSignIn
                    ? Center(child: CircularProgressIndicator())
                    : SignInButton(
                        Buttons.Google,
                        text: "Entrar com Google",
                        onPressed: () {
                          setState(() {
                            _isLoadingGSignIn = true;
                          });
                          authService
                              .signInWithGoogle()
                              .whenComplete(() {})
                              .then((value) {
                            setState(() {
                              _isLoadingGSignIn = false;
                              _isDoneSignIn = true;
                              _message = value;
                            });
                            Navigator.pushReplacementNamed(
                                context, collection_screen);
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
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
