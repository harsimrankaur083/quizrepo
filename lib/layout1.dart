import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'layout2.dart';
void main() => runApp(MaterialApp(home: MyApp1()));
class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  @override
  Widget build(BuildContext context) {
      return new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new AfterSplash(),
      title: new Text('Science quiz',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0
      ),),
      image: new Image.network("icon.png"),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.red
    );
    
  }
}
class AfterSplash extends StatefulWidget {
  @override
  _AfterSplashState createState() => _AfterSplashState();
}

class _AfterSplashState extends State<AfterSplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Science Quiz'),
         backgroundColor: Color(0xFF083663),
      ),
      body:
      Container(
        decoration: BoxDecoration(
          
          image: DecorationImage(
            image: AssetImage("images/quizback.jpg"),
            fit:BoxFit.cover,
        ),
      ),
      
    child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
          Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Container(
                    height: 50.0,
                    width: 250.0,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        'Start Game',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                        ),
                      ),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                      onPressed: () {
                
                     Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp2()),
            );
                      },
                    ),
                  ),
                   ],
              ),
            )
          ],
    ),
    )
    
    );
    
  }
}