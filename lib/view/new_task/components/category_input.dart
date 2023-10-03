import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/view/new_task/components/text_input.dart';

import '../../../res/constants.dart';
import '../../../view_model/controller/new_task_controller.dart';

class CategoryInput extends StatelessWidget {
  CategoryInput({super.key});

  final controller = Get.put(NewTaskController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultPadding / 2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Lable',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          Obx(
            () => TextInputField(
                controller: controller.label.value,
                hint: 'Enter Label',
                onTap: () => controller.setLabelFocus(),
                focus: controller.labelFocus.value),
          ),
        ],
      ),
    );
  }
}
