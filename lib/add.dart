import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';

class Add extends StatefulWidget {
  Add({Key key, this.db}) : super(key: key);
  Database db;
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController weightController = new TextEditingController();
  TextEditingController heightController = new TextEditingController();
  TextEditingController sexController = new TextEditingController();
  TextEditingController yearController = new TextEditingController();
  TextEditingController bmController = new TextEditingController();
  double result;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff00BCD1),
      appBar: AppBar(
        //backgroundColor: Color.fromRGBO(56, 75, 49, 1.0),
        title: Text("ADD BMI"),
        actions: [
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // widget.db.delete(widget.country["id"]);
                // Navigator.pop(context, true);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Name-Surname"),
                controller: nameController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Weight"),
                controller: weightController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Height"),
                controller: heightController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Sex"),
                controller: sexController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("Year"),
                controller: yearController,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                decoration: inputDecoration("BMI"),
                controller: bmController,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.pinkAccent,
                child: Text(
                  "Calculate",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: calculateBMI,
              ),
              SizedBox(height: 20),
              Text(
                result == null ? "Enter Value" : "${result.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 19.4,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        color: Colors.transparent,
        child: BottomAppBar(
          color: Colors.transparent,
          child: OutlinedButton(
              //color: Colors.black,
              onPressed: () {
                widget.db.create(
                    nameController.text,
                    weightController.text,
                    heightController.text,
                    sexController.text,
                    yearController.text,
                    bmController.text);
                Navigator.pop(context, true);
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String labelText) {
    return InputDecoration(
      focusColor: Colors.white,
      labelStyle: TextStyle(color: Colors.white),
      labelText: labelText,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.0,
        ),
      ),
    );
  }

  void calculateBMI() {
    double height = double.parse(heightController.text) / 100;
    double weight = double.parse(weightController.text);

    double heightSquare = height * height;
    double results = weight / heightSquare;
    result = results;
    setState(() {});
  }
}
