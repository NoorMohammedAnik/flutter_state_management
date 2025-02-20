import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {

  //declare controller
  var firstController = TextEditingController();
  var secondController = TextEditingController();

  //text for result
 // String result = "0";


  //getx
  var result = "0".obs;

  sum (String firstNumber, String secondNumber){

    int first = int.parse(firstNumber);
    int second = int.parse(secondNumber);
    int sum = first + second;


    // setState(() {
    //   result = sum.toString();
    // });

    //getx
    result.value = sum.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Center(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter First Number",
                  hintText: "0",
                  prefixIcon: Icon(Icons.numbers)
                ),
              ),
            ),


            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Enter Second Number",
                    hintText: "0",
                    prefixIcon: Icon(Icons.numbers)
                ),
              ),
            ),


            SizedBox(height: 20,),

            ElevatedButton.icon(
              onPressed: () {

                String firstNumber = firstController.text;
                String secondNumber = secondController.text;

                if(firstNumber.isNotEmpty && secondNumber.isNotEmpty){
                  //call sum function
                  sum(firstNumber,secondNumber);
                }
                else
                  {
                    Get.snackbar("Error", "Please enter both numbers");
                  }

              },
              label: Text("Calculate"),
              icon: Icon(Icons.calculate_outlined),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),

            SizedBox(height: 20,),

            // Text(result,style: TextStyle(
            //   fontSize: 50,
            //   fontWeight: FontWeight.bold,
            //   color: Colors.blue
            // ),),

            //getx
            Obx(() => Text(result.value,style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.blue
            )))

          ],
        ),
      ),
    );
  }
}
