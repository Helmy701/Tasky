import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/theme/theme_controller.dart';
import 'package:tasky/core/widgets/custom_svg_picture.dart';
import 'package:tasky/features/home/home_controller.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Selector<HomeController, String?>(
          selector: (context, HomeController controller) =>
              controller.userImagePath,
          builder:
              (BuildContext context, String? userImagePath, Widget? child) {
            return CircleAvatar(
              radius: 28.r,
              backgroundImage: userImagePath == null
                  ? AssetImage('assets/images/person.png')
                  : FileImage(File(userImagePath)),
            );
          },
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Selector<HomeController, String?>(
                selector: (context, HomeController controller) =>
                    controller.username,
                builder:
                    (BuildContext context, String? username, Widget? child) {
                  return Text(
                    "Good Evening, $username",
                    style: Theme.of(context).textTheme.titleMedium,
                  );
                },
              ),
              Text(
                "One task at a time. One step closer.",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: ValueListenableBuilder(
            valueListenable: ThemeController.themeNotifier,
            builder: (context, value, child) {
              return IconButton(
                icon: ThemeController.isDark()
                    ? CustomSvgPicture(
                        width: 20.w,
                        height: 20.h,
                        path: 'assets/images/light-mode.svg',
                      )
                    : CustomSvgPicture(
                        path: "assets/images/dark-mode.svg",
                        height: 20.h,
                        width: 20.w,
                      ),
                onPressed: () async {
                  ThemeController.toggleTheme();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
