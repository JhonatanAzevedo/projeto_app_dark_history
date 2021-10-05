import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  Widget _bory(double width, double height) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //imagem da logo
          Container(
            height: height * 35,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
                    fit: BoxFit.fill)),
          ),
          // texto do meio
          Text(
            "Por Que Contamos e Gostamos de Histórias de Terror?",
            style: GoogleFonts.eater(
              textStyle: TextStyle(color: Colors.red[800], fontSize: 15),
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Text(
                "Muito antes da escrita, a humanidade já contava histórias. "
                "Uma das emoções humanas mais fortes é o medo e quando o vivenciamos em uma situação fictícia "
                "tendemos a melhor lidar com nossos problemas na vida real; bem parecido com as descargas de adrenalina "
                "em situações que jamais nos imaginamos, inclusive catástrofes, que nos fazem realizar feitos que normalmente não consideraríamos possíveis. "
                "começe ja sua jornada em varias historias reais ou fictícias, contadas pelos nossos usuarios "
                "e aproveite e adicione a sua história de terror para que outras pessoas possam ler.",
                style: GoogleFonts.smythe(
                  textStyle: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 22,
                      fontStyle: FontStyle.italic),
                ),
                textAlign: TextAlign.justify),
          ),

          // butao para ir para todas historias
          TextButton(
            onPressed: () {
              Get.toNamed(
                  '/list'); //<= usando o pushNamed ele vem com botao de volta
            },
            child: Container(
              child: Text(
                'LER HISTÓRIAS',
                style: GoogleFonts.eater(
                  textStyle: TextStyle(
                    fontSize: 17,
                    color: Colors.red[800],
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 100;
    final height = MediaQuery.of(context).size.height / 100;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.grey[900],
          title: Text(
            'Dark History',
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
        _bory(width, height),
      ]),
    );
  }
}
