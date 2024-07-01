import 'package:get/get.dart';
import '../views/login_page.dart';
import '../views/register_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';

  static List<GetPage> routes = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => RegisterPage()),
  ];
}
