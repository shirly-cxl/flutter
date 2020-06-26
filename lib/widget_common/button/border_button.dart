import 'package:flutter/material.dart';

class BorderButton extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  BorderButton({
    this.label = '按钮',
    this.borderColor = const Color(0xffD84969),
    this.color = const Color(0xffD6637C),
    this.textColor = const Color(0xffD84969),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(color: borderColor),
      ),
      height: 45,
      child: new FlatButton(
        color: color.withOpacity(0.3),
        padding: EdgeInsets.symmetric(vertical: 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        onPressed: () {
          if (onPressed != null) onPressed();
        },
        child: new Text(
          label,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
