import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taske/Calculation/Model/Nums.dart';

class Operators extends StatefulWidget {
  Nums nums;

  Operators(this.nums);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OperatorState(nums);
  }
}

class OperatorState extends State<Operators> {
  Nums nums;

  OperatorState(this.nums);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 5),
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          operator("+", Colors.red),
          operator("-", Colors.green),
          operator("*", Colors.yellow),
          operator("/", Colors.blue),
        ],
      ),
    );
  }

  Widget operator(var text, var color) {
    return GestureDetector(
      onTap: () {
        nums.setOperator(text);
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 50,
        width: 50,
        color: color,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
