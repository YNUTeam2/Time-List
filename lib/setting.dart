import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'themecolor.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<Color> colors = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.grey,
  ];
  List<Widget> themeColorswidgets = [];
  List<Widget> clockColorswidgets = [];

  void _setThemeColor(Color color) {
    Provider.of<ThemeColorModel>(context, listen: false)
        .changeThemeColor(color);
  }

  void _setClockColor(Color color) {
    Provider.of<ThemeColorModel>(context, listen: false)
        .changeClockColor(color);
  }

  @override
  void initState() {
    for (var element in colors) {
      themeColorswidgets.add(
        MaterialButton(
          minWidth: 50,
          onPressed: (() => _setThemeColor(element)),
          color: element,
        ),
      );
    }
    for (var element in colors) {
      clockColorswidgets.add(
        MaterialButton(
          minWidth: 50,
          onPressed: (() => _setClockColor(element)),
          color: element,
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var themeColor = context.watch<ThemeColorModel>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColor.themeColor,
        title: Row(children: [
          const Icon(Icons.settings),
          const SizedBox(width: 10),
          const Text('设置')
        ]),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: ListView(
          children: [
            ListTile(
              title: Text(
                '配色',
                style: TextStyle(fontSize: 20, color: themeColor.themeColor),
              ),
            ),
            Divider(
              height: 20,
              color: themeColor.themeColor,
            ),
            // DecoratedBox(
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade300,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.color_lens,
                    color: themeColor.themeColor,
                  ),
                  Text(
                    '主题配色',
                    style: TextStyle(color: themeColor.themeColor),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: themeColorswidgets,
                ),
              ),
            ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 10,
            ),
            // DecoratedBox(
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade300,
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.colorize,
                    color: themeColor.themeColor,
                  ),
                  Text(
                    '番茄钟配色',
                    style: TextStyle(color: themeColor.themeColor),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: clockColorswidgets,
                ),
              ),
            ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
