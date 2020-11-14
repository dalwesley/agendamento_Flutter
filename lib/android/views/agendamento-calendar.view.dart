import 'package:contatos/android/styles.android.dart';
import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/store/app.store.dart';
import 'package:contatos/widgets/calendar-list.widget.dart';
import 'package:contatos/widgets/calendar-navbar.widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AgendamentoCalendarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);
    var date = new DateTime.now();
    final _dateFormat = new DateFormat('dd-MM-yyyy');

    // Só ocorre na primeira vez que o App rodar
    // if (store.currentState == "none") {
    controller.changeSelection(_dateFormat.format(date));
    // }
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Column(
      //     children: <Widget>[
      //       AgendamentoNavbar()
      //       // Text("@ Agendamentos"),
      //       // Text(
      //       //   user.name + ' - ' + _dateFormat.format(date),
      //       //   style: TextStyle(fontSize: 15),
      //       // )
      //     ],
      //   ),
      //   centerTitle: true,
      // ),
      body: Column(
        children: <Widget>[
          SafeArea(child: CalendarNavbar()),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/@_Logo_Branco_Transp.png',
                  ),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: CalendarList(),
            ),
          ),
        ],
      ),
    );
  }
}
