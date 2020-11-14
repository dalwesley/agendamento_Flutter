import 'package:contatos/android/styles.android.dart';
import 'package:contatos/android/views/agendamento-menus.view.dart';
import 'package:contatos/android/views/agendamento-calendar.view.dart';
import 'package:contatos/android/views/cliente-editor.view.dart';
import 'package:contatos/model/agendamento.model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: TabBarView(
        children: <Widget>[
          AgendamentoCalendarView(),
          AgendamentoMenusView(),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ClienteEditor(
                AgendamentoModel(),
              ),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 1.0,
      ),
      bottomNavigationBar: new TabBar(
        tabs: [
          Tab(
            icon: Icon(
              FontAwesomeIcons.calendar,
            ),
          ),
          Tab(
            icon: Icon(
              FontAwesomeIcons.list,
            ),
          ),
        ],
        labelColor: primaryColor,
        unselectedLabelColor: textColor,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: accentColor,
      ),
    );
  }
}
