import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:taske/Calculation/Model/Nums.dart';
import 'package:taske/Calculation/UI/DoOperation.dart';
import 'package:taske/Calculation/Widget/Inputs.dart';
import 'package:taske/Calculation/Widget/Operators.dart';
import 'package:taske/Calculation/Widget/ResultItem.dart';
import 'package:taske/Calculation/Widget/Seconds.dart';
import 'package:taske/MyLocation/UI/MyLocation.dart';
import 'package:toast/toast.dart';

class Calculation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CalculationState();
  }
}

class CalculationState extends State<Calculation> {
  TextEditingController firstNum = new TextEditingController();
  TextEditingController secondNum = new TextEditingController();
  TextEditingController seconds = new TextEditingController();
  double latData, lngData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //MY CURRENT LOCATION
    getCurrentLocation();

    if (firstNum.text == "") {
      firstNum.text = "0.0";
    }
    if (secondNum.text == "") {
      secondNum.text = "0.0";
    }
    if (seconds.text == "") {
      seconds.text = "0";
    }
  }

  @override
  Widget build(BuildContext context) {
    Nums nums = Provider.of<Nums>(context);

    List<dynamic> list = nums.results;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            myLocation(),
            isPending(nums),
            Operators(nums),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: 50,
              color: Colors.brown,
              child: Center(
                child: Text(
                  nums.operation,
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
              ),
            ),
            Inputs(firstNum, secondNum, nums),
            Seconds(seconds),
            GestureDetector(
              onTap: () {
                hitButton(nums);
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                height: 50,
                width: 50,
                color: Colors.orange,
                child: Center(
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return ResultItem(list[index]);
                },
                itemCount: list.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //HIT BUTTON
  hitButton(Nums nums) {
    if (nums.operation == "C") {
      Toast.show("Please Choose Operation", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else if (firstNum.text == "") {
      Toast.show("Please Insert First Number", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else if (secondNum.text == "") {
      Toast.show("Please Insert Second Number", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else if (seconds.text == "") {
      Toast.show("Please Insert Seconds", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else {
      nums.setisPending(true); //SET PENDING TRUE
      nums.setFNum(double.parse(firstNum.text)); //SET FIRST NUMBER
      nums.setSNum(double.parse(secondNum.text)); //SET SECOND NUMBER
      DoOperation().doOperation(nums, int.parse(seconds.text));
    }
  }

  //IS PENDING
  Widget isPending(Nums nums) {
    if (nums.isPending == false) {
      return Text("");
    } else if (firstNum.text == "") {
      Toast.show("Please Insert First Number", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else if (secondNum.text == "") {
      Toast.show("Please Insert Second Number", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else if (seconds.text == "") {
      Toast.show("Please Insert Seconds", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.TOP);
    } else {
      return Container(
          margin: EdgeInsets.only(top: 50),
          child: Text(
            "pending execution",
            style: TextStyle(fontSize: 20),
          ));
    }
  }

  //GO TO MAP
  Widget myLocation() {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return MyLocation(latData, lngData);
        }));
      },
      child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Text(
            'Go To My Location',
            style: TextStyle(
              fontSize: 17,
              decoration: TextDecoration.underline,
            ),
          )),
    );
  }

  //MY CURRENT LOCATION
  getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latData = position.latitude;
      lngData = position.longitude;
    });
  }
}
