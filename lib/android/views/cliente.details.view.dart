// import 'package:contatos/android/styles.android.dart';
// import 'package:contatos/android/views/agenda-editor.view.dart';
// import 'package:contatos/android/views/cliente-editor.view.dart';
// import 'package:contatos/controller/cliente.controller.dart';
// import 'package:contatos/model/agendamento.model.dart';
// import 'package:contatos/model/cliente.model.dart';
// import 'package:contatos/store/app.store.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ClienteDetailsView extends StatefulWidget {
//   final ClienteModel clienteModel;
//   ClienteDetailsView(this.clienteModel);

//   @override
//   _ClienteDetailsViewState createState() => _ClienteDetailsViewState();
// }

// class _ClienteDetailsViewState extends State<ClienteDetailsView> {
//   // final _scaffoldKey = new GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     final store = Provider.of<AppStore>(context);
//     final controller = new ClienteController(store);
//     var size = MediaQuery.of(context).size;

//     return Scaffold(
//       // key: _scaffoldKey,
//       appBar: AppBar(
//         // iconTheme: IconThemeData(
//         // color: primaryColor,
//         // ),
//         // automaticallyImplyLeading: false,
//         // backgroundColor: Colors.transparent,
//         // elevation: 0,
//         title: Text(
//           "Detalhes do Cliente",
//           style: TextStyle(
//             fontWeight: FontWeight.w500,
//             // color: primaryColor,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => navegarParaAgendaEditor(
//                 context, AgendamentoModel(), widget.clienteModel),
//             icon: Icon(
//               Icons.perm_contact_calendar,
//             ),
//             tooltip: 'Agendar Cliente',
//           ),
//         ],
//         centerTitle: true,
//       ),
//       body: Container(
//         width: size.width,
//         height: size.height,
//         child: Center(
//           child: LayoutBuilder(
//             builder: (_, constraints) {
//               return ListView(
//                 children: <Widget>[
// //----------------------------------------------------- Detalhes do Cliente
//                   Container(
//                     padding: EdgeInsets.only(
//                       top: 5,
//                       left: 10,
//                       right: 10,
//                       bottom: 5,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           // width: constraints.maxWidth,
//                           // height: constraints.maxHeight,
//                           decoration: BoxDecoration(
//                             color: backgroundColor,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               new BoxShadow(
//                                 color: Colors.black26,
//                                 offset: new Offset(1, 2.0),
//                                 blurRadius: 3,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 // color: textColor.withOpacity(0.05),
//                                 // width: double.infinity,
//                                 child: Center(
//                                   child: new Text(
//                                     'Dados do Cliente',
//                                     style: new TextStyle(
//                                       fontSize: constraints.maxWidth * 0.04,
//                                       fontWeight: FontWeight.w700,
//                                       color: primaryColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.person,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clienteNome,
//                                     style: TextStyle(
//                                       fontSize: constraints.maxWidth * 0.045,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.work,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clienteEmpresa,
//                                     style: TextStyle(
//                                       fontSize: constraints.maxWidth * 0.045,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.mail,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clienteEmail,
//                                     style: TextStyle(
//                                       fontSize: constraints.maxWidth * 0.045,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.phone,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clientePhone,
//                                     style: TextStyle(
//                                       fontSize: constraints.maxWidth * 0.045,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.directions,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clienteIndicado,
//                                     style: TextStyle(
//                                       fontSize: constraints.maxWidth * 0.045,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.calendar_today,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clienteDataCadastro,
//                                     style: TextStyle(
//                                       fontSize: constraints.maxWidth * 0.045,
//                                       fontWeight: FontWeight.w500,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: widget.clienteModel.clienteStatus ==
//                                             true
//                                         ? Icon(Icons.check_circle,
//                                             color: accentColor
//                                             // size:
//                                             //     constraints.maxWidth * 0.04,
//                                             )
//                                         : Icon(Icons.cancel, color: Colors.red),
//                                   ),
//                                   Text(
//                                     widget.clienteModel.clienteStatus == false
//                                         ? "Cliente Bloqueado"
//                                         : "Cliente Ativo",
//                                     style: widget.clienteModel.clienteStatus ==
//                                             true
//                                         ? TextStyle(
//                                             fontSize:
//                                                 constraints.maxWidth * 0.045,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.green,
//                                           )
//                                         : TextStyle(
//                                             fontSize:
//                                                 constraints.maxWidth * 0.045,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.red,
//                                           ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Icon(
//                                       Icons.speaker_notes,
//                                       // size: constraints.maxWidth * 0.04,
//                                     ),
//                                   ),
//                                   Flexible(
//                                     child: Text(
//                                       widget.clienteModel.clienteObs,
//                                       style: TextStyle(
//                                         fontSize: constraints.maxWidth * 0.045,
//                                         fontWeight: FontWeight.w500,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
// //----------------------------------------------------- Dados do Agendamento
//                   Container(
//                     padding: EdgeInsets.only(
//                       top: 5,
//                       left: 10,
//                       right: 10,
//                       bottom: 5,
//                     ),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           // width: constraints.maxWidth,
//                           // height: constraints.maxHeight,
//                           decoration: BoxDecoration(
//                             color: backgroundColor,
//                             borderRadius: BorderRadius.circular(10),
//                             boxShadow: [
//                               new BoxShadow(
//                                 color: Colors.black26,
//                                 offset: new Offset(1, 2.0),
//                                 blurRadius: 3,
//                                 spreadRadius: 1,
//                               ),
//                             ],
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 // color: textColor.withOpacity(0.05),
//                                 // width: double.infinity,
//                                 child: Center(
//                                   child: new Text(
//                                     'Lista de Agendamentos',
//                                     style: new TextStyle(
//                                       fontSize: constraints.maxWidth * 0.04,
//                                       fontWeight: FontWeight.w700,
//                                       color: primaryColor,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                       top: 30.0,
//                                       bottom: 30.0,
//                                     ),
//                                     child: Center(
//                                       child: Text(
//                                         "em desenvolvimento...",
//                                         style: TextStyle(
//                                           fontSize:
//                                               constraints.maxWidth * 0.045,
//                                           fontWeight: FontWeight.w500,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//       // ),
//       // ),
//       bottomNavigationBar: BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             FlatButton(
//               onLongPress: () {
//                 controller.remove(widget.clienteModel);
//                 Navigator.of(context).pop();
//               },
//               onPressed: () {
//                 // showAlertDialog();
//               },
//               color: Theme.of(context).primaryColor,
//               shape: CircleBorder(
//                 side: BorderSide.none,
//               ),
//               child: Icon(
//                 Icons.delete_forever,
//                 color: Colors.red,
//                 // size: constraints.maxWidth * 0.06,
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 launch("tel://${widget.clienteModel.clientePhone}");
//               },
//               color: Theme.of(context).primaryColor,
//               shape: CircleBorder(
//                 side: BorderSide.none,
//               ),
//               child: Icon(
//                 Icons.phone,
//                 color: Colors.white,
//                 // size: constraints.maxWidth * 0.05,
//               ),
//             ),
//             FlatButton(
//               onPressed: () {
//                 launch("mailto://${widget.clienteModel.clienteEmail}");
//               },
//               color: Theme.of(context).primaryColor,
//               shape: CircleBorder(
//                 side: BorderSide.none,
//               ),
//               child: Icon(
//                 Icons.email,
//                 color: Colors.white,
//                 // size: constraints.maxWidth * 0.05,
//               ),
//             ),
//             FlatButton(
//               onPressed: () =>
//                   navegarParaClienteEditor(context, widget.clienteModel),
//               color: Theme.of(context).primaryColor,
//               shape: CircleBorder(
//                 side: BorderSide.none,
//               ),
//               child: Icon(
//                 Icons.edit,
//                 color: Colors.white,
//                 // size: constraints.maxWidth * 0.05,
//               ),
//             ),
//           ],
//         ),
//         shape: CircularNotchedRectangle(),
//         color: primaryColor,
//       ),
//     );
//   }

//   void navegarParaClienteEditor(
//       BuildContext context, ClienteModel clienteModel) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => ClienteEditor(clienteModel),
//       ),
//     );
//   }

//   void navegarParaAgendaEditor(BuildContext context,
//       AgendamentoModel agendamentoModel, ClienteModel clienteModel) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => AgendaEditor(agendamentoModel, clienteModel),
//       ),
//     );
//   }
// }
