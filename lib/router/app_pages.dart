// ignore_for_file: constant_identifier_names

import '../modules/login/chose_account.dart';
import '../modules/login/forgot_password_screen.dart';
import '../modules/login/login_screen.dart';
import '../modules/models/class_model.dart';
import '../modules/roll_call/list_class.dart';
import 'page_config.dart';

enum AppPages {
  Initial,
  LoginPage,
  ForgotPassScreen,
  ChoseAccountPage,
  ListClassScreen,
}

final RegExp _keyPattern = RegExp('(?<=[a-z])[A-Z]');

extension AppPagesExtension on AppPages {
  String get key => toString()
      .split('.')
      .last
      .replaceAll('_', '.')
      .replaceAllMapped(
        _keyPattern,
        (Match m) => "_${m.group(0) ?? ''}",
      )
      .toLowerCase();

  String get path => "/${key.replaceAll('.', '/')}";

  String get name => path;
  static PageConfig getPageConfig(
    AppPages page,
    Map<String, dynamic>? arguments,
  ) {
    switch (page) {
      case AppPages.Initial:
      //Auth
      case AppPages.LoginPage:
        return PageConfig()
          ..pageBuilder = () => const LoginScreen(
                type: 'hs',
              );
      case AppPages.ForgotPassScreen:
        return PageConfig()..pageBuilder = () => const ForgotPassScreen();
      case AppPages.ChoseAccountPage:
        return PageConfig()..pageBuilder = () => const ChoseAccount();
      case AppPages.ListClassScreen:
        final List<ClassModel> listClasses = arguments!['listClasses'];
        return PageConfig()
          ..pageBuilder = () => ListClass(
                listClasses: listClasses,
              );
      default:
        throw StateError(
          "Missing page: ${page.toString()} in AppPagesExtension.getPageConfig()",
        );
    }
  }

  static PageConfig getPageConfigForUnknownRouteName(String? name) =>
      getPageConfig(
        name == AppPages.Initial.name || name?.isEmpty == true
            ? AppPages.Initial
            : AppPages.values.firstWhere(
                (e) => e.name.contains(name!),
                orElse: () => AppPages.Initial,
              ),
        {},
      );
}
