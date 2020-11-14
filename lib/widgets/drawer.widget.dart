// import 'package:contatos/store/app.store.dart';
// import 'package:contatos/themes/light.theme.dart';
// import 'package:contatos/user.dart';
// import 'package:contatos/widgets/navbar.widget.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class DrawerWidget extends StatefulWidget {
//   @override
//   _DrawerWidgetState createState() => _DrawerWidgetState();
// }

// class _DrawerWidgetState extends State<DrawerWidget> {
//   final controller = new LoginController();

//   @override
//   Widget build(BuildContext context) {
//     final store = Provider.of<AppStore>(context);
//     final controller = new AgendamentoController(store);

//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             child: Image.asset(
//               "assets/images/@_logo.png",
//             ),
//             decoration: BoxDecoration(
//               color: backgroundColor,
//             ),
//           ),
//           GestureDetector(
//             child: Container(
//               color: backgroundColor,
//               child: ListTile(
//                 title: Text('@ @'),
//                 leading: Icon(
//                   Icons.person,
//                   color: primaryColor,
//                 ),
//                 onTap: () {
//                   user.name = "@ @";
//                   Navigator.of(context).pop();
//                   controller.changeSelection("Today");
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//           GestureDetector(
//             child: Container(
//               color: backgroundColor,
//               child: ListTile(
//                 title: Text('@'),
//                 leading: Icon(
//                   Icons.person,
//                   color: primaryColor,
//                 ),
//                 onTap: () {
//                   user.name = "@";
//                   Navigator.of(context).pop();
//                   controller.changeSelection("Today");
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 5),
//           GestureDetector(
//             child: Container(
//               color: backgroundColor,
//               child: ListTile(
//                 title: Text('@'),
//                 leading: Icon(
//                   Icons.person,
//                   color: primaryColor,
//                 ),
//                 onTap: () {
//                   user.name = "@";
//                   Navigator.of(context).pop();
//                   controller.changeSelection("Today");
//                   Navbar();
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
