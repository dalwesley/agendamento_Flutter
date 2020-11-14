// import 'package:contatos/store/app.store.dart';
// import 'package:contatos/themes/light.theme.dart';
// import 'package:contatos/widgets/cliente-list.widget.dart';
// import 'package:contatos/widgets/cliente-navbar.widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class ClientesView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final store = Provider.of<AppStore>(context);
//     final controller = new ClienteController(store);
//     // var date = new DateTime.now();
//     // final _dateFormat = new DateFormat('dd/MM/yyyy');

//     // Só ocorre na primeira vez que o App rodar
//     if (store.clienteState == "none") {
//       controller.changeSelection("Recent");
//     }
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Column(
//           children: <Widget>[
//             ClienteNavbar(),
//             //   Text("@ Clientes"),
//             //   Text(
//             //     _dateFormat.format(date),
//             //     style: TextStyle(fontSize: 15),
//             //   )
//           ],
//         ),
//         // actions: <Widget>[
//         //   IconButton(
//         //     icon: Icon(
//         //       FontAwesomeIcons.userPlus,
//         //       color: primaryColor,
//         //     ),
//         //     tooltip: 'Cadastrar Cliente',
//         //     onPressed: () {
//         //       Navigator.of(context).push(
//         //         MaterialPageRoute(
//         //           builder: (context) => ClienteEditor(
//         //             ClienteModel(),
//         //           ),
//         //         ),
//         //       );
//         //     },
//         //   )
//         // ],
//         centerTitle: true,
//       ),
//       body: Column(
//         children: <Widget>[
//           // ClienteNavbar(),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     'assets/images/@_Logo_Branco_Transp.png',
//                   ),
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               child: ClienteList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // class ClientesView extends StatefulWidget {
// //   @override
// //   _ClientesViewState createState() => _ClientesViewState();
// // }

// // class _ClientesViewState extends State<ClientesView> {
// //   @override
// //   Widget build(BuildContext context) {

// //     return Scaffold(
// //       backgroundColor: backgroundColor,
// //       appBar: AppBar(
// //         centerTitle: true,
// //         title: Text(
// //           "Lista de Clientes",
// //         ),
// //         actions: <Widget>[
// //           IconButton(
// //             icon: Icon(
// //               Icons.person_add,
// //             ),
// //             tooltip: 'Cadastrar Cliente',
// //             onPressed: () {
// //               Navigator.of(context).push(
// //                 MaterialPageRoute(
// //                   builder: (context) => ClienteEditor(
// //                     ClienteModel(),
// //                   ),
// //                 ),
// //               );
// //             },
// //           )
// //         ],
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           ClienteNavbar(),
// //           ClienteList(),
// //         ],
// //       ),
// //     );
// //   }
// // }
