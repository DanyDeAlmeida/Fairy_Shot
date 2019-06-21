import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app_fairyshot/pages/landing_page.dart';
import 'package:flutter_app_fairyshot/Home2.dart';




// HOME_PAGE
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 130.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(child: Text("Fairy Shot",
                  style: TextStyle(
                     decorationColor: Colors.indigo[400],
                      fontStyle: FontStyle.italic,
                      fontSize: 60.0,
                      color: Colors.white),)),
                Expanded(child: Column(
                    children: <Widget>[
                      ButtonCreer3(),
                    ]
                )
                )
              ]
          )
      ),
    );
  }
}

// BOUTTON
class ButtonCreer extends StatelessWidget {

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
          return AfficherList();
        }
    );
  }
}
class ButtonCreer2 extends StatelessWidget {

  static Random rand = new Random();
  static int current_al;
  static int premier;
  int min = 1;
  int max = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Commencer la partie",
              style: TextStyle(color: Colors.black),),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {
              random();

              if (Reglages.a == 0){
                min = 2;
              }
              if (Reglages.c == 0){
                max = 3;
              }
              if (Reglages.b == 0){
                max = 2;
                Reglages.c = 2;
              }

              if (current_al == Reglages.a){
                premier = Reglages.a;
                Reglages.a=0;
                Action(context);

              }
              if (current_al == Reglages.b){
                premier = Reglages.b;
                Reglages.b= 0 ;
                Action2(context);

              }
              if (current_al == Reglages.c){
                premier = Reglages.c;
                Reglages.c = 0;
                Action3(context);
              }
            }
        )
    );
  }


  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          Reglages.a = 0;
          return PFC();

        }
    );
  }
  void Action2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          Reglages.b = 0;
          return SpeedTap();

        }
    );
  }
  void Action3(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          Reglages.c = 0;
          return LandingPage();
        }
    );
  }
  void random(){

    current_al = min + rand.nextInt(max - min);
  }
}
class ButtonCreer3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Créer une partie",
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
          return Salon();
        }
    );
  }
}
class ButtonReglages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 30.0),
       width: 250.0,
       height: 50.0,
       child: RaisedButton(
       color: Colors.white,
       child: Text("Réglages",
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
class ButtonGenerate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Créer un salon",
              style: TextStyle(color: Colors.black),),
            onPressed: () {
              Action(context);
            }
        )
    );
  }


  void Action(BuildContext context) {


  }
}
class ButtonLancer extends StatelessWidget {

  static int nbtours = 1;
  static Random rand = new Random();
  static int test =0;
  static int test2 =0;
  static int current = 0;
  int min = 1;
  int max = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Jeux suivant",
              style: TextStyle(color: Colors.black),),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            onPressed: () {

              if (nbtours < Reglages.d) {
                random();
                test2 = test;
                while (current == test || current == test2 || current == ButtonCreer2.premier)
                  {
                    random();
                    print(current);
                  }
                  test = current;
                  print('lourd');
                  print(current);
                nbtours++;
                print(Reglages.a);
                print(Reglages.b);
                print(Reglages.c);


              if (current == Reglages.a){
                print('ok1');
                Reglages.a = 0;
                Action(context);
              }
              else if (current == Reglages.b){
                print('ok2');
                Reglages.b =0;
                Action2(context);
              }
              else if (current == Reglages.c){
                print('ok3');
                Reglages.c = 0;
                Action3(context);
              }}
              else {
                Action4(context);

            }}
        )
    );
  }


  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          Reglages.a = 0;
          return PFC();

        }
    );
  }
  void Action2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          Reglages.b = 0;
          return SpeedTap();

        }
    );
  }
  void Action3(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          Reglages.c = 0;
          return LandingPage();
        }
    );
  }
  void Action4(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return ScoreFinal();

        }
    );
  }
  void random(){

    current = min + rand.nextInt(max - min);
  }
  }
class PFCVIC extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Manche suivante",
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
          return PFC();
          //CheckBoxInListview();
        }
    );
  }
}
class PFCDEF extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Manche suivante",
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
          return PFC();
          //CheckBoxInListview();
        }
    );
  }
}
class PFCEGA extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Manche suivante",
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
          return PFC();
          //CheckBoxInListview();
        }
    );
  }
}
class ButtonFin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScoreFinal.Scorefin = 0;
    PFC.parties = 0;
    PFC.Resultat = 0;
    ButtonLancer.nbtours=1;

    return Container(
        margin: EdgeInsets.only(top: 30.0),
        width: 250.0,
        height: 50.0,
        child: RaisedButton(
            color: Colors.white,
            child: Text("Fin de la partie",
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
          return AfficherList();

        }
    );
  }
}


//CREATION ET REJOINDRE LES PARTIES
class CheckBoxInListview extends StatefulWidget {
  @override
    Reglages createState() => Reglages();

  }
class Reglages extends State<CheckBoxInListview> {


