import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qa_vero_mobileapp_api/bloc/listview_bloc/listview_bloc_Screen.dart';
import 'package:qa_vero_mobileapp_api/bloc/login_bloc/login_bloc_screen.dart';
import 'package:qa_vero_mobileapp_api/ui/facility_list.dart';
import 'package:qa_vero_mobileapp_api/ui/listview.dart';
import 'package:qa_vero_mobileapp_api/ui/login_screen.dart';


//
// void main() {
//   runApp(MyApp());
// }
void main() {
  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<LoginTaskBloc>(create: (context) => LoginTaskBloc()),
          BlocProvider<ListsBloc>(create: (context) => ListsBloc()),

        ],

        child: const MyApp(),
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
          onPressed: (){

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SmartPgxLogin()));

          },
          child: const Text(
            'Smart PGX',
            style: TextStyle(
              color: Colors.white,
          ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

