import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prjct_andie/models/user.dart';
import 'package:prjct_andie/pages_client/client_sign_up_page.dart';
import 'package:prjct_andie/screens/authenticate.dart/register.dart';
import 'package:prjct_andie/screens/authenticate.dart/sign_in.dart';
import 'package:prjct_andie/screens/home/home.dart';
import 'package:prjct_andie/screens/wrapper.dart';
import 'package:prjct_andie/services/andie_notifier.dart';
import 'package:prjct_andie/services/auth.dart';
import 'package:prjct_andie/testing/screens(sign_in)/homescreen.dart';
import 'package:prjct_andie/testing/screens(sign_in)/mainscreen.dart';
import 'package:prjct_andie/testing/screens(sign_in)/splashscreen.dart';
import 'package:prjct_andie/testing/services(sign_in)/auth_services.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServices>(
          create: (_) => AuthServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthServices>().authStateChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (context) => AndieNotifier(),
        ),
      ],
      child: MaterialApp(
        title: "APP",
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    if (user != null) {
      return SplashScreen();
    } else {
      return SignIn();
    }
  }
}

/*
return StreamProvider<MyUser?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home:Wrapper(),
      ),
    );
  }
*/


/*
return StreamProvider<MyUser?>.value{
catchError: (_,__) => null,
initialData: AuthService().user,
Child:

catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,

*/
/*
class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();
}

*/
/*AuthService().handleAuth(),*//*


class _MyApp2State extends State<MyApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container
    );
  }
}
*/
