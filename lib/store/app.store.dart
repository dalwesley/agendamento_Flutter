import 'package:contatos/model/agendamento.model.dart';
import 'package:contatos/model/cliente.model.dart';
import 'package:mobx/mobx.dart';
part 'app.store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  @observable
  String currentState = "none";
  String clienteState = "none";
  @observable
  bool busy = false;

  @observable
  ObservableList<AgendamentoModel> agendamentos =
      new ObservableList<AgendamentoModel>();

  @observable
  ObservableList<ClienteModel> clientes = new ObservableList<ClienteModel>();

  void changeSelected(String state) {
    currentState = state;
    // agenteState = agr;
  }

  @action
  void add(AgendamentoModel item) {
    agendamentos.add(item);
  }

  @action
  void setContatos(List<AgendamentoModel> items) {
    agendamentos.addAll(items);
  }

  @action
  void clearContatos() {
    agendamentos = new ObservableList<AgendamentoModel>();
  }

  @action
  void addCliente(ClienteModel item) {
    clientes.add(item);
  }

  @action
  void setCliente(List<ClienteModel> items) {
    clientes.addAll(items);
  }

  @action
  void clearCliente() {
    clientes = new ObservableList<ClienteModel>();
  }
}
