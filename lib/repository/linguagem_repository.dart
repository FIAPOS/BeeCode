import 'package:lista_cursos/models/linguagem_model.dart';

import 'database.dart';

class CursoRepository {


  Future<List<LinguagemModel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    List<LinguagemModel> cursos = new List<LinguagemModel>();

    if (db.created) {
      cursos = new List<LinguagemModel>();
      cursos.add(
        new LinguagemModel(
          id: 1,
          nome: 'Dart',
          nivel: 'Gênio',
          percentual: 0.9,
          users: 200,
          conteudo:
              'Dart é uma linguagem de programação. Veja abaixo quem da sua lsita de amigos utiliza ela.',
        ),
      );
      cursos.add(
        LinguagemModel(
          id: 2,
          nome: 'C#',
          nivel: 'Iniciante',
          percentual: 0.25,
          users: 300,
          conteudo:
              'C# é uma linguagem de programação. Veja abaixo quem da sua lsita de amigos utiliza ela.',
        ),
      );
      cursos.add(
        LinguagemModel(
          id: 3,
          nome: 'JavaScript',
          nivel: 'Gênio',
          percentual: 0.9,
          users: 1500,
          conteudo:
              'Tem gente que acha que JS é uma linguagem de programação. Veja abaixo quem da sua lsita de amigos utiliza ela.',
        ),
      );
      cursos.add(
        LinguagemModel(
          id: 4,
          nome: 'Java',
          nivel: 'Iniciante',
          percentual: 0.1,
          users: 800,
          conteudo:
              'Java é uma liguagem de programação. Veja abaixo quem da sua lsita de amigos utiliza ela, mas cuidado, eles devem estar irritados de mais com o Eclipse.',
        ),
      );

    }

    return new Future.value(cursos);
  }

}
