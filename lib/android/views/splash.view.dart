import 'package:contatos/android/views/tabs.view.dart';
import 'package:contatos/themes/light.theme.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '@ Agendamentos',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      // debugShowMaterialGrid: true,
      home: DefaultTabController(
        length: 2,
        child: TabsView(),
        // child: AcessoView(),
      ),
    );
  }
}
