import 'package:flutter/material.dart';
import 'package:total/util/tools.dart';

class TwoButton extends StatelessWidget {
  final Function onPressed1;
  final Function onPressed2;
  final String buttonText1;
  final String buttonText2;
  TwoButton(
      {this.onPressed1, this.onPressed2, this.buttonText1, this.buttonText2});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: onPressed1,
              child: Text(
                '$buttonText1',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff8C8C8C),
                ),
              ),
            ),
          ),
          VerticalLine(
            color: Color(0xffD9D9D9),
          ),
          Expanded(
            child: FlatButton(
              onPressed: onPressed2,
              child: Text(
                '$buttonText2',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff1890FF),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}