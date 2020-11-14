import 'package:contatos/controller/login.controller.dart';
import 'package:contatos/user.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String text;
  UserCard({Key key, @required this.text}) : super(key: key);
  final controller = new LoginController();

  @override
  Widget build(BuildContext context) {
    // void showAlertDialog() {
    //   Widget agente1Button = FlatButton(
    //     child: Text("@ @"),
    //     onPressed: () {
    //       user.name = "@ @";
    //       Navigator.of(context).pop();
    //     },
    //   );
    //   Widget agente2Button = FlatButton(
    //     child: Text("@"),
    //     onPressed: () {
    //       user.name = "@";
    //       Navigator.of(context).pop();
    //     },
    //   );
    //   Widget agente3Button = FlatButton(
    //     child: Text("@"),
    //     onPressed: () {
    //       user.name = "@";
    //       Navigator.of(context).pop();
    //     },
    //   );
    //   Widget agente4Button = FlatButton(
    //     child: Text("Cancelar"),
    //     onPressed: () {
    //       user.name = "Cancelar";
    //       Navigator.of(context).pop();
    //     },
    //   );

    //   //configura o AlertDialog
    //   AlertDialog alert = AlertDialog(
    //     title: Center(
    //       child: Text("Selecione o Agente"),
    //     ),
    //     // content: Text(widget.agendamentoModel.agendamentoClientNome),
    //     actions: [
    //       agente1Button,
    //       agente2Button,
    //       agente3Button,
    //       agente4Button,
    //     ],
    //   );

    //   //exibe o diálogo
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return alert;
    //     },
    //   );
    // }

    return Container(
      height: 25,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   height: 20,
          // child: FlatButton(
          //   onPressed: () {
          //     showAlertDialog();
          //   },
          //   child: user.name == null
          //       ? Text("Selecione um agente")
          //       :
          user.name == null ? Text(user.name) : Text("Selecione um agente"),
          // ),
          // ),
        ],
      ),
      // onLongPress: () {
      //   showAlertDialog(); // TRATAR POSSÍVEL ERRO
      // },
    );
  }
}
