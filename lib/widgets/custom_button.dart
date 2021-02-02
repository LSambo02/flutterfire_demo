import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  void Function() onTapped;
  Color color;
  double buttonWidth;
  String title;
  bool isPersonalized = false;
  var childWidget;

  CustomButton(
      {@required this.onTapped,
      this.color,
      @required this.buttonWidth,
      this.title,
      @required this.isPersonalized,
      this.childWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTapped,
        child: Container(
          decoration: BoxDecoration(
            color: color ?? Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          width: buttonWidth,
          padding: EdgeInsets.symmetric(vertical: 18),
          child: isPersonalized
              ? childWidget
              : Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
        ),
      ),
    );
  }
}
