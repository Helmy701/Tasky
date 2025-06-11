# 📝 Tasky Management App (Flutter)

A clean, responsive task management Flutter app with persistent local storage, theme support, and user profile customization. Inspired by a Figma design and implemented with `provider`, `shared_preferences`, and image support.

---

## ✨ Features

- Add, edit, delete, and mark tasks as complete
- User-friendly navigation with a bottom navigation bar
- Mark tasks as high priority
- Filter views for To-Do, Completed, and High Priority tasks
- Persistent storage using `shared_preferences`
- responsive Ui by ScreenUtil
- splash screen
- Real-time UI updates with Provider
- profile screen with editing image, name, and motivation quote
- Responsive to light/dark mode
- Cupertino-style UI with `flutter_svg` and `image_picker`

---

## 📁 Project Structure

```

lib/
├── core/
│   ├── components/
│   ├── constants/
│   │   └── storage_keys.dart
│   ├── enums/
│   ├── └── tasks_action.dart
│   ├── services/
│   │   └── preferences_manager.dart
│   │── theme/
│   │    ├── dark_theme.dart
│   │    ├── light_theme.dart
│   │    └── theme_controller.dart
│   └── widgets
│
├── features/
│   ├── add\_tasks/
│   │   ├── add_task_controller.dart 
│   │   └── add_task_screen.dart
│   ├── home/
│   │   ├── components/
│   │   ├── home_controller.dart    
│   │   └── tasks_screen.dart
│   ├── navigation/
│   ├── profile/
│   │   ├── profile_screen.dart
│   │   └── user_details_screen.dart
│   ├── tasks/
│   │   ├── controllers/
│   │   ├── complete_screen.dart
│   │   ├── high_priority_tasks_screen.dart
│   │   └── todo_screen.dart
│   └── welcome/
│       └── welcome_screen.dart
│
├── models/
│   └── task_model.dart
│ 
└── main.dart

````

---

## 📸 UI Screens

### Design Reference
![figma design](https://github.com/user-attachments/assets/2cb2f404-0d64-4aa1-9058-92c18fdfa94f)


## 🧩 Packages Used

```yaml
cupertino_icons: ^1.0.8
flutter_svg: ^2.1.0
shared_preferences: ^2.5.3
provider: ^6.1.5
image_picker: ^1.1.2
path_provider: ^2.1.5
flutter_native_splash: ^2.4.6
flutter_screenutil: ^5.9.3
````

---

## 🧠 Controllers Overview

### 🧍‍♂️ UserController

Manages user info including:

* `username`
* `motivationQuote`
* `userImagePath`

Supports updating, clearing, and saving persistent user data via `PreferencesManager`.

### ✅ TasksController

Handles:

* `addTask()`, `editTask()`, `deleteTask()`
* Filtering tasks into "To Do" and "Completed"
* Persisting and retrieving tasks from storage

### 🎨 ThemeController
* Handles switching between light and dark mode.
* Persists the selected theme mode locally using shared_preferences to retain user preference across app launches.


