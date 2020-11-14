class AgenteModel {
  int agenteId;
  String agenteNome;
  String agenteEmail;
  String agentePhone;
  String agenteDataCadastro;
  bool agenteStatus;

  AgenteModel({
    this.agenteId,
    this.agenteNome,
    this.agenteEmail,
    this.agentePhone,
    this.agenteDataCadastro,
    this.agenteStatus,
  });

  AgenteModel.fromJson(Map<dynamic, dynamic> json) {
    agenteId = json['agenteId']; //excepition aqui
    agenteNome = json['agenteNome'];
    agenteEmail = json['agenteEmail'];
    agentePhone = json['agentePhone'];
    agenteDataCadastro = json['agenteDataCadastro'];
    agenteStatus = json['agenteStatus'];
    // date = DateTime.parse(json['date']); // Alterado
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agenteId'] = this.agenteId;
    data['agenteNome'] = this.agenteNome;
    data['agenteEmail'] = this.agenteEmail;
    data['agentePhone'] = this.agentePhone;
    data['agenteDataCadastro'] = this.agenteDataCadastro;
    data['agenteStatus'] = this.agenteStatus;
    // data['date'] = this.date.toString().substring(0, 10); // Alterado
    return data;
  }
}
