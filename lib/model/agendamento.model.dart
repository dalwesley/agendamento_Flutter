class AgendamentoModel {
  int agendamentoId;
  String agendamentoClientNome;
  String agendamentoClientEmpresa;
  String agendamentoClientEmail;
  String agendamentoClientPhone;
  String agendamentoIndicado;
  bool agendamentoRemoto;
  String agendamentoDataAgendada;
  String agendamentoDataCadastro;
  String agendamentoHoraAgendada;
  bool agendamentoConcluido;
  String agendamentoAgente;
  String agendamentoOBS;
  bool agendamentoCancelado;

  AgendamentoModel({
    this.agendamentoId,
    this.agendamentoClientNome,
    this.agendamentoClientEmpresa,
    this.agendamentoClientEmail,
    this.agendamentoClientPhone,
    this.agendamentoIndicado,
    this.agendamentoRemoto,
    this.agendamentoDataAgendada,
    this.agendamentoDataCadastro,
    this.agendamentoHoraAgendada,
    this.agendamentoConcluido,
    this.agendamentoAgente,
    this.agendamentoOBS,
    this.agendamentoCancelado,
  });

  AgendamentoModel.fromJson(Map<dynamic, dynamic> json) {
    agendamentoId = json['agendamentoId']; //excepition aqui
    agendamentoClientNome = json['agendamentoClientNome'];
    agendamentoClientEmpresa = json['agendamentoClientEmpresa'];
    agendamentoClientEmail = json['agendamentoClientEmail'];
    agendamentoClientPhone = json['agendamentoClientPhone'];
    agendamentoIndicado = json['agendamentoIndicado'];
    agendamentoRemoto = json['agendamentoRemoto'];
    agendamentoDataAgendada = json['agendamentoDataAgendada'];
    agendamentoDataCadastro = json['agendamentoDataCadastro'];
    agendamentoHoraAgendada = json['agendamentoHoraAgendada'];
    agendamentoConcluido = json['agendamentoConcluido'];
    agendamentoAgente = json['agendamentoAgente'];
    agendamentoOBS = json['agendamentoOBS'];
    agendamentoCancelado = json['agendamentoCancelado'];
    // date = DateTime.parse(json['date']); // Alterado
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agendamentoId'] = this.agendamentoId;
    data['agendamentoClientNome'] = this.agendamentoClientNome;
    data['agendamentoClientEmpresa'] = this.agendamentoClientEmpresa;
    data['agendamentoClientEmail'] = this.agendamentoClientEmail;
    data['agendamentoClientPhone'] = this.agendamentoClientPhone;
    data['agendamentoIndicado'] = this.agendamentoIndicado;
    data['agendamentoRemoto'] = this.agendamentoRemoto;
    data['agendamentoDataAgendada'] = this.agendamentoDataAgendada;
    data['agendamentoDataCadastro'] = this.agendamentoDataCadastro;
    data['agendamentoHoraAgendada'] = this.agendamentoHoraAgendada;
    data['agendamentoConcluido'] = this.agendamentoConcluido;
    data['agendamentoAgente'] = this.agendamentoAgente;
    data['agendamentoOBS'] = this.agendamentoOBS;
    data['agendamentoCancelado'] = this.agendamentoCancelado;
    // data['date'] = this.date.toString().substring(0, 10); // Alterado
    return data;
  }
}
