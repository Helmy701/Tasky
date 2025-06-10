import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/widgets/custom_text_form_field.dart';
import 'package:tasky/features/add_task/add_task_controller.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext _) {
    return ChangeNotifierProvider<AddTaskController>(
      create: (_) => AddTaskController(),
      builder: (context, _) {
        final controller = context.read<AddTaskController>();
        return Scaffold(
          appBar: AppBar(title: Text('New Task')),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Form(
                key: controller.key,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        controller: controller.taskNameController,
                        title: "Task Name",
                        hintText: 'Finish UI design for login screen',
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter Task Name";
                          }

                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        title: "Task Description",
                        controller: controller.taskDescriptionController,
                        maxLines: 5,
                        hintText:
                            'Finish onboarding UI and hand off to devs by Thursday.',
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'High Priority',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Consumer<AddTaskController>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return Switch(
                                value: value.isHighPriority,
                                onChanged: (bool value) {
                                  controller.toggle(value);
                                },
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 270.h,
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 40.h),
                        ),
                        onPressed: () async {
                          context.read<AddTaskController>().addTask(context);
                        },
                        label: Text('Add Task'),
                        icon: Icon(Icons.add),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
