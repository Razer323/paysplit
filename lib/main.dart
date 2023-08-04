//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Paysplit createState() => Paysplit();
}

// Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Paysplit(),
//   );
// }
class Paysplit extends State<MainApp> {
  //Paysplit({super.key});

  final formkey = GlobalKey<FormState>();
  double subT = 0;
  double per = 0;
  double people = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromRGBO(255, 0, 212, 50),
                Color.fromRGBO(0, 221, 255, 20)
              ]),
        ),
        child: Form(
            key: formkey,
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildBill(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildTip(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildPeople(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: buildButton(),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      r"$" "${total.toString()}",
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget buildBill() => TextFormField(
        decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  BorderSide(width: 10, color: Color.fromARGB(255, 0, 0, 0)),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            labelText: 'Enter the bill amount',
            hintText: '22.34'),
        validator: (value) {
          if (value!.contains(RegExp(r'[a-zA-Z]'))) {
            return 'Please enter a valid number';
          } else {
            return null;
          }
        },
        onChanged: (value) => subT = double.parse(value),
      );
  Widget buildTip() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          labelText: 'Enter the Tip %',
          hintText: '15',
        ),
        validator: (value) {
          if (value!.contains(RegExp(r'[a-zA-Z]'))) {
            return 'Please enter a valid number';
          } else {
            return null;
          }
        },
        onChanged: (value) => per = double.parse(value),
      );

  Widget buildPeople() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderSide:
                BorderSide(width: 3, color: Color.fromARGB(255, 0, 0, 0)),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          labelText: 'Enter the number of people',
          hintText: '2',
        ),
        validator: (value) {
          if (value!.contains(RegExp(r'[a-zA-Z]'))) {
            return 'Please enter a valid number';
          } else {
            return null;
          }
        },
        onChanged: (value) => people = double.parse(value),
      );

  Widget buildButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(2, 217, 153, 70),
            textStyle: const TextStyle(
                color: Colors.black,
                 fontSize: 10, 
                 fontStyle: FontStyle.normal),
          ),
        onPressed: () {
          final isValid = formkey.currentState?.validate();
          if (isValid != null && isValid) {
            setState(() {
              total = (subT + (subT * (per / 100))) / people;
            });
          }
        },
        child: const Text('Calculate'),
      );

  double Calculate(double sub, double pe, double peopl) {
    total = (sub + (sub * (pe / 100))) / peopl;
    return total;
  }
}
