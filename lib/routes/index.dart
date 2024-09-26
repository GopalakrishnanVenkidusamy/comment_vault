import 'package:comment_vault/utils/vault_path_export.dart';

class PageRoutes{
  static const String login = "/login";
  static const String signup = "/signup";
  static const String comments = "/comments";

  defaultRoute() {
    return login;
  }
  Map<String, WidgetBuilder> routes() {
    return {
      login: (context) =>  const Login(),
      signup: (context) => const Signup(),
      comments: (context) => const Comments(),
    };
  }
}
