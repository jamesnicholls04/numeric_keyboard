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
      {Key? key,
      required this.onKeyboardTap,
      this.decoration = const BoxDecoration(),
      this.height = 200,
      this.padding = const EdgeInsets.all(0),
      this.textStyle = const TextStyle(
          fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
      required this.rightButtonFn,
      required this.rightButton,
      required this.leftButtonFn,
      required this.leftButton,
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
      decoration: widget.decoration,
      padding: widget.padding,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                _calcButton('1', 1),
                const Expanded(child: SizedBox()),
                _calcButton('2', 1),
                const Expanded(child: SizedBox()),
                _calcButton('3', 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                _calcButton('4', 1),
                const Expanded(child: SizedBox()),
                _calcButton('5', 1),
                const Expanded(child: SizedBox()),
                _calcButton('6', 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                _calcButton('7', 1),
                const Expanded(child: SizedBox()),
                _calcButton('8', 1),
                const Expanded(child: SizedBox()),
                _calcButton('9', 1),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: BouncingWidget(
                      opacityReductionFactor: 3,
                      onPressed: widget.leftButtonFn,
                      duration: const Duration(milliseconds: 100),
                      child: Container(
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: widget.leftButton)),
                ),
                const Expanded(child: SizedBox()),
                _calcButton('0', 1),
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 1,
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
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value, int flex) {
    return Expanded(
      flex: flex,
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
            style: widget.textStyle,
          ),
        ),
      ),
    );
  }
}
