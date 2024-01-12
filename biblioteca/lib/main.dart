import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(){
  runApp(BookApp());
}

class BookApp extends StatelessWidget{
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
   return const MaterialApp(
    home: HomePage(),

   );
  }

}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State {
  final _controller = TextEditingController();
  var titulo = '';
  var itemCount = 0;
  

  void _buscarLivros() async {
      titulo = _controller.text ;
      final url = Uri.https(
      'www.googleapis.com',
      '/books/v1/volumes',
      {'q': '{$titulo}'},
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);
      itemCount = jsonResponse['totalItems'];
      print('Number of books about $titulo: $itemCount.');
      setState(() {});
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: ListView(children:  [
         TextField(
         controller: _controller,
        ),
        SizedBox(height: 16,),
        ElevatedButton.icon(onPressed: _buscarLivros, 
        icon: Icon(Icons.search), label: Text('Pesquisar')),
        SizedBox(height: 16,), 
        Text('Foram encontrado $itemCount livros sobre $titulo: ',
        style: Theme.of(context).textTheme.headlineMedium,),

      ],)),
    );
  }
}