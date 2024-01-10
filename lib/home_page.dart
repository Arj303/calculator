import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget calcbutton(String btntxt,Color btncolor,Color txcolor)
  {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          calculation(btntxt);
        },
        child: Text(btntxt,
          style: TextStyle(
            fontSize: 35,
            color: txcolor,
          ),

        ),


        
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFA732),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white,
                    fontSize:100
                    ),

                  ) ,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton("AC", Colors.grey, Colors.black),
                calcbutton("+/-", Colors.grey, Colors.black),
                calcbutton("%", Colors.grey, Colors.black),
                calcbutton("/", Colors.grey, Colors.black),
              ],

            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton("7", Colors.grey, Colors.black),
                calcbutton("8", Colors.grey, Colors.black),
                calcbutton("9", Colors.grey, Colors.black),
                calcbutton("x", Colors.grey, Colors.black),
              ],

            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton("4", Colors.grey, Colors.black),
                calcbutton("5", Colors.grey, Colors.black),
                calcbutton("6", Colors.grey, Colors.black),
                calcbutton("-", Colors.grey, Colors.black),
              ],

            ),
            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton("1", Colors.grey, Colors.black),
                calcbutton("2", Colors.grey, Colors.black),
                calcbutton("3", Colors.grey, Colors.black),
                calcbutton("+", Colors.grey, Colors.black),
              ],

            ),
            SizedBox(height: 10,),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){

                      },
                      child: Text("0",
                      style: TextStyle(
                        fontSize: 35,
                        color:Colors.black,
                      ),
                      )
                  ),
                  calcbutton(".", Colors.grey, Colors.black),
                  calcbutton("=", Colors.grey, Colors.black),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }


  //Calculator logic
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
  void calculation(btnText) {


    if(btnText  == 'AC') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';

    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
        finalResult = add();
      } else if( preOpr == '-') {
        finalResult = sub();
      } else if( preOpr == 'x') {
        finalResult = mul();
      } else if( preOpr == '/') {
        finalResult = div();
      }

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if(opr == '+') {
        finalResult = add();
      } else if( opr == '-') {
        finalResult = sub();
      } else if( opr == 'x') {
        finalResult = mul();
      } else if( opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
      result = numOne / 100;
      finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }

    else if(btnText == '+/-') {
      result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();
      finalResult = result;

    }

    else {
      result = result + btnText;
      finalResult = result;
    }


    setState(() {
      text = finalResult;
    });

  }


  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }
  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {

    if(result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if(!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

}






