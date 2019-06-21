import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_fairyshot/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_fairyshot/Home.dart';


DataBase db = new DataBase();
SharedPreferences prefs;

class MainScreen extends StatefulWidget {
  // Attributs

  // Utilisateur courant
  final String currentUserId;
  final String currentUserPseudo;

  // Constructeur
  MainScreen(
      {Key key,
        @required this.currentUserId,
        @required this.currentUserPseudo})
      : super(key: key);

  // Création d'un nouvel état de MainScreen avec les widgets
  @override
  State createState() => MainScreenState(
      currentUserId: currentUserId,
      currentUserPseudo: currentUserPseudo);
}

class MainScreenState extends State<MainScreen> {
  // base de données
  DataBase db = new DataBase();

  // Attributs
  final String currentUserId;
  final String currentUserPseudo;

  String getIdUser (){

    return currentUserId;
  }
   static String user;

  // Constructeur
  MainScreenState({Key key,
    @required this.currentUserId,
    @required this.currentUserPseudo});

  // Lancement du widget chargement commandé par ce booléen
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    user = currentUserId;
    return Home();
  }
}

class AfficherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: new AppBar(
          title: new Text("Liste des joueurs à inviter"),
          backgroundColor: Colors.indigo,
        ),
        body: Container(
            color: Colors.indigo[400],
            child:Column(
            children: <Widget>[
       Expanded( child: Center(
            child: Stack(
                children: <Widget>[
                 Container(
                    color: Colors.indigo[400],
                    child: StreamBuilder(
                        stream: Firestore.instance
                            .collection('Utilisateur')
                            .snapshots(),
                        builder: (context, snapshot) {
                          // construction de la listView
                          return ListView.builder(
                            padding: EdgeInsets.all(10.0),
                            itemBuilder: (context, index) =>
                                buildItem(
                                    context,
                                    snapshot.data.documents[
                                    index]), //Appelle constructeur avec UN des documents d'amis
                            itemCount: snapshot.data.documents.length,
                          );
                        }),),
                ]
            ),
    )),
    ButtonSalon(),
    ])
    ));}
      }


  Widget buildItem(BuildContext context, DocumentSnapshot document) {
    if (document['codeUtilisateur'] == MainScreenState.user) {
      return Container();
    } else {
      return Container(
        child: FlatButton(
          child: Row(
            children: <Widget>[
               // Widget contenant les joueurs
                 Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                    Container(
                    child: Text(
                      document['pseudoUtilisateur'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,

                    ),))
                    ],
                  ),
                ),
              ),
              ],
          ),
          // Lorsque l'on appuie sur le widget Flexible
          onPressed: () {
           //crée fonction invité...
          },
          color: Colors.indigo[200],
          padding: EdgeInsets.fromLTRB(140.0, 10.0, 125.0, 10.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)),
        ),

      );
  }
  }



class ButtonSalon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.indigo[400],
        width: 275.0,
        height: 90.0,
        padding: EdgeInsets.all(20.0),
        child: RaisedButton(
            color: Colors.white,
            child: Text("Configurer la partie",
              style: TextStyle(color: Colors.black),),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              Action(context);
            }
        )
    );
  }


  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return CheckBoxInListview();
        }
    );
  }
}


class Salon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(backgroundColor: Colors.indigo,
            title: new Text('Salon'),
        ),

      body: Container(
        //  padding: EdgeInsets.only(left: 10.0, top: 140.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(child: Column(
                    children: <Widget>[
                      ButtonCreer()
                    ]
                )
                )
              ]

      ),
    ));
  }

}

class Salon2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(backgroundColor: Colors.indigo,
          title: new Text('Salon'),
        ),

        body: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(child: Column(
                    children: <Widget>[
                      ButtonCreer2()
/*                      StreamBuilder(
                          stream: Firestore.instance
                              .collection('Utilisateur')
                              .snapshots(),
                          builder: (context, snapshot) {
                            // construction de la listView
                            return ListView.builder(
                              padding: EdgeInsets.all(10.0),
                              itemBuilder: (context, index) =>
                                  buildItem2(
                                      context,
                                      snapshot.data.documents[
                                      index]),
                              //Appelle constructeur avec UN des documents d'amis
                              itemCount: snapshot.data.documents.length,
                            );
                          }),*/
                    ]
                )
                )
              ]

          ),
        ));
  }
    Widget buildItem2(BuildContext context, DocumentSnapshot document) {
      if (document['Salon'] == MainScreenState.user) {
        return Container(
          child: FlatButton(
            child: Row(
              children: <Widget>[
                // Widget contenant les joueurs
                Flexible(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                            child: Text(
                              document['pseudoUtilisateur'],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,

                              ),))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Lorsque l'on appuie sur le widget Flexible
            onPressed: () {
              //crée fonction invité...
            },
            color: Colors.indigo[200],
            padding: EdgeInsets.fromLTRB(140.0, 10.0, 125.0, 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          ),

        );
      }
  }

}

class ButtonSalon2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Confirmer",
              style: TextStyle(color: Colors.black),),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              Action(context);
            }
        )
    );
  }


  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Salon2();
        }
    );
  }
}


class ButtonInviter extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Inviter des joueurs",
              style: TextStyle(color: Colors.black),),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              Action(context);
            }
        )
    );
  }


  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){

        }
    );
  }
}



