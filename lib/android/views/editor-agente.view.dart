import 'package:contatos/controller/login.controller.dart';
import 'package:contatos/themes/light.theme.dart';
import 'package:contatos/email.dart';
import 'package:contatos/model/agente.model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../user.dart';

class EditorAgente extends StatefulWidget {
  final AgenteModel agenteModel;
  EditorAgente(this.agenteModel);

  @override
  _EditorAgenteState createState() => _EditorAgenteState();
}

class _EditorAgenteState extends State<EditorAgente> {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();
  int value;
  var date = new DateTime.now();
  final _dateFormat = new DateFormat('dd/MM/yyyy');
  bool result2 = false;
  var email = Email('email.com', 'senha');

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _phoneController;
  // TextEditingController _agenteDataCadastro;

  var phoneTextInputFormatter = MaskTextInputFormatter(mask: "(##)#####-####");
  var dataTextInputFormatter = MaskTextInputFormatter(mask: "##/##/####");

  FocusNode campoNome = FocusNode();
  FocusNode campoEmail = FocusNode();
  FocusNode campoPhone = FocusNode();
  FocusNode campoData = FocusNode();
  FocusNode campoSenha = FocusNode();
  FocusNode button = FocusNode();

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(
        text: widget.agenteModel.agenteNome ?? user.name);
    _emailController = new TextEditingController(
        text: widget.agenteModel.agenteEmail ?? user.email);
    _phoneController = new TextEditingController(
        text: widget.agenteModel.agentePhone ?? user.phone.toString());
    // _agenteDataCadastro = new TextEditingController(
    //     text: widget.agenteModel.agenteDataCadastro ?? date.toString());
  }

  @override
  Widget build(BuildContext context) {
    final controller = new LoginController();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: widget.agenteModel.agenteId == null
            ? Text("Novo Agente")
            : Text("Editar Agente"),
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
                              'Dados do Agente',
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
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.words,
                          textInputAction: TextInputAction.next,
                          focusNode: campoNome,
                          autofocus: widget.agenteModel.agenteId == null
                              ? true
                              : false,
                          decoration: InputDecoration(
                            labelText: "Nome Completo:",
                            icon: Icon(Icons.person,
                                size: constraints.maxWidth * 0.07),
                          ),
                          controller: _nameController,
                          // validator: validarNome,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoNome.unfocus();
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
                          // validator: validarEmail,
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
                          // validator: validarPhone,
                          style: TextStyle(
                            fontSize: constraints.maxWidth * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                          onFieldSubmitted: (term) {
                            campoPhone.unfocus();
                            FocusScope.of(context).requestFocus();
                          },
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 35.0, bottom: 10.0),
                              child: Text(
                                'Agente liberado',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                            ToggleSwitch(
                              minWidth: 150.0,
                              // cornerRadius: 0,
                              initialLabelIndex:
                                  ((widget.agenteModel.agenteStatus == false) ||
                                          (widget.agenteModel.agenteStatus ==
                                              null))
                                      ? 0
                                      : 1,
                              activeBgColor: primaryColor,
                              // activeTextColor: Colors.white,
                              activeFgColor: Colors.white,
                              inactiveBgColor: backgroundColor.withRed(190),
                              // inactiveTextColor: Colors.grey[900],
                              inactiveFgColor: Colors.grey[900],
                              // inactiveFgColor: Colors.grey[900],
                              labels: ['Bloqueado', 'Liberado'],
                              icons: [Icons.cancel, Icons.check_circle],
                              // activeColors: [Colors.blue, Colors.pink],
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
                                // TextField(
                                //   enabled: false,
                                //   controller: _atendimentoRemotoController,
                                // );
                                // print('switched to: $result2');
                              },
                            ),
                            SizedBox(height: 30),
                          ],
                        ),

                        SizedBox(height: 30),
                      ],
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
            // sendEmail();
            var todo = new AgenteModel(
              agenteId: widget.agenteModel.agenteId ?? 0,
              agenteNome: _nameController.text ?? widget.agenteModel.agenteNome,
              agenteEmail:
                  _emailController.text ?? widget.agenteModel.agenteEmail,
              agentePhone:
                  _phoneController.text ?? widget.agenteModel.agentePhone,
              // agenteDataCadastro: _agenteDataCadastro.text ??  widget.agenteModel.agenteDataCadastro,
              agenteDataCadastro: _dateFormat.format(date),
              agenteStatus: true ?? widget.agenteModel.agenteStatus,
            );
            if (widget.agenteModel.agenteId == null) {
              controller.addAgente(todo).then(
                (_) {
                  Navigator.of(context).pop();
                },
              );
            } else {
              controller.editAgente(todo).then(
                (_) {
                  Navigator.of(context).pop();
                },
              );
            }
          } else {
            // showAlertDialog(context);
          }
        },
        backgroundColor: accentColor,
        child: widget.agenteModel.agenteId == null
            ? Icon(Icons.add, size: 35)
            : Icon(Icons.save, size: 35),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

//-----------------------------------------------------------email---------------------------------------------------
  // void sendEmail() async {
  //   await email.sendMessage(
  //       'Email de confirmação de agente \n\n'
  //               'Sr(a) ' +
  //           _nameController.text +
  //           ';'
  //               '\n'
  //               'Os dados abaixo foram informados para agente de emissão de Certificado Digital na @. \n'
  //               'Caso não tenha solicitado o agente, ou a data ' +
  //           _dataAgendadaController.text +
  //               'Dados Informados:\n'
  //               'Nome: ' +
  //           _nameController.text +
  //           '\nEmpresa: ' +
  //           _empresaController.text +
  //           '\nCelular: ' +
  //           _phoneController.text +
  //           '\nEmail: ' +
  //           _emailController.text +
  //           '\nData Agendada: ' +
  //           _dataAgendadaController.text +
  //           '\nHora Agendada: ' +
  //           _horaAgendadaController.text +
  //           // '\nCEP: ' +
  //           // _cepControlller.text +
  //           '\n\n\n\n\ Esse email foi gerado altomaticamente, qualquer duvida, critica ou sugestão; você pode entrar em contato: \n'

  //       _emailController.text,
  //       'Confirmação de agente de certificado @');

  // setState(() {
  //   text = result ? 'Enviado.' : 'Não enviado.';
  // });
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
