import 'package:flutter/material.dart';
import 'package:untitled1/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'HOLO TOURISM'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: Image.asset("assets/logohastalqso.png"),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => super.widget));
              }),
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.format_list_bulleted),
              tooltip: 'Format List Bulleted',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a snackbar')));
              },
            ),
            IconButton(
              icon: const Icon(Icons.grid_view_sharp),
              tooltip: 'Grid View Sharp',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: const Text('Next page'),
                      ),
                      body: const Center(
                        child: Text(
                          'This is the next page',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                  },
                ));
              },
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(height: 60),
            Text.rich(TextSpan(
                text: "¿Aún no sube ninguna imagen?",
                style: TextStyle(fontWeight: FontWeight.bold))),
            Text.rich(TextSpan(
                text: "!Haga click en el signo '+' para iniciar!",
                style: TextStyle(fontWeight: FontWeight.bold)))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          HomeScreenDialogs().optionsDialogBox(context);
        },
        tooltip: 'Upload Image',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
