import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'setting.dart';
import 'task.dart';
import 'taskinfo.dart';
import 'test.dart';
import 'themecolor.dart';

void main() {
  var tasks = TaskModel();
  tasks.addTask(Task.simple('Task1'));
  tasks.addTask(Task.all("完整的任务", Colors.blue, "更多", DateTime.now()));
  tasks.addTask(Task.simple('Task2'));
  tasks.addTask(Task.simple('Task3'));
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeColorModel()),
      ChangeNotifierProvider(create: ((context) => tasks)),
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
        'home': (context) => const MyHomePage(title: '任务清单'),
        'setting': (context) => const SettingPage(),
        'addtask': (context) => PageAdd(),
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
    var tasks = context.watch<TaskModel>();

    return Scaffold(
      appBar: AppBar(
        //导航栏
        title: Text(widget.title),
        actions: <Widget>[
          //导航栏右侧子菜单
          PopupMenuButton<String>(
              //这是点击弹出菜单的操作
              onSelected: (String value) {},
              //这是弹出菜单的建立，包含了两个子项
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: TextButton.icon(
                        label: Text('设置'),
                        icon: Icon(
                          Icons.settings,
                        ),
                        onPressed: () =>
                            Navigator.pushNamed(context, 'setting'),
                      ),
                    ),
                    PopupMenuItem(
                      child: TextButton.icon(
                          label: Text('关于'),
                          icon: Icon(
                            Icons.help_outline,
                          ),
                          onPressed: () => showAlertDialog(context)),
                    )
                  ])
        ],
      ),

      drawer: const MyDrawer(), //抽屉

      body: ListView.builder(
        itemCount: tasks.length(),
        itemBuilder: (BuildContext context, int index) {
          return OutlinedButton(
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return TaskInfoPage(index: index);
                    }),
                  ),
              child: Text(tasks.getByIndex(index).title));
        },
      ),
      floatingActionButton: FloatingActionButton(
        //悬浮按钮
        onPressed: () {
          Navigator.pushNamed(context, 'addtask');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 33, 150, 243)),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '菜单',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('任务清单'),
            onTap: () {
              Navigator.of(context).pushNamed("home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.alarm),
            title: const Text('番茄钟'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            onTap: () => Navigator.pushNamed(context, 'setting'),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('关于'),
            onTap: () {
              showAlertDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('关于'),
        content: const Text('本APP解释权归移动应用软件开发课程第二小组所有'),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('确定'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class PageAdd extends StatefulWidget {
  const PageAdd({Key? key}) : super(key: key);

  @override
  State<PageAdd> createState() => _PageAdd();
}

class _PageAdd extends State<PageAdd> {
  Task task = Task.simple('未命名');

  @override
  Widget build(BuildContext context) {
    var tasks = context.watch<TaskModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("任务添加页面"),
      ),
      body: Center(
        //child: Text(widget.data),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (v) {
                  setState(() {
                    task.title = v;
                  });
                },
                decoration: InputDecoration(
                    labelText: "请输入任务名称",
                    hintText: "请输入任务名称",
                    prefixIcon: Icon(Icons.description)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "请输入任务详情",
                  prefixIcon: Icon(Icons.assignment),
                  hintText: "请输入任务详情",
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                tasks.addTask(task);
                Navigator.pop(context);
              },
              child: Text('添加'),
            )
          ],
        ),
      ),
    );
  }
}
