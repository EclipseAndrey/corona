import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Content(),
    );
  }
  Widget Content(){
    return Container(
      width: MediaQuery.of(context).size.width,

      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: Container(
                height: 150,
                child: Image.asset("assets/korona.png")) ,
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Тест на признаки",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: "MPLUS",
                      fontWeight: FontWeight.w600

                  ),
                ),
                Text(
                  "коронавируса",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontFamily: "MPLUS",
                    fontWeight: FontWeight.w600
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.90,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 38.0, bottom: 28),
                    child: Text(
                      "Во время пандемии COVID-19 стоит с особой внимательность относится к своему самочувствию. Данный тест поможет вам распознать симптомы COVID-19 и определить вероятность заражения им.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontFamily: "MPLUS",
                      ),
                    ),
                  ),
                ),
                 Container(
                  width: MediaQuery.of(context).size.width * 0.90,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/start');

                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        side: BorderSide(color: Colors.green)),
                    color: Colors.green,
                    textColor: Colors.greenAccent,
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Начать",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: "MPLUS",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
