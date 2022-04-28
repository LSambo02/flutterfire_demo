import 'package:flutter/material.dart';
import 'package:flutterfire_demo/helpers/constantes.dart';
import 'package:flutterfire_demo/services/auth_service.dart';
import 'package:flutterfire_demo/widgets/custom_button.dart';
import 'package:flutterfire_demo/widgets/custom_textField.dart';

class PhoneValidationScreen extends StatefulWidget {
  @override
  _PhoneValidationScreenState createState() => _PhoneValidationScreenState();
}

class _PhoneValidationScreenState extends State<PhoneValidationScreen> {
  late String _numero;
  AuthService authService = AuthService();
  bool _isDoneRegister = false, _isCodeSent = false, _isLoadingRegister = false;
  late String _message = '', _verificationId, _codigo;
  late int _resendToken;

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
                  validatorText: 'Insira um número válido',
                  hintText: _isDoneRegister
                      ? 'Código de verificação'
                      : 'Número de telefone',
                  inputType: TextInputType.number,
                  onChange: (value) {
                    _isDoneRegister ? _codigo = value : _numero = value;
                  },
                ),
                _isDoneRegister
                    ? SizedBox(
                        height: 30,
                        child: Text(_message),
                      )
                    : SizedBox(),
                _isLoadingRegister
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onTapped: _isDoneRegister
                            ? () {
                                authService
                                    .confirmPhoneVerificationAuth(_codigo)
                                    .whenComplete(() {})
                                    .then((value) {
                                  setState(() {
                                    _message = value ?? '';
                                  });
                                });
                              }
                            : () {
                                // if (formKey.currentState.validate()) {
                                setState(() {
                                  _isLoadingRegister = true;
                                });
                                authService
                                    .phoneVerificationAuth(_numero)
                                    .whenComplete(() {})
                                    .then((value) {
                                  setState(() {
                                    _isLoadingRegister = false;
                                    _isDoneRegister = true;
                                    print('value: $value');
                                    if (value == null) {
                                      setState(() {
                                        _message = 'value[0]';
                                        _verificationId = 'value[1]';
                                        _resendToken = 0;
                                        _isCodeSent = true;
                                      });
                                    } else if (value.length > 1) {
                                      setState(() {
                                        _message = value[0];
                                        _verificationId = value[1];
                                        _resendToken = value[2];
                                        _isCodeSent = true;
                                      });
                                    } else {
                                      _message = value[0];
                                      _isCodeSent = true;
                                    }
                                    // _isLoadingRegister = false;
                                  });
                                });
                                // }
                              },
                        buttonWidth: 300,
                        isPersonalized: false,
                        title: 'Enviar código de confirmação',
                      ),
                FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, phone_validation_screen),
                    child: Text('Usar email para validação'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
