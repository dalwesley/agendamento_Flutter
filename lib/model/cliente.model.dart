class ClienteModel {
  int clienteId;
  String clienteNome;
  String clienteEmpresa;
  String clienteEmail;
  String clientePhone;
  String clienteIndicado;
  String clienteObs;
  String agendamentoDataCadastro;
  String atendimentoRemoto;
  String agendamentoData;
  String agendamentoHora;
  String atendimentoRealizado;
  String atendimentoCancelado;
  String agendamentoObs;
  String agente;

  ClienteModel({
    this.clienteId,
    this.clienteNome,
    this.clienteEmpresa,
    this.clienteEmail,
    this.clientePhone,
    this.clienteIndicado,
    this.clienteObs,
    this.agendamentoDataCadastro,
    this.atendimentoRemoto,
    this.agendamentoData,
    this.agendamentoHora,
    this.atendimentoRealizado,
    this.atendimentoCancelado,
    this.agendamentoObs,
    this.agente,
  });

  ClienteModel.fromJson(Map<String, dynamic> json) {
    this.clienteId = json['clienteId'];
    this.clienteNome = json['clienteNome'];
    this.clienteEmpresa = json['clienteEmpresa'];
    this.clienteEmail = json['clienteEmail'];
    this.clientePhone = json['clientePhone'];
    this.clienteIndicado = json['clienteIndicado'];
    this.clienteObs = json['clienteObs'];
    this.agendamentoDataCadastro = json['agendamentoDataCadastro'];
    this.atendimentoRemoto = json['atendimentoRemoto'];
    this.agendamentoData = json['agendamentoData'];
    this.agendamentoHora = json['agendamentoHora'];
    this.atendimentoRealizado = json['atendimentoRealizado'];
    this.atendimentoCancelado = json['atendimentoCancelado'];
    this.agendamentoObs = json['agendamentoObs'];
    this.agente = json['agente'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clienteId'] = this.clienteId;
    data['clienteNome'] = this.clienteNome;
    data['clienteEmpresa'] = this.clienteEmpresa;
    data['clienteEmail'] = this.clienteEmail;
    data['clientePhone'] = this.clientePhone;
    data['clienteIndicado'] = this.clienteIndicado;
    data['clienteObs'] = this.clienteObs;
    data['agendamentoDataCadastro'] = this.agendamentoDataCadastro;
    data['atendimentoRemoto'] = this.atendimentoRemoto;
    data['agendamentoData'] = this.agendamentoData;
    data['agendamentoHora'] = this.agendamentoHora;
    data['atendimentoRealizado'] = this.atendimentoRealizado;
    data['atendimentoCancelado'] = this.atendimentoCancelado;
    data['agendamentoObs'] = this.agendamentoObs;
    data['agente'] = this.agente;
    return data;
  }
}
