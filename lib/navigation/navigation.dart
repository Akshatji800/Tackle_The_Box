import 'package:flutter/cupertino.dart';
import 'package:tackle_the_box/task_boxes.dart';
import '../splashscreen.dart';
import '../task_pages/task7.dart';

class Navigate {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const TaskDashboard(),
    '/initial-screen': (context) => const Splashscreen(),
    //'/task7': (context) => const TaskSeven()
  };
}
