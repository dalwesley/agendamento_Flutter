// import 'package:contatos/android/views/cliente-editor.view.dart';
// import 'package:contatos/model/cliente.model.dart';
// import 'package:contatos/themes/light.theme.dart';
// import 'package:contatos/store/app.store.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';

// class ClienteNavbar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final store = Provider.of<AppStore>(context);
//     final controller = new ClienteController(store);

//     return Container(
//       height: 50,
//       child: Row(
//         // scrollDirection: Axis.horizontal,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           Observer(
//             builder: (_) => FlatButton(
//               child: Container(
//                 child: Text(
//                   "Recentes",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: store.currentState == "Recent"
//                         ? FontWeight.w600
//                         : FontWeight.w300,
//                     color: store.currentState == "Recent"
//                         ? primaryColor
//                         : textColor,
//                   ),
//                 ),
//                 // padding: EdgeInsets.all(15.0),
//                 // shape: CircleBorder(),
//               ),
//               onPressed: () {
//                 controller.changeSelection("Recent");
//               },
//             ),
//           ),
//           Observer(
//             builder: (_) => FlatButton(
//               child: Container(
//                 child: Text(
//                   "Todos",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: store.currentState == "All"
//                         ? FontWeight.w600
//                         : FontWeight.w300,
//                     color:
//                         store.currentState == "All" ? primaryColor : textColor,
//                   ),
//                 ),
//               ),
//               onPressed: () {
//                 controller.changeSelection("All");
//               },
//             ),
//           ),

//           FlatButton(
//             child: Text(
//               "Cadastrar",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w300,
//                 color: textColor,
//               ),
//             ),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => ClienteEditor(
//                     ClienteModel(),
//                   ),
//                 ),
//               );
//             },
//           ),

//           // Observer(
//           //   builder: (_) => FlatButton(
//           //     child: Text(
//           //       "Cancelados",
//           //       style: TextStyle(
//           //         fontSize: 20,
//           //         fontWeight: store.currentState == "Cancel"
//           //             ? FontWeight.w600
//           //             : FontWeight.w300,
//           //         color:
//           //             store.currentState == "Cancel" ? primaryColor : textColor,
//           //       ),
//           //     ),
//           //     onPressed: () {
//           //       controller.changeSelection("Cancel");
//           //     },
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
