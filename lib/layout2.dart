import 'package:bollywood_quiz/database.dart';
import 'package:bollywood_quiz/layout1.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'layout1.dart';

void main() => runApp(MaterialApp(home: MyApp2()));

class MyApp2 extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<MyApp2> {
  Database mydatabase = Database();
  int totalRight = 0;
   int totalDone = 0;
  void checkans(bool a) {
    bool checkans = mydatabase.getAnswer();

    if (a == checkans) {
      print('right');
      totalRight++;
    } else {
      print('Wrong');
    }
    setState(() {
      if (mydatabase.isFinished() == true) {
        Alert(
          style: AlertStyle(
            isOverlayTapDismiss: false,
          ),
          context: context,
          title: "Bollywood Quiz",
          desc: ' $totalRight/${mydatabase.totalQuestion()} You Tried Well',
          buttons: [
            DialogButton(
              child: Text(
                "Exit",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AfterSplash()),
                );
              },
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
            DialogButton(
              child: Text(
                "Play Again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
            )
          ],
        ).show();
        totalRight = 0;
        mydatabase.reset();
      } else {
        mydatabase.getNextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(116, 116, 191, 1.0),
      appBar: AppBar(
        title: Text('Bollywood Quiz'),
        backgroundColor: Color(0xFF083663),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0),
        ])),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
             CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.green,
                child: Text('$totalDone/${mydatabase.totalQuestion()}',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 30.0),),
              ),
              SizedBox(
                height: 70.0,
              ),
              Expanded(
                child: Text(
                  mydatabase.getQuestion().toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    
                    Container(
                      height: 50.0,
                       width: 150.0,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          'True',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                        onPressed: () {
                          checkans(true);
                        },
                      ),
                    ),
                    Container(
                      height: 50.0,
                      width: 150.0,
                      child: RaisedButton(
                        child: Text(
                          'False',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        color: Color(0xFF083663),
                        onPressed: () {
                          checkans(false);
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
