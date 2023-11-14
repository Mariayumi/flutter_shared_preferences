import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: FormApp(),
    );
  }
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Endereço'),
            ),
            TextField(
              controller: _numberController,
              decoration: InputDecoration(labelText: 'Número'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _complementController,
              decoration: InputDecoration(labelText: 'Complemento'),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(labelText: 'Cidade'),
            ),
            TextField(
              controller: _stateController,
              decoration: InputDecoration(labelText: 'Estado'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'E-mail'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _siteController,
              decoration: InputDecoration(labelText: 'Site'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _clearForm();
                  },
                  child: Text('Limpar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _saveForm();
                  },
                  child: Text('Salvar'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _recoverForm();
                  },
                  child: Text('Recuperar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _clearForm() {
    _nameController.clear();
    _addressController.clear();
    _numberController.clear();
    _complementController.clear();
    _cityController.clear();
    _stateController.clear();
    _emailController.clear();
    _siteController.clear();
  }

  void _saveForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setString('address', _addressController.text);
    prefs.setString('number', _numberController.text);
    prefs.setString('complement', _complementController.text);
    prefs.setString('city', _cityController.text);
    prefs.setString('state', _stateController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('site', _siteController.text);
  }

  void _recoverForm() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _nameController.text = prefs.getString('name') ?? '';
    _addressController.text = prefs.getString('address') ?? '';
    _numberController.text = prefs.getString('number') ?? '';
    _complementController.text = prefs.getString('complement') ?? '';
    _cityController.text = prefs.getString('city') ?? '';
    _stateController.text = prefs.getString('state') ?? '';
    _emailController.text = prefs.getString('email') ?? '';
    _siteController.text = prefs.getString('site') ?? '';
  }
}