import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(16),
      child: ListView(children:  [
        const TextField(),
        const SizedBox(height: 16,),
        ElevatedButton.icon(onPressed: () {}, 
        icon: Icon(Icons.search), label: Text('Pesquisar')),
        SizedBox(height: 16,),
        Text('Foram encontrado X livros sobre X: ',
        style: Theme.of(context).textTheme.headlineMedium,),

      ],)),
    );
  }
}