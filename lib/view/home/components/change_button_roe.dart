// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:get/get.dart';
import 'package:todo/view/home/components/rounded_button.dart';
import 'package:todo/view/home/components/today_button.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import '../../../res/constants.dart';
import 'change_icon.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ChangeButtonRow extends StatefulWidget {
  const ChangeButtonRow({super.key});

  @override
  State<ChangeButtonRow> createState() => _ChangeButtonRowState();
}

class _ChangeButtonRowState extends State<ChangeButtonRow> {
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var reached = now.compareTo(controller.alertTime) >= 0;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.06),
      child: Row(
        children: [
          const TodayButton(),
          const Spacer(),
          reached
              ? RoundedButton(
                  color: darkestBlue,
                  onTap: () {
                    controller.alertTime =
                        DateTime.now().add(const Duration(minutes: 1));
                    setState(() {});
                  },
                  child: const Text(
                    "Start CountDown!",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(24), // Set
                  ),
                  child: TimerCountdown(
                    format: CountDownTimerFormat.minutesSeconds,
                    endTime: controller.alertTime,
                    enableDescriptions: false,
                    spacerWidth: 10,
                    timeTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white),
                    colonsTextStyle: const TextStyle(
                        fontWeight: FontWeight.bold, color: lightOrange),
                    onEnd: () {
                      setState(() {});
                      showToast("hello styled toast", context: context);
                      showAlertDialog(context);
                    },
                  ),
                ),
          const Spacer(),
          InkWell(
              onTap: () => controller.onMoveBack(),
              child: const ChangeIconButton(
                  icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 15,
              ))),
          const SizedBox(
            width: defaultPadding / 2,
          ),
          InkWell(
              onTap: () => controller.onMoveNextPage(),
              child: const ChangeIconButton(
                  icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 15,
              ))),
        ],
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Times Up!'),
          content: const Text('Your Time has expired.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the alert dialog
              },
            ),
          ],
        );
      },
    );
  }
}
