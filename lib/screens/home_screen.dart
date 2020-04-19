import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(children: <Widget>[
          new Image.network(
              'https://dejpknyizje2n.cloudfront.net/marketplace/products/flying-honey-bee-icon-1561735545.9008334.png', height: 300,),
          new Padding(
            padding: new EdgeInsets.only(left: 35,top: 5.0),
            child:Text("BeeCode", style: TextStyle(fontStyle: FontStyle.italic,color: Colors.yellowAccent, fontSize: 50))),
          new Padding(
            padding: new EdgeInsets.only(left: 35),
            child:Text("Gustavo Duregger | RM79757", style: TextStyle(color: Colors.black54, fontSize: 20))),
          new Padding(
            padding: new EdgeInsets.only(left: 0, right: 0, top: 15.0),
            child: _cardLogin(),
          ),
          //CARD DE ACESSO SEM LOGIN
          new Container(
              height: 70.0,
              margin: new EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
                  gradient: new LinearGradient(colors: [
                    Colors.yellow.withOpacity(1),
                    Colors.yellowAccent.withOpacity(1)
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: new Row(crossAxisAlignment: CrossAxisAlignment.center,
                  //ELEMENTOS CONTIDOS NO CARD
                  children: <Widget>[
                    new Expanded(
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          new Padding(
                            padding:
                                new EdgeInsets.only(left: 50.0, right: 50.0),
                          ),
                          ButtonTheme(
                              minWidth: 400.0,
                              height: 70.0,
                              child: new RaisedButton(
                                textColor: Colors.white,
                                color: Colors.yellowAccent[700].withOpacity(0.1),
                                child: new Text(
                                  "Pular login",
                                  style: new TextStyle(
                                      fontSize: 25.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    "/linguagem_screen",
                                    arguments: "cursos",
                                  );
                                },
                              )),
                        ]))
                  ])),
        ]),
      ),
      //OUTROS ELEMENTOS
      backgroundColor: Colors.grey[900],
    );
  }
}

//FIELD DE LOGIN
Widget _cardLogin() {
  return Container(
      height: 120.0,
      margin: new EdgeInsets.only(left: 25.0, right: 25.0),
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                decoration: InputDecoration(
              labelText: ("Email"),
              filled: true,
              fillColor: Colors.grey[800],
              prefixIcon: Icon(Icons.mail),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0))),
            )),
            TextFormField(
                decoration: InputDecoration(
                    labelText: ("Senha"),
                    filled: true,
                    fillColor: Colors.grey[800],
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)))))
          ]));
}
