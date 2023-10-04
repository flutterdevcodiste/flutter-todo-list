import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:todo/view/home/components/rounded_button.dart';
import 'package:todo/view/home/components/today_button.dart';
import 'package:todo/view_model/controller/home_controller.dart';
import '../../../res/constants.dart';
import 'change_icon.dart';

class ChangeButtonRow extends StatelessWidget {
  ChangeButtonRow({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.06),
      child: Row(
        children: [
          const TodayButton(),
          const Spacer(),
          TimerBuilder.scheduled([controller.alertTime], builder: (context) {
            var now = DateTime.now();
            var reached = now.compareTo(controller.alertTime) >= 0;
            final textStyle = Theme.of(context).textTheme.bodyMedium;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    reached ? Icons.alarm_on : Icons.alarm,
                    color: reached ? Colors.red : Colors.green,
                    size: 48,
                  ),
                  !reached
                      ? TimerBuilder.periodic(const Duration(seconds: 1), alignment: Duration.zero,
                          builder: (context) {
                          // This function will be called every second until the alert time
                          var now = DateTime.now();
                          var remaining = controller.alertTime.difference(now);
                          return Text(
                            formatDuration(remaining),
                            style: textStyle,
                          );
                        })
                      : Text("Alert", style: textStyle),
                  // RoundedButton(
                  //   child: const Text("Reset"),
                  //   onPressed: () {
                  //     setState(() {
                  //       alert = DateTime.now().add(Duration(seconds: 10));
                  //     });
                  //   },
                  // ),
                ],
              ),
            );
          }),
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

  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }

    // We want to round up the remaining time to the nearest second
    d += const Duration(microseconds: 999999);
    return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
  }
}
