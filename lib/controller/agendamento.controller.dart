import 'package:contatos/model/agendamento.model.dart';
import 'package:contatos/repository/agendamento.repository.dart';
import 'package:contatos/store/app.store.dart';
import 'package:intl/intl.dart';

class AgendamentoController {
  var date = new DateTime.now();
  final _dateFormat = new DateFormat('dd-MM-yyyy');

  AppStore _store;
  AgendamentoRepository _repository;

  AgendamentoController(AppStore store) {
    _store = store;
    _repository = new AgendamentoRepository();
  }

  void changeSelection(String selection) {
    _store.clearContatos();
    // var hoje = _dateFormat.format(date);
    if ((selection == 'All') ||
        (selection == 'Done') ||
        (selection == 'Cancel')) {
      switch (selection) {
        case "All":
          {
            _store.busy = true;
            _store.changeSelected("All");
            _repository.getAllAgendamentos().then(
              (data) {
                _store.setContatos(data);
                _store.busy = false;
              },
            );
            return;
          }
        case "Done":
          {
            _store.busy = true;
            _store.changeSelected("Done");
            _repository.getDoneAgendamentos().then(
              (data) {
                _store.setContatos(data);
                _store.busy = false;
              },
            );
            return;
          }
        case "Cancel":
          {
            _store.busy = true;
            _store.changeSelected("Cancel");
            _repository.getCancelAgendamentos().then(
              (data) {
                _store.setContatos(data);
                _store.busy = false;
              },
            );
            return;
          }
        case "Expired":
          {
            _store.busy = true;
            _store.changeSelected("Expired");
            _repository.getExpiredAgendamentos().then(
              (data) {
                _store.setContatos(data);
                _store.busy = false;
              },
            );
            return;
          }
      }
    } else {
      _store.busy = true;
      _store.changeSelected("Today");
      _repository.getDateAgendamentos(selection).then(
        (data) {
          _store.setContatos(data);
          _store.busy = false;
        },
      );
      return;
    }
  }

  Future add(AgendamentoModel cliente) async {
    _store.busy = true;
    await _repository.add(cliente);
    _store.busy = false;
    changeSelection(_store.currentState);
  }

  Future edit(AgendamentoModel cliente) async {
    _store.busy = true;
    await _repository.markAsDone(cliente);
    _store.busy = false;
    changeSelection(_store.currentState);
  }

  Future markAsDone(AgendamentoModel cliente) async {
    _store.busy = true;
    if (cliente.agendamentoConcluido == true) {
      cliente.agendamentoConcluido = false;
    } else {
      cliente.agendamentoConcluido = true;
    }
    await _repository.markAsDone(cliente);
    _store.busy = false;
    changeSelection(_store.currentState);
  }

  Future remove(AgendamentoModel cliente) async {
    _store.busy = true;
    await _repository.delete(cliente);
    _store.busy = false;
    changeSelection(_store.currentState);
  }

  Future cancel(AgendamentoModel cliente) async {
    _store.busy = true;
    if (cliente.agendamentoCancelado == true) {
      cliente.agendamentoCancelado = false;
    } else {
      cliente.agendamentoCancelado = true;
    }
    await _repository.markAsDone(cliente);
    _store.busy = false;
    changeSelection(_store.currentState);
  }

  Future uncheckAsCancel(AgendamentoModel cliente) async {
    _store.busy = true;
    if (cliente.agendamentoCancelado == false) {
      cliente.agendamentoCancelado = true;
    } else {
      cliente.agendamentoCancelado = false;
    }
    await _repository.markAsDone(cliente);
    _store.busy = false;
    changeSelection(_store.currentState);
  }
}
