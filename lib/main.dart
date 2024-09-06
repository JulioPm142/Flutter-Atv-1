// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Forms(),
        '/Menu': (context) => Menu(),
        '/Informacao': (context) => Informacao(),
        '/Item1': (context) => Item1(),
      },
    );
  }
}

class Forms extends StatefulWidget {
  @override
  FormsState createState() => FormsState();
}

class FormsState extends State<Forms> {
  final TextEditingController _nome = TextEditingController();
  final TextEditingController _senha = TextEditingController();

  final TextEditingController _count2 = TextEditingController();

  Color textColor = Colors.black;
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;

  String _result = "";
  bool envio = false;

  void _enviar() {
    String nome = _nome.text;
    String senha = _senha.text;

    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    setState(() {
      if (nome == "" || senha == "") {
        changeTextColor(Colors.red);

        _result = "Campo obrigatório";

        changeBorderColor(Colors.red);
      } else {
        changeEnvio(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
        _result = nome + senha;
        Navigator.pushReplacementNamed(context, '/Menu',
            arguments: {'nome': nome});
      }
    });
  }

  void _cancelar() {
    _nome.text = "";
    String nome = _nome.text;

    _senha.text = "";
    String senha = _senha.text;

    setState(() {
      _result = nome + senha;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realize o Login'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              'https://imgs.search.brave.com/uTsc9rlCOEVXWvyQWSonDEHGwdDlwSvist-AS5OyMWM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zbWFs/bGltZy5wbmdrZXku/Y29tL3BuZy9zbWFs/bC8yMDEtMjAxMDA5/OF9wZW5ndWluLXJh/bmRvbS1ob3VzZS1s/b2dvLXBuZy1wZW5n/dWluLWJvb2tzLWxv/Z28ucG5n',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Entrar',
              style: TextStyle(fontSize: 24.0, color: Colors.blue),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: _nome,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Entre com nome',
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            SizedBox(
                width: 300,
                child: TextField(
                  controller: _senha,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Entre com senha',
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                )),
            !envio
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: _enviar,
                          child: const Text('Entrar'),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class Menu extends StatelessWidget {
  _itemNavigator(contx, pagina, nome) {
    Navigator.pushReplacementNamed(
      contx,
      '/Item1',
      arguments: {'item': '$pagina', 'nome': nome},
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final usuario = arguments?['nome'] ?? 'convidado';

    return Scaffold(
      appBar: AppBar(title: Text('Bem-vindo ao Menu $usuario')),
      body: Center(
          child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _itemNavigator(context, "Item1", usuario);
                    },
                    child: const Text('Item1'),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _itemNavigator(context, "Item2", usuario);
                      ;
                    },
                    child: const Text('Item2'),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _itemNavigator(context, "Item3", usuario);
                      ;
                    },
                    child: const Text('Item3'),
                  ),
                  SizedBox(
                    width: 100,
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: const Text('Voltar ao Login'),
                  ),
                ],
              ))),
    );
  }
}



class Item1 extends StatefulWidget {
  @override
  _Item1State createState() => _Item1State();
}

class _Item1State extends State<Item1> {
  final TextEditingController _count1 = TextEditingController();
  final TextEditingController _nome = TextEditingController();
  String _result = "";
  bool envio = false;
  Color textColor = Colors.black;
  Color textColorWarning = Colors.grey;
  Color borderColor = Colors.grey;

  void _cancelar() {
    _nome.text = "";
    String nome = _nome.text;

    setState(() {
      _result = nome;
    });

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    Navigator.pushReplacementNamed(context, '/Menu');
  }

  void _enviar() {
    String nome = _nome.text;

    void changeTextColor(Color newColor) {
      setState(() {
        textColor = newColor;
      });
    }

    void changeBorderColor(Color newColor) {
      setState(() {
        borderColor = newColor;
      });
    }

    void changeEnvio(bool e) {
      setState(() {
        envio = e;
      });
    }

    setState(() {
      if (nome == "") {
        changeTextColor(Colors.red);

        _result = "Campo obrigatório";

        changeBorderColor(Colors.red);
      } else {
        changeEnvio(true);
        changeTextColor(Colors.blue);
        changeBorderColor(Colors.grey);
        _result = nome;
        Navigator.pushReplacementNamed(context, '/Menu');
      }
    });
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final item = arguments?['item'] ?? 'sem item';
    final usuario = arguments?['nome'] ?? 'convidade';

    Navigator.pushReplacementNamed(
      context,
      '/Informacao',
      arguments: {
        'item': item,
        'quant': _count1.text,
        'nome':usuario
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final item = arguments?['item'] ?? 'sem item';
    final usuario = arguments?['nome'] ?? 'convidado';

    return Scaffold(
      appBar: AppBar(title: Text('Logado como $usuario')),
      body: Center(
        child: Column(children: [
          Text(
            'Informações do pedido',
            style: TextStyle(fontSize: 24.0, color: Colors.blue),
          ),
          SizedBox(
            width: 300,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              decoration: BoxDecoration(
                border:
                    Border.all(color: const Color.fromARGB(255, 18, 39, 195)),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.shop, color: Colors.grey),
                  SizedBox(width: 8.0),
                  Text(
                    '$item: ',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
              width: 300,
              child: TextField(
                controller: _count1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Quantidade do item',
                  prefixIcon: const Icon(Icons.account_circle_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
              )),
          SizedBox(width: 100),
          SizedBox(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _cancelar,
                    child: const Text('Cancelar'),
                  ),
                  ElevatedButton(
                    onPressed: _enviar,
                    child: const Text('confirmar'),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}


class Informacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final pedido = arguments?['item'] ?? 'sem item';
    final quantidade = arguments?['quant'] ?? 'sem quantidade';
    final usuario = arguments?['nome'] ?? 'convidado';

    return Scaffold(
      appBar: AppBar(title: Text('$usuario Seu pedido foi confirmado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://imgs.search.brave.com/uTsc9rlCOEVXWvyQWSonDEHGwdDlwSvist-AS5OyMWM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9zbWFs/bGltZy5wbmdrZXku/Y29tL3BuZy9zbWFs/bC8yMDEtMjAxMDA5/OF9wZW5ndWluLXJh/bmRvbS1ob3VzZS1s/b2dvLXBuZy1wZW5n/dWluLWJvb2tzLWxv/Z28ucG5n',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 50),
            Text(
              'Pedido Confirmado !',
              style: TextStyle(fontSize: 26, color: Colors.red),
            ),
            Text(
              '$quantidade unidades do $pedido foram aceitas',
              style: TextStyle(fontSize: 26, color: Colors.red),
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/Menu', arguments: {'nome':usuario});
              },
              child: const Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
