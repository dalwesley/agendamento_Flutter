// import 'package:contatos/model/cliente.model.dart';
// import 'package:contatos/themes/light.theme.dart';
// import 'package:contatos/model/agendamento.model.dart';
// import 'package:contatos/store/app.store.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:provider/provider.dart';
// import '../user.dart';
// import 'busy.widget.dart';

// class ClienteList extends StatefulWidget {
//   @override
//   _ClienteListState createState() => _ClienteListState();
// }

// class _ClienteListState extends State<ClienteList> {
//   @override
//   Widget build(BuildContext context) {
//     final store = Provider.of<AppStore>(context);
//     var size = MediaQuery.of(context).size;

//     return SingleChildScrollView(
//       child: LayoutBuilder(
//         builder: (_, constraints) {
//           return Container(
//             width: size.width,
//             height: size.height * .73,
//             child: Observer(
//               builder: (_) => TDBusy(
//                 busy: store.busy,
//                 child: store.clientes.length == 0
//                     ? Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Text(
//                               user.name,
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                                 color: textColor,
//                               ),
//                             ),
//                             Text(
//                               "Opss... Nada aqui!",
//                               style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.w500,
//                                 color: textColor,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : ListView.builder(
//                         itemCount: store.clientes.length,
//                         itemBuilder: (context, index) {
//                           var cliente = store.clientes[index];
//                           return Padding(
//                             padding: const EdgeInsets.only(
//                               top: 5,
//                               bottom: 5,
//                               left: 10,
//                               right: 10,
//                             ),
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: cliente.clienteStatus == true
//                                     ? Colors.white
//                                     : Colors.red[50],
//                                 borderRadius: BorderRadius.circular(5),
//                                 boxShadow: [
//                                   new BoxShadow(
//                                     color: Colors.black26,
//                                     offset: new Offset(1, 2.0),
//                                     blurRadius: 1,
//                                     spreadRadius: 1,
//                                   ),
//                                 ],
//                               ),
//                               child: ListTile(
//                                 leading: cliente.clienteStatus == true
//                                     ? CircleAvatar(
//                                         backgroundColor: accentColor,
//                                         child: Text(
//                                           cliente.clienteNome[0],
//                                           style: TextStyle(
//                                               fontSize:
//                                                   constraints.maxWidth * 0.055,
//                                               fontWeight: FontWeight.w600),
//                                         ),
//                                         foregroundColor: Colors.white,
//                                       )
//                                     : CircleAvatar(
//                                         backgroundColor: Colors.white,
//                                         child: Icon(
//                                           Icons.cancel,
//                                           size: 35,
//                                           // color: Colors.red[50],
//                                         ),
//                                         foregroundColor: Colors.red[50],
//                                       ),
//                                 title: Text(
//                                   cliente.clienteNome,
//                                   overflow: TextOverflow.fade,
//                                   maxLines: 1,
//                                   softWrap: false,
//                                   style: TextStyle(
//                                     fontSize: constraints.maxWidth * 0.04,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 subtitle: Text(
//                                   cliente.clienteEmpresa,
//                                   overflow: TextOverflow.fade,
//                                   maxLines: 1,
//                                   softWrap: false,
//                                   style: TextStyle(
//                                     fontSize: constraints.maxWidth * 0.03,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 trailing: IconButton(
//                                   icon: Icon(Icons.menu),
//                                   onPressed: () => navegarParaCliente(
//                                       context, store.clientes[index]),
//                                 ),
//                                 onLongPress: () => navegarParaAgendaEditor(
//                                     context,
//                                     AgendamentoModel(),
//                                     store.clientes[index]),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//               ),
//             ),
//           );
//         },
//       ),
//       //   ],
//       // ),
//     );
//   }

//   void navegarParaCliente(
//       BuildContext context, ClienteModel clienteModel) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//           // builder: (context) => ClienteDetailsView(clienteModel),
//           ),
//     );
//   }

//   void navegarParaAgendaEditor(BuildContext context,
//       AgendamentoModel agendamentoModel, ClienteModel clienteModel) async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//           // builder: (context) => AgendaEditor(agendamentoModel, clienteModel),
//           ),
//     );
//   }
// }
