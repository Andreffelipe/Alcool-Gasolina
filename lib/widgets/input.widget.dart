import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Input extends StatelessWidget {
  var label = '';
  var ctrl = MoneyMaskedTextController();

  Input({@required this.label, @required this.ctrl});

  @override
  Widget build(context) {
    return Row(
      children: <Widget>[
        Container(
            height: 100,
            alignment: Alignment.centerRight,
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontFamily: "Big Shouders Display",
              ),
            )),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: ctrl,
            keyboardType: TextInputType.number,
            style: TextStyle(
              color: Colors.white,
              fontSize: 45,
              fontFamily: "Big Shouders Display",
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
