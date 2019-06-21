import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app_fairyshot/Home2.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'FairyShot',
      home: LoginScreen(title: 'FairyShot'),
    );
  }
}

class LoginScreen extends StatefulWidget {
  // Attributs
  final String title;

  // Constructeur
  LoginScreen({Key key, this.title}) : super(key: key);

  // nouvel état
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  // Back-end de l'authentification


  // Constructeur
  LoginScreenState({Key key});

  final GoogleSignIn googleSignIn =
  GoogleSignIn(); // déclaration d'un nouveau client google
  final FirebaseAuth firebaseAuth =
      FirebaseAuth.instance; // nouvelle instance de firebase auth
  SharedPreferences
  prefs; // SharedPreferences : écriture en local (base de donnée locale)

  // Commande le widget chargement
  bool isLoading = false;
  // est connecté oui/non
  bool isLoggedIn = false;
  // ID de l'utilisateur courant
  FirebaseUser currentUser;

  @override
  void initState() {
    super.initState();
    isSignedIn(); // si l'utilisateur est connecté booléen
  }

  void isSignedIn() async {
    this.setState(() {
      isLoading = true;
      // déclenche le chargement
    });

    prefs = await SharedPreferences.getInstance(); // préférences

    isLoggedIn = await googleSignIn.isSignedIn();
    // booléen qui dit si connecté
    if (isLoggedIn) {
      // si connecté on peut afficher l'écran des conversations : main
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
              currentUserId: prefs.getString('codeUtilisateur'),
              currentUserPseudo: prefs.getString('pseudoUtilisateur'),
            )),
      );
    }

    this.setState(() {
      isLoading = false;
    });
  }

  Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser firebaseUser =
    await firebaseAuth.signInWithCredential(credential);

    if (firebaseUser != null) {
      // si les tokens ont bien été récupérés
      final QuerySnapshot result = await Firestore.instance
          .collection('Utilisateur')
          .where('codeUtilisateur', isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      Fluttertoast.showToast(msg: "Vous êtes connecté !");
      if (documents.length == 0) {

        Firestore.instance
            .collection('Utilisateur')
            .document(firebaseUser.uid)
            .setData({
          'pseudoUtilisateur': firebaseUser.displayName,
          'codeUtilisateur': firebaseUser.uid
        });

        currentUser = firebaseUser;
        await prefs.setString('codeUtilisateur', currentUser.uid);
        await prefs.setString('pseudoUtilisateur', currentUser.displayName);
      } else {
        Fluttertoast.showToast(msg: "Enregistrement...");

        await prefs.setString(
            'codeUtilisateur', documents[0]['codeUtilisateur']);
        await prefs.setString(
            'pseudoUtilisateur', documents[0]['pseudoUtilisateur']);
      }
      Fluttertoast.showToast(msg: "Connexion réussie");
      this.setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScreen(
              currentUserId: firebaseUser.uid,
              currentUserPseudo: prefs.getString('pseudoUtilisateur'),
            )),
      );
    } else {
      Fluttertoast.showToast(msg: "Echec de connexion");
      this.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Center(
              child: FlatButton(
                  onPressed: handleSignIn,
                  child: Text(
                    'CONNEXION AVEC GOOGLE',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  color: Color(0xffdd4b39),
                  highlightColor: Color(0xffff7f7f),
                  splashColor: Colors.transparent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0)),
            ),

            Positioned(
              child: isLoading
                  ? Container(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                color: Colors.white.withOpacity(0.8),
              )
                  : Container(),
            ),
          ],
        ));
  }
}
