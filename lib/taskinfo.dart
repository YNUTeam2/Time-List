import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class TaskInfoPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Task1",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "截止时间：2022年6月7日 12:13",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ]),
      ),
      body: TaskPage(),
    );
  }
}

class TaskPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyTaskPage();
  }
}

class MyTaskPage extends State<TaskPage> {
  @override
  Color colortochange = Colors.green; //页面主题颜色
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: colortochange, width: 5, style: BorderStyle.solid),
      ),
      child: ListView(padding: EdgeInsets.all(7), children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.description,
                  color: colortochange,
                  size: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  任务详情",
                    style: TextStyle(
                      fontSize: 18,
                      color: colortochange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "任务主要内容",
                labelStyle: TextStyle(
                  fontSize: 15,
                  color: colortochange,
                ),
                helperText: "写下您想要完成的任务吧",
                helperStyle: TextStyle(
                  color: colortochange,
                ),
                filled: true,
                fillColor: Colors.white70,
                border: OutlineInputBorder(),
              ),
              maxLines: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.color_lens_outlined,
                      color: colortochange,
                      size: 20,
                    ),
                    Text(
                      "  颜色 ",
                      style: TextStyle(
                        fontSize: 18,
                        color: colortochange,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      colortochange = Colors.blue;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text(
                    "B",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        colortochange = Colors.red;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: Text(
                      "R",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
                OutlinedButton(
                    onPressed: () {
                      setState(() {
                        colortochange = Colors.green;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: Text(
                      "G",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    )),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      colortochange = Colors.orange;
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  child: Text(
                    "O",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 20,
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.timelapse_outlined,
                  color: colortochange,
                  size: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  截止日期",
                    style: TextStyle(
                      fontSize: 18,
                      color: colortochange,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 40, height: 10),
                Icon(
                  Icons.alarm,
                  color: colortochange,
                  size: 25,
                ),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "2022年",
                      style: TextStyle(
                        fontSize: 16,
                        color: colortochange,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "6月",
                      style: TextStyle(
                        fontSize: 16,
                        color: colortochange,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "7日",
                      style: TextStyle(
                        fontSize: 16,
                        color: colortochange,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 35,
                  height: 1,
                ),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "12时",
                      style: TextStyle(
                        fontSize: 16,
                        color: colortochange,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "13分",
                      style: TextStyle(
                        fontSize: 16,
                        color: colortochange,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                Text(
                  "          --任务截止时间临近，您需要加油了哟",
                  style: TextStyle(
                    color: colortochange,
                    fontSize: 10,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.addchart_sharp,
                  color: colortochange,
                  size: 25,
                ),
                Text(
                  "  已用时长",
                  style: TextStyle(
                    fontSize: 18,
                    color: colortochange,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // 因为没找到Flutter官方包里的的番茄，然后网上找的的也不是很满意，我就先放的官方icon代替了。
                SizedBox(
                  width: 45,
                  height: 20,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: colortochange,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: colortochange,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: colortochange,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: colortochange,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: colortochange,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: colortochange,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: Colors.grey,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: Colors.grey,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: Colors.grey,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: Colors.grey,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.book,
                  size: 25,
                  color: colortochange,
                ),
                Text(
                  "  每日一句：",
                  style: TextStyle(
                    color: colortochange,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Text(
              "无可奈何花落去，似曾相识燕归来。",
              style: TextStyle(
                color: colortochange,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image(
                image: AssetImage("images/Cute.jpg"),
                width: 110,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
