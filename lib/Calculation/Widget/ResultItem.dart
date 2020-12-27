import 'package:flutter/cupertino.dart';

class ResultItem extends StatelessWidget {
  String text;

  ResultItem(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(left: 20),
        child: Text(
          text,
          style: TextStyle(fontSize: 24),
        ));
  }
}
