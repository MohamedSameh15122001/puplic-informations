import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puplic_informations/modules/home.dart';

import 'package:splash_view/source/presentation/pages/splash_view.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blueGrey,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return SplashView(
      // logo: const FlutterLogo(),
      loadingIndicator: const Padding(
        padding: EdgeInsets.all(20.0),
        child: SpinKitThreeInOut(
          color: Color.fromARGB(255, 209, 213, 211),
          size: 30,
        ),
      ),
      backgroundColor: Colors.blueGrey,
      bottomLoading: false,
      showStatusBar: true,
      title: Image.asset(
        'lib/assets/info.png',
        width: 100,
        height: 100,
      ),

      // gradient: const LinearGradient(
      //     begin: Alignment.topCenter,
      //     end: Alignment.bottomCenter,
      //     colors: <Color>[Colors.green, Colors.blue]),
      done: Done(
        const Home(),
        animationDuration: const Duration(seconds: 2),
        // curve: Curves.easeInOut,
      ),
    );
  }
}
