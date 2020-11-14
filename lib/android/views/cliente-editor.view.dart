import 'package:contatos/android/styles.android.dart';
import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/email.dart';
import 'package:contatos/model/agendamento.model.dart';
import 'package:contatos/store/app.store.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ClienteEditor extends StatefulWidget {
  final AgendamentoModel agendamentoModel;
  ClienteEditor(this.agendamentoModel);

  @override
  _ClienteEditorState createState() => _ClienteEditorState();
}

class _ClienteEditorState extends State<ClienteEditor> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  String agente;
  bool remoto;
  String emailCopia;
  var date = new DateTime.now();
  final _dateFormat = new DateFormat('dd/MM/yyyy');
  var result1;
  var result2;
  // bool _validate = false;
  var email = Email('email.com', 'senha');

  TextEditingController _controllerAgendamentoId;
  TextEditingController _controllerAgendamentoClientNome;
  TextEditingController _controllerAgendamentoClientEmpresa;
  TextEditingController _controllerAgendamentoClientEmail;
  TextEditingController _controllerAgendamentoClientPhone;
  TextEditingController _controllerAgendamentoClientCep;
  TextEditingController _controllerAgendamentoIndicado;
  TextEditingController _controllerAgendamentoRemoto;
  TextEditingController _controllerAgendamentoDataAgendada;
  TextEditingController _controllerAgendamentoDataCadastro;
  TextEditingController _controllerAgendamentoHoraAgendada;
  TextEditingController _controllerAgendamentoConcluido;
  TextEditingController _controllerAgendamentoAgente;
  TextEditingController _controllerAgendamentoOBS;
  TextEditingController _controllerAgendamentoCancelado;

  var phoneTextInputFormatter = MaskTextInputFormatter(mask: "(##)#####-####");
  var dataTextInputFormatter = MaskTextInputFormatter(mask: "##/##/####");
  var horaTextInputFormatter = MaskTextInputFormatter(mask: "##:###");

  FocusNode campoAgendamentoClientNome = FocusNode();
  FocusNode campoAgendamentoClientEmpresa = FocusNode();
  FocusNode campoAgendamentoClientEmail = FocusNode();
  FocusNode campoAgendamentoClientPhone = FocusNode();
  FocusNode campoAgendamentoClientCep = FocusNode();
  FocusNode campoAgendamentoIndicado = FocusNode();
  FocusNode campoAgendamentoRemoto = FocusNode();
  FocusNode campoAgendamentoDataAgendada = FocusNode();
  FocusNode campoAgendamentoDataCadastro = FocusNode();
  FocusNode campoAgendamentoHoraAgendada = FocusNode();
  FocusNode campoAgendamentoConcluido = FocusNode();
  FocusNode campoAgendamentoAgente = FocusNode();
  FocusNode campoAgendamentoOBS = FocusNode();
  FocusNode campoAgendamentoCancelado = FocusNode();

  @override
  void initState() {
    super.initState();

    _controllerAgendamentoId = new TextEditingController(
        text: widget.agendamentoModel.agendamentoId.toString());

    _controllerAgendamentoClientNome = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientNome);

    _controllerAgendamentoClientEmpresa = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientEmpresa);

    _controllerAgendamentoClientEmail = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientEmail);

    _controllerAgendamentoClientPhone = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientPhone);

    // _controllerAgendamentoClientCep = new TextEditingController(
    //     text: widget.agendamentoModel.agendamentoClientCep);

    _controllerAgendamentoIndicado = new TextEditingController(
        text: widget.agendamentoModel.agendamentoIndicado);

    _controllerAgendamentoRemoto = new TextEditingController(
        text: widget.agendamentoModel.agendamentoRemoto.toString());

    _controllerAgendamentoDataAgendada = new TextEditingController(
        text: widget.agendamentoModel.agendamentoDataAgendada);

    _controllerAgendamentoDataCadastro = new TextEditingController(
        text: widget.agendamentoModel.agendamentoDataCadastro);

    _controllerAgendamentoHoraAgendada = new TextEditingController(
        text: widget.agendamentoModel.agendamentoHoraAgendada);

    _controllerAgendamentoConcluido = new TextEditingController(
        text: widget.agendamentoModel.agendamentoConcluido.toString());

    _controllerAgendamentoAgente = new TextEditingController(
        text: widget.agendamentoModel.agendamentoAgente);

    _controllerAgendamentoOBS =
        new TextEditingController(text: widget.agendamentoModel.agendamentoOBS);

    _controllerAgendamentoCancelado = new TextEditingController(
        text: widget.agendamentoModel.agendamentoCancelado.toString());
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        title: widget.agendamentoModel.agendamentoId == null
            ? Text(
                "Novo Agendamento",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Text(
                "Editar Agendamento",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                LayoutBuilder(
                  builder: (_, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Dados Pessoais',
                            style: new TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              color: primaryColor,
                            ),
                          ),
                          //------------------------------------------- Form Nome
                          TextFormField(
                            // initialValue:
                            //     widget.agendamentoModel.clienteClientNome,
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            focusNode: campoAgendamentoClientNome,
                            autofocus:
                                widget.agendamentoModel.agendamentoId == null
                                    ? true
                                    : false,
                            decoration: InputDecoration(
                              labelText: "Nome Completo:",
                              icon: Icon(Icons.person,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoClientNome,
                            validator: validarNome,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoClientNome.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoClientEmpresa);
                            },
                          ),
                          //------------------------------------------- Form Empresa
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            focusNode: campoAgendamentoClientEmpresa,
                            decoration: InputDecoration(
                              labelText: "Empresa:",
                              icon: Icon(Icons.work,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoClientEmpresa,
                            validator: validarEmpresa,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoClientEmpresa.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoClientEmail);
                            },
                          ),
                          //------------------------------------------- Form E-mail
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            focusNode: campoAgendamentoClientEmail,
                            decoration: InputDecoration(
                              labelText: "E-mail:",
                              icon: Icon(Icons.mail,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoClientEmail,
                            validator: validarEmail,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoClientEmail.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoClientPhone);
                            },
                          ),
                          //------------------------------------------- Form Celular
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [phoneTextInputFormatter],
                            textInputAction: TextInputAction.next,
                            focusNode: campoAgendamentoClientPhone,
                            decoration: InputDecoration(
                              labelText: "Celular:",
                              hintText: "(12)34567-8910",
                              icon: Icon(Icons.phone_android,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoClientPhone,
                            validator: validarPhone,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoClientPhone.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoIndicado);
                            },
                          ),
                          //------------------------------------------- Form Indicação
                          TextFormField(
                            keyboardType: TextInputType.text,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.next,
                            focusNode: campoAgendamentoIndicado,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: "Indicação:",
                              icon: Icon(Icons.directions,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoIndicado,
                            validator: validarNome,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoIndicado.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoDataAgendada);
                            },
                          ),
                          SizedBox(height: 50),
                          // new Divider(height: 5.0, color: Colors.black),
                          // ------------------------------------------- Dados de agendamento
                          Container(
                            color: backgroundColor,
                            width: double.infinity,
                            child: Center(
                              child: new Text(
                                'Dados do Agendamento',
                                style: new TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          //------------------------------------------- Form Data Agendada
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [dataTextInputFormatter],
                            textInputAction: TextInputAction.next,
                            focusNode: campoAgendamentoDataAgendada,
                            decoration: InputDecoration(
                              labelText: "Data agendada:",
                              hintText: "01/01/2020",
                              icon: Icon(Icons.calendar_today,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoDataAgendada,
                            // validator: validarData,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoDataAgendada.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoHoraAgendada);
                            },
                          ),
//------------------------------------------- Form Hora Agendada
                          TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [horaTextInputFormatter],
                            focusNode: campoAgendamentoHoraAgendada,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: "Horário:",
                              hintText: "12:30",
                              icon: Icon(Icons.watch_later,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoHoraAgendada,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                            onFieldSubmitted: (term) {
                              campoAgendamentoHoraAgendada.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(campoAgendamentoOBS);
                            },
                          ),

                          //------------------------------------------- Form obs
                          TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            focusNode: campoAgendamentoOBS,
                            textCapitalization: TextCapitalization.words,
                            textInputAction: TextInputAction.newline,
                            autofocus: false,
                            decoration: InputDecoration(
                              labelText: "Observações sobre o atendimento:",
                              icon: Icon(Icons.speaker_notes,
                                  size: constraints.maxWidth * 0.07),
                            ),
                            controller: _controllerAgendamentoOBS,
                            // validator: validarNome,
                            style: TextStyle(
                              fontSize: constraints.maxWidth * 0.04,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          //------------------------------------------- Form agente
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, bottom: 10.0),
                                child: Text(
                                  'Agentes: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: textColor),
                                ),
                              ),
                              ToggleSwitch(
                                minWidth: 110.0,
                                // minHeight: 40.0,
                                initialLabelIndex: _controllerAgendamentoAgente
                                            .text ==
                                        "@ @"
                                    ? 0
                                    : _controllerAgendamentoAgente.text == "@"
                                        ? 1
                                        : _controllerAgendamentoAgente.text ==
                                                "@"
                                            ? 2
                                            : 4,
                                cornerRadius: 5.0,
                                activeBgColor: primaryColor,
                                activeFgColor: Colors.white,
                                inactiveBgColor: accentColor.withAlpha(30),
                                inactiveFgColor: Colors.grey[900],
                                labels: ['aaaaaaaaa', 'bbbbbbb', 'ccccccc'],
                                iconSize: 30.0,
                                onToggle: (index) {
                                  if (index == 0) {
                                    agente = 'aaaaaaaaa';
                                    emailCopia = '@.com.br';
                                  } else if (index == 1) {
                                    agente = 'bbbbb';
                                    emailCopia = '@c.com.br';
                                  } else if (index == 2) {
                                    agente = 'ccccccc';
                                    emailCopia = '.2com.br';
                                  } else {
                                    agente = 'AAAAAAA';
                                    emailCopia = '@.com.br';
                                  }
                                },
                              ),
                            ],
                          ),

                          //------------------------------------------- Form Tipo de atendimento
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 30.0, bottom: 10.0),
                                child: Text(
                                  'Atendimento Remoto: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                      color: textColor),
                                ),
                              ),
                              ToggleSwitch(
                                minWidth: 150.0,
                                // minHeight: 40.0,
                                initialLabelIndex:
                                    widget.agendamentoModel.agendamentoRemoto ==
                                            false
                                        ? 0
                                        : widget.agendamentoModel
                                                    .agendamentoRemoto ==
                                                true
                                            ? 1
                                            : 2,
                                cornerRadius: 5.0,
                                activeBgColor: primaryColor,
                                activeFgColor: Colors.white,
                                inactiveBgColor: accentColor.withAlpha(30),
                                inactiveFgColor: Colors.grey[900],
                                labels: ['Presencial', 'Remoto'],
                                icons: [Icons.videocam_off, Icons.videocam],
                                // iconSize: 30.0,
                                onToggle: (value) {
                                  if (value == 0) {
                                    remoto = false;
                                  } else {
                                    remoto = true;
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(""),
            ),
          ],
        ),
        // ),
        shape: CircularNotchedRectangle(),
        color: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            var cliente = new AgendamentoModel(
                agendamentoId: widget.agendamentoModel.agendamentoId ?? 0,
                agendamentoClientNome: _controllerAgendamentoClientNome.text ??
                    widget.agendamentoModel.agendamentoClientNome,
                agendamentoClientEmpresa:
                    _controllerAgendamentoClientEmpresa.text ??
                        widget.agendamentoModel.agendamentoClientEmpresa,
                agendamentoClientEmail:
                    _controllerAgendamentoClientEmail.text ??
                        widget.agendamentoModel.agendamentoClientEmail,
                agendamentoClientPhone:
                    _controllerAgendamentoClientPhone.text ??
                        widget.agendamentoModel.agendamentoClientPhone,
                agendamentoIndicado: _controllerAgendamentoIndicado.text ??
                    widget.agendamentoModel.agendamentoIndicado,
                agendamentoRemoto:
                    remoto ?? widget.agendamentoModel.agendamentoRemoto,
                agendamentoDataAgendada:
                    _controllerAgendamentoDataAgendada.text ??
                        widget.agendamentoModel.agendamentoDataAgendada,
                agendamentoDataCadastro: _dateFormat.format(date),
                agendamentoHoraAgendada:
                    _controllerAgendamentoHoraAgendada.text ??
                        widget.agendamentoModel.agendamentoHoraAgendada,
                agendamentoConcluido:
                    false ?? widget.agendamentoModel.agendamentoConcluido,
                agendamentoAgente:
                    agente ?? widget.agendamentoModel.agendamentoAgente,
                agendamentoOBS: _controllerAgendamentoOBS.text ??
                    widget.agendamentoModel.agendamentoOBS,
                agendamentoCancelado:
                    false ?? widget.agendamentoModel.agendamentoCancelado);
            if (widget.agendamentoModel.agendamentoId == null) {
              controller.add(cliente).then(
                (_) {
                  Navigator.pop(context);
                  // Navigator.of(context).pop();
                },
              );
            } else {
              controller.edit(cliente).then(
                (_) {
                  Navigator.pop(context);
                  // Navigator.of(context).pop();
                },
              );
            }
          } else {}
        },
        backgroundColor: accentColor,
        child: widget.agendamentoModel.agendamentoId == null
            ? Icon(Icons.add, size: 35)
            : Icon(Icons.check, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  String validarNome(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o nome completo";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O nome deve conter apenas caracteres de a-z ou A-Z";
    }
    return null;
  }

  String validarEmpresa(String value) {
    if (value.length == 0) {
      return "Por favor, informe o nome da empresa";
    }
    return null;
  }

  String validarCEP(String value) {
    String patttern = r'(^[0-9+\-]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o CEP";
    } else if (value.length != 9) {
      return "O CEP deve ter 8 números! Ex: '12345-678' ";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O número do CEP so deve conter dígitos!'";
    }
    return null;
  }

  String validarEmail(String value) {
    String pattern = r'^[\w+.]+@\w+\.\w{2,}(?:\.\w{2})?$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Por favor, informe o Email";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! O Email é inválido";
    } else {
      return null;
    }
  }

  String validarPhone(String value) {
    String patttern = r'(^[0-9+\-+\(+\)]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Por favor, informe o celular";
    } else if (value.length != 14) {
      return "O celular deve ter 11 números! (12)34567-8910";
    } else if (!regExp.hasMatch(value)) {
      return "Opss, deu algo errado! Digite somentes os número do celular!";
    }
    return null;
  }
}
