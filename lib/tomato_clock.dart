import 'package:flutter/material.dart';
import 'package:duration_picker/duration_picker.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TomatoTimer extends StatefulWidget {
  const TomatoTimer({Key? key}) : super(key: key);

  @override
  State<TomatoTimer> createState() => _TomatoTimerState();
}

class _TomatoTimerState extends State<TomatoTimer> {
  List<Widget> buttons = [];
  CountDownController controller = CountDownController();
  Duration duration = Duration(seconds: 0);
  bool start = false;

  @override
  void initState() {
    buttons.addAll([
      IconButton(
          onPressed: () {
            setState(() {
              start = true;
              controller.start();
            });
          },
          icon: start ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
      IconButton(
        onPressed: () {
          setState(() {
            controller.restart(duration: duration.inSeconds);
            start = false;
          });
        },
        icon: Icon(Icons.close),
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [Icon(Icons.alarm), Text("番茄钟")],
        ),
      ),
      body: Center(
        child: start
            ? CircularCountDownTimer(
                // Countdown duration in Seconds.
                duration: duration.inSeconds,
                // Countdown initial elapsed Duration in Seconds.
                initialDuration: 0,
                // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                controller: controller,
                // Width of the Countdown Widget.
                width: MediaQuery.of(context).size.width / 2,
                // Height of the Countdown Widget.
                height: MediaQuery.of(context).size.height / 2,
                // Ring Color for Countdown Widget.
                ringColor: Colors.grey.shade300,
                // Ring Gradient for Countdown Widget.
                ringGradient: null,
                // Filling Color for Countdown Widget.
                fillColor: Colors.purpleAccent.shade100,
                // Filling Gradient for Countdown Widget.
                fillGradient: null,
                // Background Color for Countdown Widget.
                backgroundColor: Colors.purple[500],
                // Background Gradient for Countdown Widget.
                backgroundGradient: null,
                // Border Thickness of the Countdown Ring.
                strokeWidth: 20.0,
                // Begin and end contours with a flat edge and no extension.
                strokeCap: StrokeCap.round,
                // Text Style for Countdown Text.
                textStyle: TextStyle(
                    fontSize: 33.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                // Format for the Countdown Text.
                textFormat: CountdownTextFormat.S,
                // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                isReverse: true,
                // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                isReverseAnimation: true,
                // Handles visibility of the Countdown Text.
                isTimerTextShown: true,
                // Handles the timer start.
                autoStart: false,
                // This Callback will execute when the Countdown Starts.
                onStart: () {
                  setState(() {
                    start = true;
                  });
                },
                // This Callback will execute when the Countdown Ends.
                onComplete: () {
                  setState(() {
                    start = false;
                  });
                })
            : DurationPicker(
                duration: duration,
                onChange: (val) {
                  setState(() => duration = val);
                },
                snapToMins: 5.0,
              ),
      ),
      floatingActionButton: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: start
            ? buttons
            : [
                IconButton(
                    onPressed: () {
                      setState(() {
                        start = true;
                      });
                    },
                    icon: Icon(Icons.play_arrow)),
              ],
      ),
    );
  }
}
