import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMI(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BMI extends StatefulWidget {
  @override
  _BMIState createState() => _BMIState();
}

class _BMIState extends State<BMI> {

  TextEditingController _stones = new TextEditingController();
  TextEditingController _pounds = new TextEditingController();
  TextEditingController _feet = new TextEditingController();
  TextEditingController _inches = new TextEditingController();
  TextEditingController _kilograms = new TextEditingController();
  TextEditingController _metres = new TextEditingController();

  double stonesNum = 0.0;
  double poundsNum = 0.0;
  double feetNum = 0.0;
  double inchesNum = 0.0;
  double enterKilosNum = 0.0;
  double enterMetresNum = 0.0;
  double kilosNum = 0.0;//numerical answer to stones pounds calculation
  double metresNum = 0.0;//numerical answer to feet inches calculation
  double bmiNum = 0.0;//numerical answer to bmi calculation
  double stonesTotal = 0.0;
  double feetTotal = 0.0;
  double imperialPoundsBaseTen = 0.0;
  double imperialInchesBaseTen = 0.0;


  String inputStones = "";
  String inputPounds = "";
  String kilograms = "0.0";//output kg
  String inputFeet = "";
  String inputInches = "";
  String metres = "0.0";//output metres
  String inputWeight = "";//for bmi calculation
  String inputHeight = "";//for bmi calculation
  String outputBMI = "0.0";


  void weightCalculator(){
    inputStones = _stones.text;
    inputPounds = _pounds.text;
    stonesNum = double.parse(inputStones);
    poundsNum = double.parse(inputPounds);
    imperialPoundsBaseTen = (poundsNum /14) * 10;
    stonesTotal = stonesNum + (imperialPoundsBaseTen / 10);
    kilosNum = (stonesTotal * 6.35029);

    kilograms = kilosNum.toStringAsFixed(2);
    setState(() {
    });

  }

  void heightCalculator(){
    inputFeet = _feet.text;
    inputInches = _inches.text;
    feetNum = double.parse(inputFeet);
    inchesNum = double.parse(inputInches);
    imperialInchesBaseTen = (inchesNum /12) * 10;
    feetTotal = feetNum + (imperialInchesBaseTen / 10);
    metresNum = (feetTotal * 0.3048);

    metres = metresNum.toStringAsFixed(2);

    setState(() {
    });
  }

  void bmiCalculator(){
    inputWeight = _kilograms.text;
    inputHeight = _metres.text;
    enterKilosNum = double.parse(inputWeight);
    enterMetresNum = double.parse(inputHeight);
    bmiNum = enterKilosNum / (enterMetresNum * enterMetresNum);

    outputBMI = bmiNum.toStringAsFixed(2);
    setState(() {
    });
  }

  void reset(){
    setState(() {
      _stones.text = "";
      _pounds.text = "";
      _metres.text = "";
      _kilograms.text = "";
      _inches.text = "";
      _feet.text = "";
      kilograms = "0.0";
      metres = "0.0";
      outputBMI = "0.0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                    width: double.maxFinite,
                  ),
                  Text("Body Mass Index",
                  style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  ),
                  ),
                  Text("Calculator (BMI)",
                    style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                    width: double.maxFinite,
                  ),
                  Text("Convert Stones and",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text("Pounds to Kilograms",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Stones"
                                ),
                                controller:_stones,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Stones",
                            style: TextStyle(color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Pounds"
                                ),
                                controller: _pounds,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Pounds",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ignore: deprecated_member_use
                      Container(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.blue,
                            textColor: Colors.white,
                          splashColor: Colors.green,
                          onPressed: () {
                            weightCalculator();
                          },
                          child: Text("Convert",
                          style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 40, top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("$kilograms",
                            style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 35),
                            child: Text("Kilogrammes",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Convert Feet and",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Text("Inches to Metres",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Feet"
                                ),
                                controller: _feet,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Feet",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Inches"
                                ),
                                controller: _inches,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Inches",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ignore: deprecated_member_use
                      Container(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          splashColor: Colors.green,
                          onPressed: () {
                            heightCalculator();
                          },
                          child: Text("Convert",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 40, top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("$metres",
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 35),
                            child: Text("Metres",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Calculate BMI",
                    style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Kg"
                                ),
                                controller:_kilograms,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Weight(kg)",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 30, top: 10, right: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Height(m)"
                                ),
                                controller: _metres,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Height(m)",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ignore: deprecated_member_use
                      Container(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          splashColor: Colors.green,
                          onPressed: () {
                            bmiCalculator();
                          },
                          child: Text("Convert",
                            style: TextStyle(fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 80,
                            height: 40,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 40, top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text("$outputBMI",
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 35),
                            child: Text("BMI",
                              style: TextStyle(color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      reset();
                    },
                    color: Colors.blue,
                    textColor: Colors.white,
                    splashColor: Colors.green,
                    child: Text("Reset", style:
                    TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

