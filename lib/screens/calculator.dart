import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController firstTFcontroller = TextEditingController();
  TextEditingController secondTFcontroller = TextEditingController();

  double firstNum = 0;
  double secondNum = 0;

  var result = 'NaN';

  List<String> _operator = ['x', '+', '-', '/'];

  String _buttonText = 'x';


  @override
  Widget build(BuildContext context) {


    @override
    void initState() {
      super.initState();
      setState(() {
        _buttonText = _operator[0];
      });
    }

    void caculate() {
      if(_buttonText == '+') {
        result = (firstNum + secondNum).toString();
      } else if (_buttonText == '-') {
        result = (firstNum - secondNum).toString();
      } else if (_buttonText == 'x') {
        result = (firstNum * secondNum).toString();
      } else {
        if (secondNum == 0) {
          result = '0으로 나눌 수 없습니다.';
        } else {
          result = (firstNum / secondNum).toString();
        }
      }
    }

    void setResult() {
      setState(() {
        firstNum = double.tryParse(firstTFcontroller.text) ?? 0;
        secondNum = double.tryParse(secondTFcontroller.text) ?? 0;

        caculate();
      });

    }

    @override
    void dispose() {
      firstTFcontroller.dispose();
      secondTFcontroller.dispose();
      super.dispose();
    }






    return SafeArea(

      child: Scaffold(
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Text("Result:$result"),
              TextFormField(
                controller: firstTFcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                keyboardType: TextInputType.number,  // 키보드가 숫자로 설정
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,  // 숫자만 입력 허용
                ],
              ),
              TextFormField(
                controller: secondTFcontroller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              DropdownButton<String>(
                value: _buttonText,
                items: _operator
                    .map((e) => DropdownMenuItem<String>(
                  value: e, // 선택 시 onChanged 를 통해 반환할 value
                  child: Text(e),
                ))
                    .toList(),
                onChanged: (value) { // items 의 DropdownMenuItem 의 value 반환
                  setState(() {
                    _buttonText = value!; //nullsafety 지정
                  });
                },
              ),
              ElevatedButton(
                onPressed: null,
                child: Text(
                  _buttonText,
                ),
              ),
              ElevatedButton(
                onPressed: setResult,
                child: const Text("계산"),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
