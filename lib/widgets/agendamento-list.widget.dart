import 'package:contatos/android/views/agendamento.details.view.dart';
import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/themes/light.theme.dart';
import 'package:contatos/model/agendamento.model.dart';
import 'package:contatos/store/app.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../user.dart';
import 'busy.widget.dart';

class AgendamentoList extends StatefulWidget {
  var date = new DateTime.now();
  // final _dateFormat = new DateFormat('dd/MM/yyyy');

  @override
  _AgendamentoListState createState() => _AgendamentoListState();
}

class _AgendamentoListState extends State<AgendamentoList> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);
    var size = MediaQuery.of(context).size;

    final snackBar = SnackBar(
      content: Text('Algo errado não deu certo...!'),
      action: SnackBarAction(
        label: 'Desfazer',
        onPressed: () {
          // Código para desfazer a ação!
        },
      ),
    );

    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Container(
            width: size.width,
            height: size.height * .73,
            child: Observer(
              builder: (_) => TDBusy(
                busy: store.busy,
                child: store.agendamentos.length == 0
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Center(
                              child:
                                  // Text(
                                  (() {
                                if (store.currentState == 'Today') {
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        user.name + ',',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Não encontramos nada...",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: textColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (store.currentState == 'Tomorrow') {
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        user.name + ',',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "nada para amanhã?!",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (store.currentState == 'All') {
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        user.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "Onde estão todos?!",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (store.currentState == 'Done') {
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        user.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "nenhum atendido...",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "Isso é ruim!",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (store.currentState == 'Cancel') {
                                  return Column(
                                    children: <Widget>[
                                      Text(
                                        user.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "sem cancelamentos...",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                      Text(
                                        "Isso é bom!",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Column(
                                    children: <Widget>[
                                      Icon(Icons.arrow_upward),
                                      Text(
                                        "Selecione uma opção do menu...",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  );
                                }
                              })(),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: store.agendamentos.length,
                        itemBuilder: (context, index) {
                          var todo = store.agendamentos[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              left: 10,
                              right: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                color: todo.agendamentoCancelado == true
                                    ? Colors.red[50]
                                    : todo.agendamentoConcluido == true
                                        ? backgroundColor
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black26,
                                    offset: new Offset(1, 2.0),
                                    blurRadius: 1,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Dismissible(
                                key: Key(todo.agendamentoId.toString()),
                                child: ListTile(
                                  leading: todo.agendamentoCancelado == true
                                      ? CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.cancel,
                                            size: 35,
                                            // color: Colors.red[50],
                                          ),
                                          foregroundColor: Colors.red[50],
                                        )
                                      : todo.agendamentoConcluido == true
                                          ? CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.check_circle,
                                                  size: 35),
                                              foregroundColor: backgroundColor)
                                          : CircleAvatar(
                                              backgroundColor: accentColor,
                                              child: Text(
                                                todo.agendamentoClientNome[0],
                                                style: TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.055,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              foregroundColor: Colors.white,
                                            ),
                                  title: Text(
                                    todo.agendamentoClientNome,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: todo.agendamentoConcluido == true
                                        ? TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.04,
                                            fontWeight: FontWeight.w400,
                                          )
                                        : todo.agendamentoCancelado == true
                                            ? TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.04,
                                                fontWeight: FontWeight.w400,
                                              )
                                            : TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.04,
                                                fontWeight: FontWeight.w600,
                                              ),
                                  ),
                                  subtitle: Text(
                                    todo.agendamentoClientEmpresa,
                                    overflow: TextOverflow.fade,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: todo.agendamentoConcluido == true
                                        ? TextStyle(
                                            fontSize:
                                                constraints.maxWidth * 0.03,
                                            fontWeight: FontWeight.w400,
                                          )
                                        : todo.agendamentoCancelado == true
                                            ? TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.03,
                                                fontWeight: FontWeight.w400,
                                              )
                                            : TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.03,
                                                fontWeight: FontWeight.w600,
                                              ),
                                  ),
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        todo.agendamentoDataAgendada.toString(),
                                        style: todo.agendamentoConcluido == true
                                            ? TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.03,
                                                fontWeight: FontWeight.w300,
                                              )
                                            : todo.agendamentoCancelado == true
                                                ? TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.03,
                                                    fontWeight: FontWeight.w300,
                                                  )
                                                : TextStyle(
                                                    fontSize:
                                                        constraints.maxWidth *
                                                            0.03,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                      ),
                                      Flexible(
                                        child: Text(
                                          todo.agendamentoHoraAgendada
                                              .toString(),
                                          style: todo.agendamentoConcluido ==
                                                  true
                                              ? TextStyle(
                                                  fontSize:
                                                      constraints.maxWidth *
                                                          0.03,
                                                  fontWeight: FontWeight.w300,
                                                )
                                              : todo.agendamentoCancelado ==
                                                      true
                                                  ? TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.03,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    )
                                                  : TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.03,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // isThreeLine: true,
                                  onTap: () => navegarParaCliente(
                                    context,
                                    store.agendamentos[index],
                                  ),
                                  // enabled: false,
                                ),
                                onDismissed: todo.agendamentoConcluido ==
                                            true &&
                                        todo.agendamentoCancelado == false
                                    ? (direction) {
                                        if (direction ==
                                            DismissDirection.endToStart) {
                                          controller.markAsDone(todo).then(
                                            (data) {
                                              Navigator.of(context)
                                                  .pop(); //excepition aqui
                                            },
                                          ).catchError(
                                            (err) {
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                          );
                                        } else {
                                          controller.markAsDone(todo).then(
                                            (data) {
                                              Navigator.of(context)
                                                  .pop(); //excepition aqui
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                          ).catchError(
                                            (err) {
                                              Scaffold.of(context)
                                                  .showSnackBar(snackBar);
                                            },
                                          );
                                        }
                                      }
                                    : todo.agendamentoCancelado == true &&
                                            todo.agendamentoConcluido == false
                                        ? (direction) {
                                            if (direction ==
                                                DismissDirection.endToStart) {
                                              controller.cancel(todo).then(
                                                (data) {
                                                  Navigator.of(context)
                                                      .pop(); //excepition aqui
                                                },
                                              ).catchError(
                                                (err) {
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              );
                                            } else {
                                              controller.cancel(todo).then(
                                                (data) {
                                                  Navigator.of(context)
                                                      .pop(); //excepition aqui
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              ).catchError(
                                                (err) {
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              );
                                            }
                                          }
                                        : (direction) {
                                            if (direction ==
                                                DismissDirection.endToStart) {
                                              controller.markAsDone(todo).then(
                                                (data) {
                                                  Navigator.of(context)
                                                      .pop(); //excepition aqui
                                                },
                                              ).catchError(
                                                (err) {
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              );
                                            } else {
                                              controller.cancel(todo).then(
                                                (data) {
                                                  Navigator.of(context)
                                                      .pop(); //excepition aqui
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              ).catchError(
                                                (err) {
                                                  Scaffold.of(context)
                                                      .showSnackBar(snackBar);
                                                },
                                              );
                                            }
                                          },
                                background: Container(
                                  //excepition aqui
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: todo.agendamentoConcluido ==
                                                  true &&
                                              todo.agendamentoCancelado == false
                                          ? <Widget>[
                                              Icon(Icons.cached),
                                              Text("Desfazer Atendimento"),
                                            ]
                                          : todo.agendamentoCancelado == true &&
                                                  todo.agendamentoConcluido ==
                                                      false
                                              ? <Widget>[
                                                  Icon(Icons.cached),
                                                  Text("Desfazer Cancelamento"),
                                                ]
                                              : <Widget>[
                                                  Icon(Icons.cancel),
                                                  Text("Cancelar Atendimento"),
                                                ],
                                    ),
                                  ),
                                  color: todo.agendamentoConcluido == true &&
                                          todo.agendamentoCancelado == false
                                      ? Colors.blue.withOpacity(0.3)
                                      : todo.agendamentoCancelado == true &&
                                              todo.agendamentoConcluido == false
                                          ? Colors.red.withOpacity(0.3)
                                          : Colors.red.withOpacity(0.3),
                                ),
                                secondaryBackground: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: todo.agendamentoConcluido ==
                                                  true &&
                                              todo.agendamentoCancelado == false
                                          ? <Widget>[
                                              Text("Desfazer Atendimento"),
                                              Icon(Icons.cached),
                                            ]
                                          : todo.agendamentoCancelado == true &&
                                                  todo.agendamentoConcluido ==
                                                      false
                                              ? <Widget>[
                                                  Text("Desfazer Cancelamento"),
                                                  Icon(Icons.cached),
                                                ]
                                              : <Widget>[
                                                  Text("Finalizar atendido"),
                                                  Icon(Icons.check),
                                                ],
                                    ),
                                  ),
                                  color: todo.agendamentoConcluido == true &&
                                          todo.agendamentoCancelado == false
                                      ? Colors.blue.withOpacity(0.3)
                                      : todo.agendamentoCancelado == true &&
                                              todo.agendamentoConcluido == false
                                          ? Colors.red.withOpacity(0.3)
                                          : Colors.blue.withOpacity(0.3),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          );
        },
      ),
      //   ],
      // ),
    );
  }

  void navegarParaCliente(
      BuildContext context, AgendamentoModel agendamentoModel) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgendamentoDetailsView(agendamentoModel),
      ),
    );
  }
}
