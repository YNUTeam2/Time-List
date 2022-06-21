import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'setting.dart';
import 'task.dart';
import 'taskinfo.dart';
import 'test.dart';
import 'themecolor.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeColorModel()),
      ChangeNotifierProvider(create: ((context) => TaskModel())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeColor = context.watch<ThemeColorModel>();
    return MaterialApp(
      title: 'Time-List Demo',
      initialRoute: 'home',
      routes: {
        'home': (context) => const MyHomePage(title: 'Time-List Demo'),
        'setting': (context) => const SettingPage(),
        'taskinfo': (context) => TaskInfoPage(),
        'test': (context) => TestPage(),
      },
      theme: ThemeData(
        primarySwatch: themeColor.themeColor as MaterialColor,
      ),
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
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Divider(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'setting'),
                child: Text('Setting'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'taskinfo'),
                child: Text('Task Info'),
              ),
              Divider(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, 'test'),
                child: Text('test'
                    //    'Test' + ShareDataWidget.of(context)!.data.toString()),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