  Map<String, bool> values = {
    'Vrai ou Faux': true,
    'Speed Tap': true,
    'Pierre, Feuille, Ciseau': true,
    'Tic-Tac-Toe': true,
  };
  static int a = 1;
  static int b = 2;
  static int c = 3;
  static int d = 3;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(backgroundColor: Colors.indigo,
        title: new Text('Sélectionner les jeux'),
      ),
      body: Container(
          color: Colors.indigo[400],
          child: Column(
            children: <Widget>[
        Flexible(
          flex: 2,
          child: ListView(

            children: values.keys.map((String key) {
          return new CheckboxListTile(
            activeColor: Colors.white30,
            title: new Text(key,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20.0),),
            value: values[key],
            onChanged: (bool value) {
              setState(() {
                values[key] = value;
                if (values[key] == true && key == 'Vrai ou Faux'){
                  a=1;
                  print(a);
                  d++;
                  }
                else if (values[key] == false && key == 'Vrai ou Faux')
                  {
                  a =0;
                  d--;
                  print (a);}
                else if (values[key] == true && key == 'Speed Tap'){
                  b=2;
                  print(b);
                  d++;
                  }
                else if (values[key] == false && key == 'Speed Tap'){
                  b =0;
                  d--;
                  print (b);}
                 else if (values[key] == true && key == 'Pierre, Feuille, Ciseau'){
                  c=3;
                  d++;
                  print(c);
                 }
                else if (values[key] == false && key == 'Pierre, Feuille, Ciseau'){
                  c =0;
                  d--;
                  print (c);}
                  print (d);
              });

            },
          );
        }).toList(),

          ),
          ),
        Expanded(
            child: Container(
                child: new Column(
                    children : [
                      ButtonSalon2(),
                    ],

                )
            )
        )
            ]
        )
      )
      );
  }

}


// DEFINITION DES JEUX
class MoteurJeux extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

      return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 40.0),
            alignment: Alignment.topCenter,
            color: Colors.black,
            child: Column(
                children: <Widget>[
                  Expanded(child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonLancer(),
                      ]
                  )
                  )
                ]
            )
        ),
      );
    }

  }
  
  
//JEUX

//Speed Tap
class SpeedTap extends StatefulWidget {
  @override
  SpeedTapState createState() => SpeedTapState();
}
class SpeedTapState extends State<SpeedTap> {
  static int tap = 1;
  int tap2 = 1;
  static int tap3 = 1;
  int current_alea=0;
  int old_alea = 0;
  Random rnd = new Random();
  var now2;


  Alignment a = Alignment.center;

  @override
  var now = new DateTime.now().second;
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center( child: Text("Speed Tap",textAlign: TextAlign.center),),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
        ),
        backgroundColor: Colors.white,
        body:
        Container(
          alignment: a,
          child: new SizedBox(
              width: 100.0,
              height: 100.0,
              child: RaisedButton(
                child: Text("$tap",
                    style: TextStyle(fontSize: 25.0,)

                ),
                onPressed: clique,
                color: Colors.indigo[400],
                textColor: Colors.white,
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(150.0))

              )

          ),));
  }

  clique() {
    setState(() {
      tap ++;
      tap2++;
      tap3++;
      now2 = new DateTime.now().second;
      if (now2 < now) {
        now2 = now2+60;
      }
      if(now2 - now > 20 )
      {
        Action(context);
      }
      if (tap2 == 5) {
        tap2 = 0;
        GetRandom();
        if (current_alea == 1)
        {
          a = Alignment.center;
        }

        if (current_alea == 2)
        {
          a = Alignment.topLeft;

        }

        if (current_alea == 3)
        {
          a = Alignment.topRight;
        }

        if (current_alea == 4)
        {
          a = Alignment.bottomLeft;
        }

        if (current_alea == 5)
        {
          a = Alignment.bottomRight;
        }
        print (now);
        print (now2);

      }

    });
  }
  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return FinSpeed();

        }
    );
  }
  void GetRandom() {
    int min = 1;
    int max = 5;

    current_alea = min + rnd.nextInt(max - min);

    while (current_alea == old_alea) {
      current_alea = min + rnd.nextInt(max - min);

    }
    old_alea = current_alea;

  }
}
class FinSpeed extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    ScoreFinal.Scorefin = ScoreFinal.Scorefin + SpeedTapState.tap3 ;
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 140.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(
                    child: new Material(
                        color: Colors.indigo[400],
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Text("Votre score : ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
                              new Text(SpeedTapState.tap3.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),

                            ]))),
                Expanded(child: Column(
                    children: <Widget>[
                      ButtonLancer(),
                    ]
                )
                )
              ]
          )
      ),
    );
  }

}


// Pierre, Feuille, Ciseau
class PFC extends StatelessWidget{

  static int parties = 0;
  static int Resultat = 0;
  static int current_alea=0;
  static Random rnd = new Random();
  static int ok = 0 ;
  int ok2 = ok;

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/Pierre.PNG');
    var image = new Image(image: assetsImage, width: 140.0, height: 140.0,);

    var assetsImage2 = new AssetImage('assets/Feuille.png');
    var image2 = new Image(image: assetsImage2, width: 140.0, height: 140.0,);

