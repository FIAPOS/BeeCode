import 'package:flutter/material.dart';
import 'package:lista_cursos/models/linguagem_model.dart';
import 'package:lista_cursos/repository/linguagem_repository.dart';
import 'home_screen.dart';

class LinguagensScreen extends StatefulWidget {
  @override
  _LinguagensScreenState createState() => _LinguagensScreenState();
}

class _LinguagensScreenState extends State<LinguagensScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BeeCode',
        //Criação dos elementos contidos na tela
        home: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                )
              ],
              backgroundColor: Colors.black87,
              title: Text("Início"),
            ),
            body: Center(
              child: FutureBuilder<List<LinguagemModel>>(
                future: CursoRepository().findAllAsync(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return buildListView(snapshot.data);
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            backgroundColor: Colors.black87,
            floatingActionButton: _floatingActionButton(),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  //BANNER DO MENU
                  DrawerHeader(
                    child: Text(
                      'Olá, humano',
                      style: TextStyle(fontSize: 50),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent,
                    ),
                  ),
                  _cardDestaque(),
                  //CATEGORIAS
                  ListTile(
                    title: Text('Contato'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('WebSite'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Reportar Bug'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Sair :(',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomeScreen();
                      }));
                    },
                  ),
                ],
              ),
            )));
  }

  ListView buildListView(List<LinguagemModel> linguagens) {
    return ListView.builder(
      itemCount: linguagens == null ? 0 : linguagens.length,
      itemBuilder: (BuildContext ctx, int index) {
        return cardLinguagem(linguagens[index]);
      },
    );
  }

  Card cardLinguagem(LinguagemModel linguagens) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 12.0,
      margin: new EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
            ),
          ),
          title: Text(
            linguagens.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                      value: linguagens.percentual,
                      valueColor: AlwaysStoppedAnimation(Colors.yellowAccent),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    linguagens.nivel,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            Navigator.pushNamed(
              context,
              "/linguagem_detalhes",
              arguments: linguagens,
            );
          },
        ),
      ),
    );
  }
}

Widget _floatingActionButton() {
  return FloatingActionButton(
    elevation: 20.0,
    hoverColor: Colors.black,
    child: Icon(Icons.add),
    backgroundColor: Colors.yellowAccent,
    foregroundColor: Colors.black,
    onPressed: () {
      print('_floatingActionButtonpressed');
    },
  );
}

//CARD AMARELO
Widget _cardDestaque() {
  return Container(
    height: 100.0,
    margin: new EdgeInsets.all(10.0),
    decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        gradient: new LinearGradient(
            colors: [Colors.yellow, Colors.yellow[300]],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            tileMode: TileMode.clamp)),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      //ICONE
      children: <Widget>[
        new Padding(
          padding: new EdgeInsets.only(left: 10.0, right: 10.0),
          child: new Icon(
            Icons.star,
            color: Colors.black87,
          ),
        ),
        new Expanded(
            child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          //CONTEUDO DE TEXTO
          children: <Widget>[
            new Text(
              'Dart',
              style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
            new SizedBox(
              height: 8.0,
            ),
            new Text(
              'Linguagem da semana',
              style: new TextStyle(fontSize: 15.0, color: Colors.black87),
            ),
          ],
        )),
        new Padding(
          padding: new EdgeInsets.only(left: 10.0, right: 10.0),
          child: new Text(
            '210',
            style: new TextStyle(fontSize: 20.0, color: Colors.black54),
          ),
        )
      ],
    ),
  );
}
