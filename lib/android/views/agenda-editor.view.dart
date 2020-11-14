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

class EditorContact extends StatefulWidget {
  final AgendamentoModel agendamentoModel;
  EditorContact(this.agendamentoModel);

  @override
  _EditorContactState createState() => _EditorContactState();
}

class _EditorContactState extends State<EditorContact> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  String result1 = "aaaaaa";
  bool result2 = true;
  var date = new DateTime.now();
  final _dateFormat = new DateFormat('dd/MM/yyyy');
  // bool _validate = false;
  var email = Email('email.com', 'senha');

  TextEditingController _nameController;
  TextEditingController _empresaController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  TextEditingController _indicadoController;
  TextEditingController _atendimentoRemotoController;
  TextEditingController _agenteController;
  TextEditingController _obsController;
  // TextEditingController _canceladoController;
  // TextEditingController _idController;

  var phoneTextInputFormatter = MaskTextInputFormatter(mask: "(##)#####-####");
  TextEditingController _cepControlller;
  var cepTextInputFormatter = MaskTextInputFormatter(mask: "#####-###");
  TextEditingController _dataAgendadaController;
  var dataTextInputFormatter = MaskTextInputFormatter(mask: "##/##/####");
  TextEditingController _horaAgendadaController;
  var horaTextInputFormatter = MaskTextInputFormatter(mask: "##:##");

  FocusNode campoNome = FocusNode();
  FocusNode campoEmpresa = FocusNode();
  FocusNode campoCEP = FocusNode();
  FocusNode campoEmail = FocusNode();
  FocusNode campoPhone = FocusNode();
  FocusNode campoData = FocusNode();
  FocusNode campoHora = FocusNode();
  FocusNode campoIndicacao = FocusNode();
  FocusNode campoObs = FocusNode();
  FocusNode button = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientNome);

    _empresaController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientEmpresa);

    _emailController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientEmail);

    _agenteController = TextEditingController(
        text: widget.agendamentoModel.agendamentoAgente ?? result1);

    _phoneController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoClientPhone);

    // _cepControlller = new TextEditingController(
    //     text: widget.agendamentoModel.agendamentoClientCep);

    _indicadoController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoIndicado);

    _atendimentoRemotoController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoRemoto.toString());

    _dataAgendadaController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoDataAgendada);

    _horaAgendadaController = new TextEditingController(
        text: widget.agendamentoModel.agendamentoHoraAgendada);

    _obsController =
        new TextEditingController(text: widget.agendamentoModel.agendamentoOBS);

    // _canceladoController = new TextEditingController(
    //     text: widget.agendamentoModel.agendamentoCancelado.toString());
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: widget.agendamentoModel.agendamentoId == null
            ? Text("Novo Contato")
            : Text("Editar Contatos"),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                LayoutBuilder(
                  builder: (_, constraints) {
                    return Column(
                      children: <Widget>[
                        Container(
                          color: backgroundColor,
                          width: double.infinity,
                          child: Center(
                            child: new Text(
                              'Dados Pessoais',
                              style: new TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                          ),
                        ),
                        //------------------------------------------- Form Nome
                        TextFormField(
                          // initialValue:
                          //     widget.agendamentoModel.agendamentoClientNome,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          focusNode: campoNome,
                          autofocus:
                              widget.agendamentoModel.agendamentoId == null
                                  ? true
                                  : false,
                          decoration: InputDecoration(
                            labelText: "Nome Completo:",
                            icon: Icon(Icons.person,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _nameController,
                          validator: validarNome,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoNome.unfocus();
                            FocusScope.of(context).requestFocus(campoEmpresa);
                          },
                        ),
                        //------------------------------------------- Form Empresa
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          focusNode: campoEmpresa,
                          decoration: InputDecoration(
                            labelText: "Empresa:",
                            icon: Icon(Icons.work,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _empresaController,
                          validator: validarEmpresa,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoEmpresa.unfocus();
                            FocusScope.of(context).requestFocus(campoEmail);
                          },
                        ),
                        //------------------------------------------- Form E-mail
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          focusNode: campoEmail,
                          decoration: InputDecoration(
                            labelText: "E-mail:",
                            icon: Icon(Icons.mail,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _emailController,
                          validator: validarEmail,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoEmail.unfocus();
                            FocusScope.of(context).requestFocus(campoPhone);
                          },
                        ),
                        //------------------------------------------- Form Celular
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [phoneTextInputFormatter],
                          textInputAction: TextInputAction.next,
                          focusNode: campoPhone,
                          decoration: InputDecoration(
                            labelText: "Celular:",
                            hintText: "(12)34567-8910",
                            icon: Icon(Icons.phone_android,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _phoneController,
                          validator: validarPhone,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoPhone.unfocus();
                            FocusScope.of(context).requestFocus(campoCEP);
                          },
                        ),
                        //------------------------------------------- Form CEP
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [cepTextInputFormatter],
                          textInputAction: TextInputAction.next,
                          focusNode: campoCEP,
                          decoration: InputDecoration(
                            labelText: "CEP:",
                            hintText: "12345-678",
                            icon: Icon(Icons.pin_drop,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _cepControlller,
                          validator: validarCEP,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoCEP.unfocus();
                            FocusScope.of(context).requestFocus(campoIndicacao);
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

                        //------------------------------------------- Form Indicação
                        TextFormField(
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          focusNode: campoIndicacao,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: "Indicação:",
                            icon: Icon(Icons.directions,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _indicadoController,
                          validator: validarNome,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoIndicacao.unfocus();
                            FocusScope.of(context).requestFocus(campoData);
                          },
                        ),
                        //------------------------------------------- Form Data Agendada
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [dataTextInputFormatter],
                          textInputAction: TextInputAction.next,
                          focusNode: campoData,
                          decoration: InputDecoration(
                            labelText: "Data agendada:",
                            hintText: "01/01/2020",
                            icon: Icon(Icons.calendar_today,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _dataAgendadaController,
                          // validator: validarData,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoData.unfocus();
                            FocusScope.of(context).requestFocus(campoHora);
                          },
                        ),

                        //------------------------------------------- Form Hora Agendada
                        TextFormField(
                          keyboardType: TextInputType.number,
                          inputFormatters: [horaTextInputFormatter],
                          focusNode: campoHora,
                          decoration: InputDecoration(
                            labelText: "Horário:",
                            hintText: "12:30",
                            icon: Icon(Icons.watch_later,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _horaAgendadaController,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoHora.unfocus();
                            FocusScope.of(context).requestFocus(campoObs);
                          },
                        ),
                        //------------------------------------------- Form Obs
                        TextFormField(
                          // maxLines: 5,
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.newline,
                          focusNode: campoObs,
                          autofocus: false,
                          decoration: InputDecoration(
                            labelText: "Observações sobre o atendimento:",
                            icon: Icon(Icons.warning,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _obsController,
                          // validator: validarNome,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoObs.unfocus();
                            FocusScope.of(context).requestFocus(campoData);
                          },
                        ),

                        //------------------------------------------- Form agente
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 35.0, bottom: 10.0),
                              child: Text(
                                'Agentes: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 110.0,
                              initialLabelIndex: _agenteController.text == "@"
                                  ? 0
                                  : _agenteController.text == ""
                                      ? 1
                                      : _agenteController.text == "" ? 2 : 0,
                              activeBgColor: Colors.green,@
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.grey[900],
                              labels: ['@ @', '@', '@'],
                              onToggle: (value) {
                                setState(
                                  () {@
                                    switch (value) {
                                      case 0:
                                        result1 = '@ @';
                                        break;
                                      case 1:
                                        result1 = '@';
                                        break;
                                      case 2:
                                        result1 = '@';
                                        break;
                                      default:
                                        result1 = "@
                                    }
                                  },
                                );
                                print('switched to: $result1');
                              },
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 35.0, bottom: 10.0),
                              child: Text(
                                'Atendimento remotossssssss: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 110.0,
                              initialLabelIndex:
                                  _atendimentoRemotoController.text == "false"
                                      ? 0
                                      : 1,
                              activeBgColor: Colors.green,
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.grey,
                              inactiveFgColor: Colors.grey[900],
                              labels: ['Presencial', 'Remoto'],
                              onToggle: (value) {
                                setState(
                                  () {
                                    switch (value) {
                                      case 0:
                                        result2 = false;
                                        break;
                                      case 1:
                                        result2 = true;
                                        break;
                                      // case 2:
                                      //   result1 = '';
                                      //   break;
                                      default:
                                        result2 = false;
                                    }
                                  },
                                );
                                print('switched to: $result1');
                              },
                            ),
                          ],
                        ),

                        //------------------------------------------- Form Tipo de atendimento
                        // Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.only(
                        //           top: 35.0, bottom: 10.0),
                        //       child: Text(
                        //         'Atendimento Remoto: ',
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 18.0),
                        //       ),
                        //     ),
                        //     ToggleSwitch(
                        //       minWidth: 150.0,
                        //       // cornerRadius: 0,
                        //       initialLabelIndex:
                        //           ((widget.agendamentoModel.agendamentoRemoto ==
                        //                       false) ||
                        //                   (widget.agendamentoModel
                        //                           .agendamentoRemoto ==
                        //                       null))
                        //               ? 0
                        //               : 1,
                        //       activeBgColor: primaryColor,
                        //       activeBgColors: [primaryColor, Colors.white],
                        //       activeFgColor: backgroundColor,
                        //       inactiveBgColor: accentColor.withAlpha(100),
                        //       inactiveFgColor: Colors.grey[900],
                        //       labels: ['Presencial', 'Remoto'],
                        //       icons: [Icons.videocam_off, Icons.videocam],
                        //       onToggle: (value) {
                        //         setState(
                        //           () {
                        //             switch (value) {
                        //               case 0:
                        //                 result2 = false;
                        //                 break;
                        //               case 1:
                        //                 result2 = true;
                        //                 break;
                        //               // case 2:
                        //               //   result1 = '';
                        //               //   break;
                        //               default:
                        //                 result2 = false;
                        //             }
                        //           },
                        //         );
                        //         TextField(
                        //           enabled: false,
                        //           controller: _atendimentoRemotoController,
                        //         );
                        //         print('switched to: $result2');
                        //       },
                        //     ),
                        //     SizedBox(height: 30),
                        //   ],
                        // ),
                      ],
                    );

                    // );
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
            // sendEmail();
            var todo = new AgendamentoModel(
              agendamentoId: widget.agendamentoModel.agendamentoId ?? 0,
              agendamentoClientNome: _nameController.text ??
                  widget.agendamentoModel.agendamentoClientNome,
              agendamentoClientEmpresa: _empresaController.text ??
                  widget.agendamentoModel.agendamentoClientEmpresa,
              agendamentoClientEmail:
                  _emailController.text ?? widget.agendamentoModel,
              agendamentoClientPhone: _phoneController.text ??
                  widget.agendamentoModel.agendamentoClientPhone,
              // agendamentoClientCep: _cepControlller.text ??
              //     widget.agendamentoModel.agendamentoClientCep,
              agendamentoIndicado: _indicadoController.text ??
                  widget.agendamentoModel.agendamentoIndicado,
              agendamentoRemoto:
                  result2 ?? widget.agendamentoModel.agendamentoRemoto,
              agendamentoDataAgendada: _dataAgendadaController.text ??
                  widget.agendamentoModel.agendamentoDataAgendada,
              agendamentoDataCadastro: _dateFormat.format(date),
              agendamentoHoraAgendada: _horaAgendadaController.text ??
                  widget.agendamentoModel.agendamentoHoraAgendada,
              agendamentoConcluido:
                  false ?? widget.agendamentoModel.agendamentoConcluido,
              agendamentoAgente:
                  result1 ?? widget.agendamentoModel.agendamentoAgente,
              agendamentoOBS:
                  _obsController.text ?? widget.agendamentoModel.agendamentoOBS,
              agendamentoCancelado:
                  widget.agendamentoModel.agendamentoCancelado ?? false,
            );
            if (widget.agendamentoModel.agendamentoId == null) {
              controller.add(todo).then(
                (_) {
                  Navigator.of(context).pop();
                },
              );
            } else {
              controller.edit(todo).then(
                (_) {
                  Navigator.of(context).pop();
                },
              );
            }
          } else {
            showAlertDialog(context);
          }
        },
        backgroundColor: accentColor,
        child: widget.agendamentoModel.agendamentoId == null
            ? Icon(Icons.add, size: 35)
            : Icon(Icons.save, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

//-----------------------------------------------------------email---------------------------------------------------
  // void sendEmail() async {
  //   widget.clienteModel.clienteNome == null
  //       ? remoto == true
  //           ? await email.sendMessage(
  //               ' de confirmação de agendamento \n\n'
  //                       'Sr(a) ' +
  //                   widget.agendamentoModel.cliente.clienteNome +
  //                   ';'
  //                       '\n'
  //                       'Os dados abaixo foram informados para o agendamento de emissão de Certificado Digital na @. \n'
  //                       'O atendimento será feito de forma REMOTA, seguindo as medidas de proteção e distanciamento social.\n'
  //
  //                       'Dados Informados:\n'
  //                       'Nome: ' +
  //                   widget.agendamentoModel.cliente.clienteNome +
  //                   '\nEmpresa: ' +
  //                   widget.agendamentoModel.cliente.clienteEmpresa +
  //                   '\nCelular: ' +
  //                   widget.agendamentoModel.cliente.clientePhone +
  //                   '\nEmail: ' +
  //                   widget.agendamentoModel.cliente.clienteEmail +
  //                   '\nData Agendada: ' +
  //                   agendamentoDataAgendadaController.text +
  //                   '\nHora Agendada: ' +
  //                   agendamentoHoraAgendadaController.text +
  //                   '\n\n\n\n\Esse email foi gerado altomaticamente, qualquer duvida, critica ou sugestão; você pode entrar em contato: \n'

  //                       '\n'
  //                       'Os dados abaixo foram informados para o agendamento de emissão de Certificado Digital na @. \n'
  //                       'O atendimento será feito de forma PRESENCIAL, seguindo as medidas de proteção e distanciamento social.\n'

  //                       'Dados Informados:\n'
  //                       'Nome: ' +
  //                   widget.agendamentoModel.cliente.clienteNome +
  //                   '\nEmpresa: ' +
  //                   widget.agendamentoModel.cliente.clienteEmpresa +
  //                   '\nCelular: ' +
  //                   widget.agendamentoModel.cliente.clientePhone +
  //                   '\nEmail: ' +
  //                   widget.agendamentoModel.cliente.clienteEmail +
  //                   '\nData Agendada: ' +
  //                   agendamentoDataAgendadaController.text +
  //                   '\nHora Agendada: ' +
  //                   agendamentoHoraAgendadaController.text +

  //               'Email de confirmação de agendamento \n\n'
  //                       'Sr(a) ' +
  //                   widget.clienteModel.clienteNome +
  //                   ';'
  //                       '\n'
  //                       'Os dados abaixo foram informados para o agendamento de emissão de Certificado Digital na @. \n'
  //                       'O atendimento será feito de forma REMOTA.\n'

  //                       'Dados Informados:\n'
  //                       'Nome: ' +
  //                   widget.clienteModel.clienteNome +
  //                   '\nEmpresa: ' +
  //                   widget.clienteModel.clienteEmpresa +
  //                   '\nCelular: ' +
  //                   widget.clienteModel.clientePhone +
  //                   '\nEmail: ' +

  //                       'Os dados abaixo foram informados para o agendamento de emissão de Certificado Digital na @. \n'
  //                       'O atendimento será feito de forma Presencial.\n'

  //                       'Dados Informados:\n'
  //                       'Nome: ' +
  //                   widget.clienteModel.clienteNome +
  //                   '\nEmpresa: ' +
  //                   widget.clienteModel.clienteEmpresa +
  //                   '\nCelular: ' +
  //                   widget.clienteModel.clientePhone +
  //                   '\nEmail: ' +
  //                   widget.clienteModel.clienteEmail +

  //   // setState(() {
  //   //   text = result ? 'Enviado.' : 'Não enviado.';
  //   // });
  // }

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

  showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Opsss..."),
      content: Text("Você esqueceu alguma coisa..."),
      actions: [
        okButton,
      ],
    );

    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
