import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  var busy = false;
  var invert = false;
  Function func;
  var text = "";

  Loading({
    this.busy,
    this.invert,
    this.func,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            alignment: Alignment.center,
            height: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
            ),
          )
        : Container(
            margin: EdgeInsets.all(30),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: invert
                    ? Theme.of(context).primaryColor
                    : Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(60)),
            child: FlatButton(
              onPressed: func,
              child: Text(
                text,
                style: TextStyle(
                  color: invert ? Colors.white : Theme.of(context).primaryColor,
                  fontSize: 25,
                  fontFamily: "Big Shouders Display",
                ),
              ),
            ),
          );
  }
}
