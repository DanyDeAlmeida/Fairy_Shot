import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataBase {

  Future<Null> creerSalon(
      String user, int a, int b, int c, int d ) async {
    //Enregistrement de la liste des jeux du salon
    Firestore.instance
        .collection('Salon')
        .document(user)
        .setData({
      'a': a,
      'b': b,
      'c': c,
      'd': d,
    });
    //Rajoute l'utilisateur dans un salon
    Firestore.instance
        .collection('Utilisateur')
        .document(user)
        .updateData({
      "Salon": user
    });
  }

  Future<Null> rejoindreSalon(String user, String idSalon) async {

    Firestore.instance
        .collection('Utilisateur')
        .document(user)
        .updateData({
      'Salon': idSalon
    });
  }

}
