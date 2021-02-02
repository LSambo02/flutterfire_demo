import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  String validatorText, hintText;
  void Function(String value) onChange;
  void Function(String value) validator;
  bool isPasswordField;
  TextInputType inputType;

  CustomTextField(
      {@required this.validatorText,
      @required this.hintText,
      @required this.onChange,
      this.isPasswordField = false,
      this.inputType,
      this.validator});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30, left: 12, right: 12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        obscureText: widget.isPasswordField ? isObscureText : false,
        validator: widget.validator ??
            (val) {
              return val.isEmpty ? widget.validatorText : null;
            },
        keyboardType: widget.inputType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            suffixIcon: widget.isPasswordField
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        isObscureText = !isObscureText;
                      });
                    },
                    child: Icon(isObscureText
                        ? Icons.visibility_off
                        : Icons.visibility),
                  )
                : SizedBox(),
            hintStyle: TextStyle(color: Colors.white, fontSize: 17)),
        cursorColor: Colors.white,
        onChanged: widget.onChange,
      ),
    );
  }
}
