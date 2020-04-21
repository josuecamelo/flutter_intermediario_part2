import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blueButton.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context)
    );
  }

  _body(context) {
    return Center(
      child: BlueButton(
        "Voltar",
        onPressed: () => _onClickVoltar(context),
      ),
    );
  }

  void _onClickVoltar(BuildContext context) {
    pop(context, "Tela 2");
  }
}
