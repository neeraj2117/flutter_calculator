import 'package:flutter/material.dart';

class Calci extends StatefulWidget {
  @override
  State<Calci> createState() => _CalciState();
}

class _CalciState extends State<Calci> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CALCULATOR (made by Neeraj)"),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.history), onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content:
                  Text('This is a history')
                  )
                );
              },
          )
        ],
      ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child:Container(
                padding: EdgeInsets.all(30.0),
                alignment: Alignment.bottomRight,
                child: Text(text, style: const TextStyle(fontSize: 65.0, fontWeight: FontWeight.w500,
                  color: Colors.orange
                  ),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                customOutlinedButton("9"),
                customOutlinedButton("8"),
                customOutlinedButton("7"),
                customOutlinedButton("+")
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("6"),
                customOutlinedButton("5"),
                customOutlinedButton("4"),
                customOutlinedButton("-")
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("3"),
                customOutlinedButton("2"),
                customOutlinedButton("1"),
                customOutlinedButton("x")
              ],
            ),
            Row(
              children: <Widget>[
                customOutlinedButton("C"),
                customOutlinedButton("0"),
                customOutlinedButton("="),
                customOutlinedButton("/")
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget customOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(42.0)
        ),
        onPressed: () => btnClicked(val),
        child: Text(val, style: const TextStyle(fontSize: 35.0, color: Colors.deepOrange),
        )
      )
    );
  }

  late int first, second;
  late String res, text = "";
  late String opp;

  void btnClicked(String btnText) {
    if (btnText == "C") {
      res = "";
      text = "";
      first = 0;
      second = 0;
    } else if (btnText == "+" ||
        btnText == "-" ||
        btnText == "x" ||
        btnText == "/") {
      first = int.parse(text);
      res = "";
      opp = btnText;
    } else if (btnText == "=") {
      second = int.parse(text);
      if (opp == "+") {
        res = (first + second).toString();
      }
      if (opp == "-") {
        res = (first - second).toString();
      }
      if (opp == "x") {
        res = (first * second).toString();
      }
      if (opp == "/") {
        res = (first ~/ second).toString();
      }
    } else {
      res = int.parse(text + btnText).toString();
    }

    setState(() {
      text = res;
    }
    );
  }
}
