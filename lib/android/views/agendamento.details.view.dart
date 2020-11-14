import 'package:contatos/android/styles.android.dart';
import 'package:contatos/android/views/agenda-editor.view.dart';
import 'package:contatos/android/views/cliente-editor.view.dart';
import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/model/agendamento.model.dart';
import 'package:contatos/model/cliente.model.dart';
import 'package:contatos/store/app.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AgendamentoDetailsView extends StatefulWidget {
  final AgendamentoModel agendamentoModel;
  AgendamentoDetailsView(this.agendamentoModel);

  @override
  _AgendamentoDetailsViewState createState() => _AgendamentoDetailsViewState();
}

class _AgendamentoDetailsViewState extends State<AgendamentoDetailsView> {
  // final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controllerAge = new AgendamentoController(store);
    var size = MediaQuery.of(context).size;

    return Scaffold(
      // key: _scaffoldKey,
      appBar: AppBar(
        // iconTheme: IconThemeData(
        // color: primaryColor,
        // ),
        // automaticallyImplyLeading: false,
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        title: Text(
          "Detalhes do Agendamento",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            // color: primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Center(
          child: LayoutBuilder(
            builder: (_, constraints) {
              return ListView(
                children: <Widget>[
//----------------------------------------------------- Detalhes do Cliente
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 10,
                      bottom: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          // width: constraints.maxWidth,
                          // height: constraints.maxHeight,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black26,
                                offset: new Offset(1, 2.0),
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                // color: textColor.withOpacity(0.05),
                                // width: double.infinity,
                                child: Center(
                                  child: new Text(
                                    'Dados do Cliente',
                                    style: new TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    widget
                                        .agendamentoModel.agendamentoClientNome,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.work,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                        .agendamentoClientEmpresa,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.mail,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                        .agendamentoClientEmail,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.phone,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                        .agendamentoClientPhone,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: widget.agendamentoModel
                                                .agendamentoConcluido ==
                                            true
                                        ? Icon(
                                            Icons.check_circle,
                                            color: accentColor,
                                            // size:
                                            //     constraints.maxWidth * 0.04,
                                          )
                                        : Icon(Icons.cancel, color: Colors.red),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                                .agendamentoConcluido ==
                                            false
                                        ? "Cliente Bloqueado"
                                        : "Cliente Ativo",
                                    style: widget.agendamentoModel
                                                .agendamentoConcluido ==
                                            true
                                        ? TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.045,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                          )
                                        : TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.045,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.red,
                                          ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.warning,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.agendamentoModel.agendamentoOBS,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.045,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
//----------------------------------------------------- Dados do Agendamento
                  Container(
                    padding: EdgeInsets.only(
                      top: 5,
                      left: 10,
                      right: 10,
                      bottom: 5,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          // width: constraints.maxWidth,
                          // height: constraints.maxHeight,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black26,
                                offset: new Offset(1, 2.0),
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                // color: textColor.withOpacity(0.05),
                                // width: double.infinity,
                                child: Center(
                                  child: new Text(
                                    'Dados do Agendamento',
                                    style: new TextStyle(
                                      fontSize: constraints.maxWidth * 0.04,
                                      fontWeight: FontWeight.w700,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.calendar_today
                                        // size: constraints.maxWidth * 0.04,
                                        ),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                        .agendamentoDataAgendada,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.watch_later,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                        .agendamentoHoraAgendada,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.person_pin,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Text(
                                    widget.agendamentoModel.agendamentoAgente,
                                    style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.045,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: widget.agendamentoModel
                                                .agendamentoRemoto ==
                                            true
                                        ? Icon(
                                            Icons.videocam,
                                            color: primaryColor,
                                          )
                                        : Icon(
                                            Icons.videocam_off,
                                          ),
                                  ),
                                  Text(
                                    widget.agendamentoModel.agendamentoRemoto ==
                                            true
                                        ? "Atendimento Remoto"
                                        : "Atendimento Presencial",
                                    style: widget.agendamentoModel
                                                .agendamentoRemoto ==
                                            true
                                        ? TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.045,
                                            fontWeight: FontWeight.w500,
                                            color: primaryColor,
                                          )
                                        : TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.045,
                                            fontWeight: FontWeight.w500,
                                          ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: widget.agendamentoModel
                                                .agendamentoConcluido ==
                                            true
                                        ? Icon(
                                            Icons.check_circle,
                                            color: accentColor,
                                          )
                                        : widget.agendamentoModel
                                                    .agendamentoCancelado ==
                                                true
                                            ? Icon(
                                                Icons.cancel,
                                                color: Colors.red,
                                              )
                                            : Icon(
                                                Icons.remove_circle,
                                              ),
                                  ),
                                  Text(
                                    widget.agendamentoModel
                                                .agendamentoConcluido ==
                                            true
                                        ? "Atendimento realizado"
                                        : widget.agendamentoModel
                                                    .agendamentoCancelado ==
                                                true
                                            ? "Atendimento Cancelado"
                                            : "Atendimento Pendente",
                                    style: widget.agendamentoModel
                                                .agendamentoConcluido ==
                                            true
                                        ? TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.045,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.green,
                                          )
                                        : widget.agendamentoModel
                                                    .agendamentoCancelado ==
                                                true
                                            ? TextStyle(
                                                fontSize: constraints.maxWidth *
                                                    0.045,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.red,
                                              )
                                            : TextStyle(
                                                fontSize: constraints.maxWidth *
                                                    0.045,
                                                fontWeight: FontWeight.w500,
                                              ),
                                  ),
                                ],
                              ),
                              //----------------------------------------------------- Observações do Agendamento
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.speaker_notes,
                                      // size: constraints.maxWidth * 0.04,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      widget.agendamentoModel.agendamentoOBS,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.045,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      // ),
      // ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onLongPress: () {
                controllerAge.remove(widget.agendamentoModel);
                Navigator.of(context).pop();
              },
              onPressed: () {
                // showAlertDialog();
              },
              color: Theme.of(context).primaryColor,
              shape: CircleBorder(
                side: BorderSide.none,
              ),
              child: Icon(
                Icons.delete_forever,
                color: Colors.red,
                // size: constraints.maxWidth * 0.06,
              ),
            ),
            FlatButton(
              onPressed: () {
                launch(
                    "tel://${widget.agendamentoModel.agendamentoClientPhone}");
              },
              color: Theme.of(context).primaryColor,
              shape: CircleBorder(
                side: BorderSide.none,
              ),
              child: Icon(
                Icons.phone,
                color: Colors.white,
                // size: constraints.maxWidth * 0.05,
              ),
            ),
            FlatButton(
              onPressed: () {
                launch(
                    "mailto://${widget.agendamentoModel.agendamentoClientEmail}");
              },
              color: Theme.of(context).primaryColor,
              shape: CircleBorder(
                side: BorderSide.none,
              ),
              child: Icon(
                Icons.email,
                color: Colors.white,
                // size: constraints.maxWidth * 0.05,
              ),
            ),
            FlatButton(
              onPressed: () => navegarParaEditor(
                  context, widget.agendamentoModel, ClienteModel()),
              color: Theme.of(context).primaryColor,
              shape: CircleBorder(
                side: BorderSide.none,
              ),
              child: Icon(
                Icons.edit,
                color: Colors.white,
                // size: constraints.maxWidth * 0.05,
              ),
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: primaryColor,
      ),
    );
  }

  void navegarParaEditor(BuildContext context,
      AgendamentoModel agendamentoModel, ClienteModel clienteModel) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClienteEditor(agendamentoModel),
      ),
    );
  }
}
