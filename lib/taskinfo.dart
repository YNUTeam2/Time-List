import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_list/task.dart';

class TaskInfoPage extends StatefulWidget {
  const TaskInfoPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<TaskInfoPage> createState() => _TaskInfoPageState();
}

class _TaskInfoPageState extends State<TaskInfoPage> {
  @override
  Widget build(BuildContext context) {
    var task = context.watch<TaskModel>().getByIndex(widget.index);

    return Scaffold(
      appBar: AppBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            task.title,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            "截止时间" + (task.date == null ? "暂无" : ":" + task.date.toString()),
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
        ]),
      ),
      body: TaskPage(
        index: widget.index,
      ),
    );
  }
}

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<StatefulWidget> createState() {
    return MyTaskPage();
  }
}

class MyTaskPage extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    var task = context.watch<TaskModel>().getByIndex(widget.index);

    return Container(
      decoration: BoxDecoration(
        border:
            Border.all(color: task.color, width: 5, style: BorderStyle.solid),
      ),
      child: ListView(padding: EdgeInsets.all(7), children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.description,
                  color: task.color,
                  size: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  任务详情",
                    style: TextStyle(
                      fontSize: 18,
                      color: task.color,
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
                  color: task.color,
                ),
                helperText: "写下您想要完成的任务吧",
                helperStyle: TextStyle(
                  color: task.color,
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
                      color: task.color,
                      size: 20,
                    ),
                    Text(
                      "  颜色 ",
                      style: TextStyle(
                        fontSize: 18,
                        color: task.color,
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      task.color = Colors.blue;
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
                        task.color = Colors.red;
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
                        task.color = Colors.green;
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
                      task.color = Colors.orange;
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
                  color: task.color,
                  size: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "  截止日期",
                    style: TextStyle(
                      fontSize: 18,
                      color: task.color,
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
                  color: task.color,
                  size: 25,
                ),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "2022年",
                      style: TextStyle(
                        fontSize: 16,
                        color: task.color,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "6月",
                      style: TextStyle(
                        fontSize: 16,
                        color: task.color,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "7日",
                      style: TextStyle(
                        fontSize: 16,
                        color: task.color,
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
                        color: task.color,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                TextButton(
                    onPressed: () => {},
                    child: Text(
                      "13分",
                      style: TextStyle(
                        fontSize: 16,
                        color: task.color,
                        fontStyle: FontStyle.italic,
                      ),
                    )),
                Text(
                  "          --任务截止时间临近，您需要加油了哟",
                  style: TextStyle(
                    color: task.color,
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
                  color: task.color,
                  size: 25,
                ),
                Text(
                  "  已用时长",
                  style: TextStyle(
                    fontSize: 18,
                    color: task.color,
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
                  color: task.color,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: task.color,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: task.color,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: task.color,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: task.color,
                  size: 30,
                ),
                Icon(
                  Icons.whatshot_sharp,
                  color: task.color,
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
                  color: task.color,
                ),
                Text(
                  "  每日一句：",
                  style: TextStyle(
                    color: task.color,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Text(
              "无可奈何花落去，似曾相识燕归来。",
              style: TextStyle(
                color: task.color,
                fontSize: 15,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
