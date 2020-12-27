import 'dart:async';

import 'package:flutter/material.dart';
import 'package:taske/Calculation/Model/Nums.dart';

class DoOperation {
  // ignore: missing_return
  Future<double> doOperation(Nums nums, int seconds) async {
    Timer(
      Duration(seconds: seconds),
      () => result(nums.fNum, nums.sNum, nums.operation, nums),
    );
  }

  //GET RESULT
  double result(double firstNum, double secondNum, var operation, Nums nums) {

    double result;

    switch (operation) {
      case "+":
        {
          result = firstNum + secondNum; //ADD
        }
        break;

      case "-":
        {
          result = firstNum - secondNum; //MIN
        }
        break;

      case "*":
        {
          result = firstNum * secondNum; //MUL
        }
        break;

      case "/":
        {
          result = firstNum / secondNum; //DIV
        }
        break;

      default:
        {
          print('Not Found');
        }
        break;
    }

    nums.setResults('$result'); //ADD TO LIST
    nums.setisPending(false);  //SET PENDING FALSE

    print('zolla$result');

    return result;
  }
}
