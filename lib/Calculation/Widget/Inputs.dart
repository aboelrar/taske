import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taske/Calculation/Model/Nums.dart';

class Inputs extends StatefulWidget {
  var firstNum, secondNum;
  Nums num;

  Inputs(this.firstNum, this.secondNum, this.num);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return InputState(Inputs(this.firstNum, this.secondNum, this.num));
  }
}

class InputState extends State<Inputs> {
  Inputs inputs;

  InputState(this.inputs);


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 120,
            child: TextFormField(
              controller: inputs.firstNum,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                hintText: 'First Number',
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: 20),
            width: 120,
            child: TextFormField(
              controller: inputs.secondNum,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    )),
                hintText: 'Second Number',
              ),
            ),
          ),
        ],
      ),
    );
  }

}
