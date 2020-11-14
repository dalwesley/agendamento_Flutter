// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$currentStateAtom = Atom(name: '_AppStore.currentState');

  @override
  String get currentState {
    _$currentStateAtom.context.enforceReadPolicy(_$currentStateAtom);
    _$currentStateAtom.reportObserved();
    return super.currentState;
  }

  @override
  set currentState(String value) {
    _$currentStateAtom.context.conditionallyRunInAction(() {
      super.currentState = value;
      _$currentStateAtom.reportChanged();
    }, _$currentStateAtom, name: '${_$currentStateAtom.name}_set');
  }

  final _$busyAtom = Atom(name: '_AppStore.busy');

  @override
  bool get busy {
    _$busyAtom.context.enforceReadPolicy(_$busyAtom);
    _$busyAtom.reportObserved();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.context.conditionallyRunInAction(() {
      super.busy = value;
      _$busyAtom.reportChanged();
    }, _$busyAtom, name: '${_$busyAtom.name}_set');
  }

  final _$agendamentosAtom = Atom(name: '_AppStore.agendamentos');

  @override
  ObservableList<AgendamentoModel> get agendamentos {
    _$agendamentosAtom.context.enforceReadPolicy(_$agendamentosAtom);
    _$agendamentosAtom.reportObserved();
    return super.agendamentos;
  }

  @override
  set agendamentos(ObservableList<AgendamentoModel> value) {
    _$agendamentosAtom.context.conditionallyRunInAction(() {
      super.agendamentos = value;
      _$agendamentosAtom.reportChanged();
    }, _$agendamentosAtom, name: '${_$agendamentosAtom.name}_set');
  }

  final _$clientesAtom = Atom(name: '_AppStore.clientes');

  @override
  ObservableList<ClienteModel> get clientes {
    _$clientesAtom.context.enforceReadPolicy(_$clientesAtom);
    _$clientesAtom.reportObserved();
    return super.clientes;
  }

  @override
  set clientes(ObservableList<ClienteModel> value) {
    _$clientesAtom.context.conditionallyRunInAction(() {
      super.clientes = value;
      _$clientesAtom.reportChanged();
    }, _$clientesAtom, name: '${_$clientesAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void add(AgendamentoModel item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.add(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setContatos(List<AgendamentoModel> items) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setContatos(items);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearContatos() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.clearContatos();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCliente(ClienteModel item) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.addCliente(item);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCliente(List<ClienteModel> items) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setCliente(items);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCliente() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.clearCliente();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
