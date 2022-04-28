import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //instanciar a coleção
  CollectionReference minions =
      FirebaseFirestore.instance.collection('minions');

  Future<String> addMinion(String minionName) {
    //adicionar o objecto em forma de json para a coleção de minions
    return minions
        .add({
          'nome': minionName,
        })
        .then((value) => "Mais um minion adicionado à família")
        .catchError((error) =>
            "Parece que teve problemas com o último minion:\n $error");
  }

  Future<QuerySnapshot> queryCollection(queryString) async {
    //retorna o snapshot equivalente aos objectos json onde
    // o nome é igual ao passado como argumento
    return await minions.where('nome', isEqualTo: queryString).get();
  }

  Future updateUser(nome, novoNome) {
    //com base na coleção pegamos todos os dados que nela existem, que retorna
    //QuerySnapshot e usando o mesmo para iterar pelos documentos dentro dele
    return minions.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //verificar se o dcumento tem como atributo nome igual ao pretendido alterar
        if (doc['nome'] == nome) {
          minions
              .doc(doc.id) //pegar o id do documento que se pretende actualizar
              .update({'nome': novoNome})
              .then((value) => "Minion com nome actualizado")
              .catchError((error) =>
                  "Oops, parece que não deu pra actualizar:\n $error");
        }
      });
    });
  }
}
