import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky/core/constants/storage_key.dart';
import 'package:tasky/core/services/preferences_manager.dart';
import 'package:tasky/core/theme/dark_theme.dart';
import 'package:tasky/core/theme/light_theme.dart';
import 'package:tasky/core/theme/theme_controller.dart';
import 'package:tasky/features/navigation/main_screen.dart';
import 'package:tasky/features/welcome/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await PreferencesManager().init();
  ThemeController().init();

  String? username = PreferencesManager().getString(StorageKey.username);

  runApp(MyApp(username: username));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.username});

  final String? username;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 809),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return ValueListenableBuilder<ThemeMode>(
          valueListenable: ThemeController.themeNotifier,
          builder: (context, ThemeMode themeMode, Widget? child1) {
            return MaterialApp(
              title: 'Tasky App',
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeMode,
              home: child,
            );
          },
        );
      },
      child: username == null ? WelcomeScreen() : MainScreen(),
    );
  }
}

/// PopupMenu
/// AlertDialog
/// Custom Dialog
/// ModalBottomSheet -> BottomSheet
/// DatePicker
/// FullScreen Dialog
