// import 'package:contatos/model/cliente.model.dart';
// import 'package:contatos/repository/cliente.repository.dart';
// import 'package:contatos/store/app.store.dart';

// class ClienteController {
//   AppStore _store;
//   ClienteRepository _repository;

//   ClienteController(AppStore store) {
//     _store = store;
//     _repository = new ClienteRepository();
//   }

//   void changeSelection(String selection) {
//     _store.clearCliente();

//     switch (selection) {
//       case "Recent":
//         {
//           _store.busy = true;
//           _store.changeSelected("Recent");
//           _repository.getRecentClientes().then(
//             (data) {
//               _store.setCliente(data);
//               _store.busy = false;
//             },
//           );
//           return;
//         }
//       case "All":
//         {
//           _store.busy = true;
//           _store.changeSelected("All");
//           _repository.getAllClientes().then(
//             (data) {
//               _store.setCliente(data);
//               _store.busy = false;
//             },
//           );
//           return;
//         }
//       case "Expired":
//         {
//           _store.busy = true;
//           _store.changeSelected("Expired");
//           _repository.getExpiredClientes().then(
//             (data) {
//               _store.setCliente(data);
//               _store.busy = false;
//             },
//           );
//           return;
//         }
//       case "Cancel":
//         {
//           _store.busy = true;
//           _store.changeSelected("Cancel");
//           _repository.getCancelClientes().then(
//             (data) {
//               _store.setCliente(data);
//               _store.busy = false;
//             },
//           );
//           return;
//         }
//     }
//   }

//   Future addCliente(ClienteModel clienteModel) async {
//     await _repository.addCliente(clienteModel);
//   }

//   Future editCliente(ClienteModel clienteModel) async {
//     await _repository.edit(clienteModel);
//   }

//   Future markAsCancel(ClienteModel clienteModel) async {
//     if (clienteModel.clienteStatus == true) {
//       clienteModel.clienteStatus = false;
//     } else {
//       clienteModel.clienteStatus = true;
//     }
//     await _repository.markAsCancel(clienteModel);
//   }

//   Future remove(ClienteModel clienteModel) async {
//     _store.busy = true;
//     await _repository.delete(clienteModel);
//     _store.busy = false;
//     changeSelection(_store.currentState);
//   }
// }
