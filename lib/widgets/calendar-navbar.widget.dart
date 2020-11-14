import 'package:contatos/android/styles.android.dart';
import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/store/app.store.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CalendarNavbar extends StatelessWidget {
  // DateTime _selectedValue = DateTime.now();
  var date;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);
    final _dateFormat = new DateFormat('dd-MM-yyyy');

    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: DatePicker(
            DateTime.now(),
            // width: 60,
            height: 90,
            locale: "pt_BR",
            initialSelectedDate: DateTime.now(),
            selectionColor: primaryColor,
            selectedTextColor: backgroundColor,
            // width: 50,
            // inactiveDates: [
            // DateTime.now().add(Duration(days: 3)),
            // DateTime.now().add(Duration(days: 4)),
            // DateTime.now().add(Duration(days: 7))
            // ],
            onDateChange: (selectedDate) {
              controller.changeSelection(_dateFormat.format(selectedDate));
              // controller.getTodayHorario(_dateFormat.format(selectedDate));
            },
            // onDateChange: (selectedDate) => date,
            // controller.getTodayHorario(date, user.name)
            // onDateChange: (date) {
            //   setState(
            //     () {
            //       _selectedValue = date;
            //     },
            //   );
            // },
          ),
        ),
      ],
    ));
  }
}
