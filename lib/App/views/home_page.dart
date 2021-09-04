import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _bory() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //imagem da logo
          Image.asset(
            'assets/images/logo.jpg',
          ),
          SizedBox(height: 20),
          // texto do meio
          Text(
            "Por Que Contamos e Gostamos de Histórias de Terror?",
            style: GoogleFonts.eater(
              textStyle: TextStyle(color: Colors.red[800], fontSize: 15),
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top:10, bottom: 10, left: 15, right: 15),

            child: Text(
                "Muito antes da escrita, a humanidade já contava histórias. "
                "Uma das emoções humanas mais fortes é o medo e quando o vivenciamos em uma situação fictícia "
                "tendemos a melhor lidar com nossos problemas na vida real; bem parecido com as descargas de adrenalina "
                "em situações que jamais nos imaginamos, inclusive catástrofes, que nos fazem realizar feitos que normalmente não consideraríamos possíveis. "
                "começe ja sua jornada em varias historias reais ou fictícias, contadas pelos nossos usuarios "
                "e aproveite e adicione a sua historia de terror para que outras pessoas possam ler.",
                style: GoogleFonts.smythe(
                  textStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 22,
                      fontStyle: FontStyle.italic),
                ),
                textAlign: TextAlign.justify),
          ),

          // butao para ir para todas historias
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                  '/list'); //<= usando o pushNamed ele vem com botam de volta
            },
            child: Container(
              child: Text(
                'TODAS HISTORIAS',
                style: GoogleFonts.eater(
                  textStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.red[800],
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Dark Historys',
            style: GoogleFonts.eater(
              textStyle: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      body: Stack(children: [
        Container(
          color: Colors.black,
        ),
        _bory(),
      ]),
    );
  }
}
