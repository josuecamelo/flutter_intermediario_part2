import 'package:aula01/drawer_list.dart';
import 'package:aula01/pages/hello_listview.dart';
import 'package:aula01/pages/hello_page2.dart';
import 'package:aula01/pages/hello_page3.dart';
import 'package:aula01/utils/nav.dart';
import 'package:aula01/widgets/blueButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          bottom: TabBar(tabs: <Widget>[
            Tab(text: "Tab 1",),
            Tab(text: "Tab 2",),
            Tab(text: "Tab 3",),
          ],),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(context),
            Container(
             color: Colors.green,
            ),
            Container(
              color: Colors.lightBlue,
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                _onClickFab();
              },
            ),
            /*SizedBox(
              width: 8,
              height: 8,
            ),
            FloatingActionButton(
              child: Icon(Icons.favorite),
              onPressed: () {
                _onClickFab();
              },
            )*/
          ],
        ),
        drawer:DrawerList()
      ),
    );
  }

  _body(context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  _buttons() {
    return Builder(builder: (BuildContext context) {
      return Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton(
                "ListView",
                onPressed: () => _onClickNavigator(context, HelloListView()),
              ),
              BlueButton("Page 2",
                  onPressed: () => _onClickNavigator(context, HelloPage2())),
              BlueButton("Page 3",
                  onPressed: () => _onClickNavigator(context, HelloPage3())),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BlueButton("Snack", onPressed: () => _onClickSnack(context)),
              BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
              BlueButton("Toast", onPressed: () => _onClickToast)
            ],
          )
        ],
      );
    });
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    //recebendo retorno do pop da pagina 2 e pagina 3
    String str = await push(context, page);

    print(">> $str ");
  }

  _onClickSnack(context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Olá Flutter"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "Ok",
        onPressed: () => {
          print("Ok do Snack")
        },
      ),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é muito legal"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  print("OK !!!");
                },
              )
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }

  _onClickFab() {
    print("Adicionar");
  }
}
