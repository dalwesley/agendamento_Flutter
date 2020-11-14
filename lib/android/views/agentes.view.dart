import 'package:contatos/controller/agendamento.controller.dart';
import 'package:contatos/store/app.store.dart';
import 'package:contatos/themes/light.theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../user.dart';

class AgentesView extends StatefulWidget {
  @override
  _AgentesViewState createState() => _AgentesViewState();
}

class _AgentesViewState extends State<AgentesView> {
  Color textColor1 = textColor;
  Color textColor2 = textColor;
  Color textColor3 = textColor;
  Color cardColor1 = Colors.white;
  Color cardColor2 = Colors.white;
  Color cardColor3 = Colors.white;
  Icon iconAgente1 = Icon(FontAwesomeIcons.meh, size: 35);
  Icon iconAgente2 = Icon(FontAwesomeIcons.meh, size: 35);
  Icon iconAgente3 = Icon(FontAwesomeIcons.meh, size: 35);

  @override
  Widget build(BuildContext context) {
    var date = new DateTime.now();
    final _dateFormat = new DateFormat('dd-MM-yyyy');

    var size = MediaQuery.of(context).size;
    final store = Provider.of<AppStore>(context);
    final controller = new AgendamentoController(store);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          "@ Agentes",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/@_Logo_Branco_Transp.png',
            ),
            fit: BoxFit.fitWidth,
            // colorFilter: new ColorFilter.mode(
            //     Colors.white.withOpacity(0.2), BlendMode.dstATop),
          ),
          // gradient: LinearGradient(
          //   begin: Alignment.centerLeft,
          //   end: Alignment.centerRight,
          //   stops: [0.3, 1],
          //   colors: [Colors.green[200], backgroundColor],
          // ),
        ),
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//--------------------------------------------------------- agente 1
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor1,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(1, 2.0),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: iconAgente1,
                    foregroundColor: primaryColor,
                  ),
                  title: Text(
                    "cccc",
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "@.com.br",
                    style: TextStyle(
                      // fontSize: 25,
                      color: textColor1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // trailing: Icon(Icons.more_vert),
                ),
              ),
              onTap: () {
                user.name = "cccc";
                user.email = "@.com.br";
                controller.changeSelection(_dateFormat.format(date));
                selectionAgente(user.name);
              },
            ),
            SizedBox(height: 10),

//--------------------------------------------------------- agente 2
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor2,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(1, 2.0),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: backgroundColor,
                    child: iconAgente2,
                    foregroundColor: primaryColor,
                  ),
                  title: Text(
                    "bbbb",
                    style: TextStyle(
                      fontSize: 25,
                      color: textColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Text(
                    "@.com.br",
                    style: TextStyle(
                      // fontSize: 25,
                      color: textColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // trailing: Icon(Icons.more_vert),
                ),
              ),
              onTap: () {
                user.name = "bbbb";
                user.email = "@.com.br";
                controller.changeSelection(_dateFormat.format(date));
                selectionAgente(user.name);
              },
            ),
            SizedBox(height: 10),
//--------------------------------------------------------- agente 3
            GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                  color: cardColor3,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.black26,
                      offset: new Offset(1, 2.0),
                      blurRadius: 3,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: backgroundColor,
                      child: iconAgente3,
                      foregroundColor: primaryColor,
                    ),
                    title: Text(
                      "aaaa",
                      style: TextStyle(
                        fontSize: 25,
                        color: textColor3,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "@.com.br",
                      style: TextStyle(
                        // fontSize: 25,
                        color: textColor3,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                    // trailing: Icon(Icons.more_vert),
                    ),
              ),
              onTap: () {
                user.name = "aaaaa";
                user.email = "@.com.br";
                controller.changeSelection(_dateFormat.format(date));
                selectionAgente(user.name);
              },
            ),
          ],
        ),
      ),
    );
  }

  void selectionAgente(agente) {
    setState(
      () {
        if (user.name == "@ @") {
          textColor1 = backgroundColor;
          textColor2 = textColor;
          textColor3 = textColor;
          cardColor1 = primaryColor;
          cardColor2 = Colors.white;
          cardColor3 = Colors.white;
          iconAgente1 = Icon(FontAwesomeIcons.grinAlt, size: 35);
          iconAgente2 = Icon(FontAwesomeIcons.frownOpen, size: 35);
          iconAgente3 = Icon(FontAwesomeIcons.frownOpen, size: 35);
        } else if (user.name == "@") {
          textColor1 = textColor;
          textColor2 = backgroundColor;
          textColor3 = textColor;
          cardColor1 = Colors.white;
          cardColor2 = primaryColor;
          cardColor3 = Colors.white;
          iconAgente1 = Icon(FontAwesomeIcons.frownOpen, size: 35);
          iconAgente2 = Icon(FontAwesomeIcons.grinAlt, size: 35);
          iconAgente3 = Icon(FontAwesomeIcons.frownOpen, size: 35);
        } else if (user.name == "@") {
          textColor1 = textColor;
          textColor2 = textColor;
          textColor3 = backgroundColor;
          cardColor1 = Colors.white;
          cardColor2 = Colors.white;
          cardColor3 = primaryColor;
          iconAgente1 = Icon(FontAwesomeIcons.frownOpen, size: 35);
          iconAgente2 = Icon(FontAwesomeIcons.frownOpen, size: 35);
          iconAgente3 = Icon(FontAwesomeIcons.grinAlt, size: 35);
        } else {
          textColor1 = textColor;
          textColor2 = textColor;
          textColor3 = textColor;
          cardColor1 = Colors.white;
          cardColor2 = Colors.white;
          cardColor3 = Colors.white;
          iconAgente1 = Icon(FontAwesomeIcons.meh, size: 35);
          iconAgente2 = Icon(FontAwesomeIcons.meh, size: 35);
          iconAgente3 = Icon(FontAwesomeIcons.meh, size: 35);
        }
      },
    );
  }
}
