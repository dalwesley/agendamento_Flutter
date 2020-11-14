// import 'package:flutter/material.dart';

// class Alert extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return void showAlertDialog(BuildContext context, model, int position) {
//       Widget cancelaButton = FlatButton(
//         child: Text("Cancelar"),
//         onPressed: () {
//           // Navigator.of(context).pop();
//           setState(() {
//           });
//           Navigator.of(context).pop();
//         },
//       );
//       Widget continuaButton = FlatButton(
//         child: Text("Continuar"),
//         onPressed: () {
//           controller.remove(model);
//           Navigator.of(context).pop();
//         },
//       );

//       //configura o AlertDialog
//       AlertDialog alert = AlertDialog(
//         title: Center(
//           child: Text("Agenda @"),
//         ),
//         content: Text("Deseja excluir o agendamento?"),
//         actions: [
//           cancelaButton,
//           continuaButton,
//         ],
//       );

//       //exibe o diálogo
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return alert;
//         },
//       );
//     }
//   }
// }
