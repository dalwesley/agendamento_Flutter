import 'dart:ui';
import 'package:contatos/android/views/splash.view.dart';
import 'package:contatos/controller/login.controller.dart';
import 'package:flutter/material.dart';

class InicialView extends StatefulWidget {
  @override
  _InicialViewState createState() => _InicialViewState();
}

class _InicialViewState extends State<InicialView> {
  final controller = new LoginController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  var busy = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SplashView(),
          ),
        );
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              children: <Widget>[
                Container(
                  width: size.width,
                  height: size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/fundo.png'),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.blue, BlendMode.color),
                    ),
                  ),
                  // width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/@_logo.png",
                        width: constraints.maxHeight * 0.7,
                        height: constraints.maxHeight * 0.7,
                      ),
                      Text("Toque na tela para iniciar"),
                      Text(
                        "Aplicativo de uso exclusivo da @ Tecnologia- Versão 4.0",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
