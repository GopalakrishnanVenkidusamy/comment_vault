
import 'package:comment_vault/utils/vault_path_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CommentsBloc(),
        ),
        BlocProvider(
          create: (context) => FcmAuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Comment Vault',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: VaultColor.kPrimaryColor),
          useMaterial3: true,
        ),
        routes: PageRoutes().routes(),
        initialRoute: PageRoutes().defaultRoute(),
      ),
    );
  }
}