    var assetsImage3 = new AssetImage('assets/Ciseau.png');
    var image3 = new Image(image: assetsImage3, width: 140.0, height: 145.0,);


    return Scaffold(
        appBar: AppBar(
          title: Center( child: Text("Pierre, Feuille, Ciseau",textAlign: TextAlign.center),),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.indigo,
        ),
     body: Center(
      child: Container(
          padding: EdgeInsets.only(left: 0.0, top: 20.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(child: Column(
                    children: <Widget>[
                      new Container(
        padding: EdgeInsets.only(top: 0.0),
    child: GestureDetector(
    onTap: () {
    print('lourd $ok2   test ');

    if (parties <3) {
    parties++;

    random();

    if (current_alea == 1) {
    parties--;
    print('lourd $ok2   test 1');

    Action(context);


    }
    else if (current_alea == 2) {
      print('lourd $ok2     tezt 2');

      Action3(context);
    }
    else if (current_alea == 3) {
    Resultat++;
    print('lourd $ok2     test 3');
    Action2(context);
    }
    }
    else{
      Action4(context);
    }

    },
    child: image,)) ])),
                Expanded(child: Column(
                    children: <Widget>[

    new Container(
    padding: EdgeInsets.only(top: 0.0),
    child: GestureDetector(
    onTap: () {
    if (parties <3) {
    parties++;
    random();

    if (current_alea== 2) {
    parties--;
    Action(context);
    }
    else if (
    current_alea== 3) {
      Action3(context);

    }
    else if (current_alea== 1) {
    Resultat++;
    Action2(context);
    }
    }
    else{
      Action4(context);
    }

    },
    child: image2,))])),
                Expanded(child: Column(
                    children: <Widget>[
     new Container(
    padding: EdgeInsets.only(top: 0.0),
    child: GestureDetector(
    onTap: () {
    if ( parties <3) {
    parties++;
    random();

    if (current_alea== 3) {
    parties--;
    Action(context);

    }
    else if (current_alea== 1) {
      Action3(context);
    }
    else if (current_alea== 2) {
    Resultat++;
    Action2(context);
    }
    }
    else{
      Action4(context);

    }

    },
    child: image3,)),])),



   ] ))
    ));}

  void random(){
    int min = 1;
    int max = 3;
    current_alea = min + rnd.nextInt(max - min);
  }

  void Action(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Egalite();
        }
    );
  }
  void Action2(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Victoire();
        }
    );
  }
  void Action3(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Defaite();
        }
    );
  }
  void Action4(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return ScorePagePFC(Resultat, parties);
        }
    );
  }

}
class ScorePagePFC extends PFC {

  int Resultat = PFC.Resultat;
  int parties = PFC.parties;

  ScorePagePFC(this.Resultat, this.parties);

  @override
  Widget build(BuildContext context) {
    ScoreFinal.Scorefin = ScoreFinal.Scorefin + Resultat;
    return new Material(
        color: Colors.indigo[400],
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Votre score: ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
            new Text(Resultat.toString() + "/" + parties.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),
            ButtonLancer(),
          ],
        )
    );
  }
}
class Victoire extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 140.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(child: Text("VOUS AVEZ GAGNE LA MANCHE PRECEDENTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decorationColor: Colors.indigo[400],
                      fontStyle: FontStyle.italic,
                      color: Colors.white),)),
                Expanded(child: Column(
                    children: <Widget>[
                      PFCVIC(),
                    ]
                )
                )
              ]
          )
      ),
    );
  }

}
class Defaite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 140.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                  Expanded(child: Text("VOUS AVEZ PERDU LA MANCHE PRECEDENTE",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decorationColor: Colors.indigo[400],
                      fontStyle: FontStyle.italic,
                      color: Colors.white),)),
                Expanded(child: Column(
                    children: <Widget>[
                      PFCDEF(),
                    ]
                )
                )
              ]
          )
      ),
    );
  }

}
class Egalite extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.only(left: 10.0, top: 140.0),
          alignment: Alignment.topCenter,
          color: Colors.indigo[400],
          child: Column(
              children: <Widget>[
                Expanded(child: Text("EGALITE, REJOUER UNE FOIS DE PLUS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      decorationColor: Colors.indigo[400],
                      fontStyle: FontStyle.italic,
                      color: Colors.white),)),
                Expanded(child: Column(
                    children: <Widget>[
                      PFCEGA(),
                    ]
                )
                )
              ]
          )
      ),
    );
  }

}


// FIN DE PARTIE
class ScoreFinal extends StatelessWidget{

  static int Scorefin = 0;
    @override
    Widget build(BuildContext context) {
      return Center(
        child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 140.0),
            alignment: Alignment.topCenter,
            color: Colors.indigo[400],
            child: Column(
                children: <Widget>[
                  Expanded(
                      child: new Material(
                      color: Colors.indigo[400],
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Text("Votre score total : ", style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0),),
                          new Text(Scorefin.toString(), style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50.0)),

                        ]))),
                  Expanded(child: Column(
                      children: <Widget>[
                        ButtonFin(),
                      ]
                  )
                  )
                ]
            )
        ),
      );
    }


  }