import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

final TextEditingController _heightController = TextEditingController();
final TextEditingController _weightController = TextEditingController();
double? _result=0;


class _InputPageState extends State<InputPage> {
  void calculate(){
    double height = double.parse(_heightController.text)/100;
    double weight = double.parse(_weightController.text);
    double bmi = weight/ (height*height);
    _result = bmi;
    print(_result);
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: Scaffold(
      appBar: AppBar(
        title: Text('BMI calculator'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20,50,20,0),
          child: Column(

            children: <Widget>[
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter your height'
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Enter your Weight'
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: ElevatedButton(onPressed: (){
                  calculate();
                }, child: const Text('Calculate')),
              ),
              Container(

                margin: EdgeInsets.only(top: 50),
                height: 50,
                width: 300,
                color: Colors.cyan,
                child:Column(
                  children:[
                    Text(_result!.toStringAsFixed(3), style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),textAlign: TextAlign.center,),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Text(_result! > 24.9? 'Do regular workout' : 'Great',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

