import 'package:flutter/cupertino.dart';

class Nums extends ChangeNotifier {
  double _fNum, _sNum;
  var _operation = 'C';
  var _isPending = false;

  List<dynamic> _results = new List();

  double get fNum => _fNum;

  setFNum(double value) {
    _fNum = value;
    notifyListeners();
  }

  get sNum => _sNum;

  setSNum(double value) {
    _sNum = value;
    notifyListeners();
  }

  get operation => _operation;

  setOperator(var value) {
    _operation = value;
    notifyListeners();
  }

  get results => _results;



  setResults(var value) {
    _results.add(value);
    notifyListeners();
  }

  get isPending => _isPending;

  setisPending(value) {
    _isPending = value;
    notifyListeners();
  }
}
