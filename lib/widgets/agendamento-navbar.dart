import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/themes/light.theme.dart';
import 'package:contatos/store/app.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AgendamentoNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);

    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          // Observer(
          //   builder: (_) => FlatButton(
          //     child: Container(
          //       child: Text(
          //         "Hoje",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: store.currentState == "Today"
          //               ? FontWeight.w600
          //               : FontWeight.w300,
          //           color: store.currentState == "Today"
          //               ? primaryColor
          //               : textColor,
          //         ),
          //       ),
          //     ),
          //     onPressed: user.name == ''
          //         ? _showMyDialog
          //         : () {
          //             controller.changeSelection("Today");
          //           },
          //   ),
          // ),
          // Observer(
          //   builder: (_) => FlatButton(
          //     child: Container(
          //       child: Text(
          //         "Amanhã",
          //         style: TextStyle(
          //           fontSize: 20,
          //           fontWeight: store.currentState == "Tomorrow"
          //               ? FontWeight.w600
          //               : FontWeight.w300,
          //           color: store.currentState == "Tomorrow"
          //               ? primaryColor
          //               : textColor,
          //         ),
          //       ),
          //     ),
          //     onPressed: user.name == ''
          //         ? _showMyDialog
          //         : () {
          //             controller.changeSelection("Tomorrow");
          //           },
          //   ),
          // ),
          Observer(
            builder: (_) => FlatButton(
              child: Container(
                child: Text(
                  "Todos",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: store.currentState == "All"
                        ? FontWeight.w600
                        : FontWeight.w300,
                    color:
                        store.currentState == "All" ? primaryColor : textColor,
                  ),
                ),
              ),
              onPressed: () {
                controller.changeSelection("All");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Atendidos",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.currentState == "Done"
                      ? FontWeight.w600
                      : FontWeight.w300,
                  color:
                      store.currentState == "Done" ? primaryColor : textColor,
                ),
              ),
              onPressed: () {
                controller.changeSelection("Done");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Cancelados",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.currentState == "Cancel"
                      ? FontWeight.w600
                      : FontWeight.w300,
                  color:
                      store.currentState == "Cancel" ? primaryColor : textColor,
                ),
              ),
              onPressed: () {
                controller.changeSelection("Cancel");
              },
            ),
          ),
          // Observer(
          //   builder: (_) => FlatButton(
          //     child: Text(
          //       "Expirados",
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: store.currentState == "Expired"
          //             ? FontWeight.w600
          //             : FontWeight.w300,
          //         color: store.currentState == "Expired"
          //             ? primaryColor
          //             : textColor,
          //       ),
          //     ),
          //     onPressed: () {
          //       controller.changeSelection("Expired");
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
