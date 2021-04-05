import 'package:business_card_project/profileDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flip_card/flip_card.dart';



class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    //AddCard();
    Navigator.pushNamed(context, "/newcard");
    setState(() {
      _counter++;
    });
  }

  //DBProvider.db.ca

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        //future: DBProvider.db.cards(),
        child: ListView(
          children: <Widget>[
            FlipCard(
              direction: FlipDirection.HORIZONTAL,
              front: Container(
                margin: EdgeInsets.only(left: 10.0, top: 45.0, right: 10.0, bottom: 20.0),
                height: 205,
                width: 400,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(
                      color: Colors.pink.withOpacity(0.6),
                      blurRadius: 6,
                      offset: Offset(1, 1),
                    )]
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                  padding: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                  color: Colors.teal,
                  child: ListView(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [profilePhoto()],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                                padding: EdgeInsets.only(left: 4.0),
                                height: 98,
                                width: 280,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Name: Nadiia Skyba    '
                                        'Company: Dress_for_day '
                                        'Phone: +380672548529       '
                                        'Email: nadiia.skyba@gmail.com'),
                                  ],
                                )
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Text("DressForDay - it's the easy way to be different. "
                                      "We are the first rental service for evening and cocktail dresses in Kyiv. "
                                      "Our main advantage is the best prices for the rental of branded dresses in Kyiv !!!"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              back: Container(
                margin: EdgeInsets.only(left: 10.0, top: 45.0, right: 10.0, bottom: 20.0),
                height: 205,
                width: 400,
                decoration: BoxDecoration(
                    //color: Colors.white.withOpacity(0.9),
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(
                      color: Colors.pink.withOpacity(0.6),
                      blurRadius: 6,
                      offset: Offset(1, 1),
                    )]
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                  padding: EdgeInsets.only(left: 5.0, top: 10.0, right: 5.0, bottom: 10.0),
                  color: Colors.teal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          child: Hero(
                            tag: widget,
                            child: photoQRcode(),
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return QRcodeSection();
                            }));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Your number of cards:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),

      ),
      drawer: ProfileDrawer(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



Widget profilePhoto() =>
    Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('image/dress_for_day.jpg'),
          radius: 45,
        ),
      ],
    );

Widget photoQRcode() =>
    Image(
      image: AssetImage('image/QRcode.png'),
      height: 150,
      width: 150,
    );


class QRcodeSection extends StatelessWidget {
  final String image = 'image/QRcode.png';


  @override
  Widget build(BuildContext context) {
    return Container(
      //child: Expanded(
        child: GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: Image.asset(
              image,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
    //),
    );
  }
}