library numeric_keyboard;

import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  final TextStyle textStyle;
  final BoxDecoration decoration;
  final EdgeInsets padding;
  final Widget rightButton;
  final Function() rightButtonFn;
  final Widget leftButton;
  final Function() leftButtonFn;
  final double height;
  final KeyboardTapCallback onKeyboardTap;
  final MainAxisAlignment mainAxisAlignment;

  NumericKeyboard(
      {Key key,
      @required this.onKeyboardTap,
      this.decoration,
      this.height = 200,
      this.padding,
      this.textStyle,
      this.rightButtonFn,
      this.rightButton,
      this.leftButtonFn,
      this.leftButton,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: widget.decoration ?? BoxDecoration(),
      padding: widget.padding ?? EdgeInsets.only(left: 32, right: 32, top: 20),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              _calcButton('1'),
              _calcButton('2'),
              _calcButton('3'),
            ],
          ),
          Row(
            children: <Widget>[
              _calcButton('4'),
              _calcButton('5'),
              _calcButton('6'),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7'),
              _calcButton('8'),
              _calcButton('9'),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: BouncingWidget(
                    opacityReductionFactor: 3,
                    onPressed: widget.leftButtonFn,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: widget.leftButton)),
              ),
              _calcButton('0'),
              Expanded(
                child: BouncingWidget(
                    opacityReductionFactor: 3,
                    onPressed: widget.rightButtonFn,
                    duration: const Duration(milliseconds: 100),
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: widget.rightButton)),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value) {
    return Expanded(
      child: BouncingWidget(
        onPressed: () {
          widget.onKeyboardTap(value);
        },
        duration: const Duration(milliseconds: 100),
        opacityReductionFactor: 3,
        child: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Text(
            value,
            style: widget.textStyle ??
                TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
          ),
        ),
      ),
    );
  }
}
