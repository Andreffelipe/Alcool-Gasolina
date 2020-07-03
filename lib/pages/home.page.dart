import 'package:alcoolGasolina/widgets/logo.widget.dart';
import 'package:alcoolGasolina/widgets/submit-form.dart';
import 'package:alcoolGasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = MoneyMaskedTextController();
  var _alcCtrl = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = 'Compensa utilizar álcool';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: _color,
          child: ListView(
            children: <Widget>[
              Logo(),
              _completed
                  ? Success(
                      result: _resultText,
                      reset: reset,
                    )
                  : SubmitForm(
                      gasCtrl: _gasCtrl,
                      alcCtrl: _alcCtrl,
                      busy: _busy,
                      submitFunc: calculate,
                    )
            ],
          ),
        ));
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double res = alc / gas;

    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });
    return Future.delayed(
      Duration(seconds: 3),
      () => {
        setState(
          () {
            if (res >= 0.7) {
              _resultText = "Compensa utilizar Gasolina";
            } else {
              _resultText = "Compensa utilizar Álcool";
            }
            _completed = true;
            _busy = false;
          },
        )
      },
    );
  }

  reset() {
    setState(() {
      _gasCtrl = MoneyMaskedTextController();
      _alcCtrl = MoneyMaskedTextController();
      _busy = false;
      _completed = false;
      _color = Colors.deepPurple;
    });
  }
}
