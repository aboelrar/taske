import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Seconds extends StatelessWidget {
  var seconds;

  Seconds(this.seconds);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(right: 60, left: 60, top: 10),
      child: TextFormField(
        controller: seconds,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
          hintText: 'Please Enter Seconds',
        ),
      ),
    );
  }
}
