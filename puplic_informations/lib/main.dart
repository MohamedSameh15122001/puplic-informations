import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puplic_informations/modules/splash.dart';
import 'package:puplic_informations/shared/main_cubit/main_cubit.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // NotificationService notificationService = NotificationService();
  // notificationService.initializeNotification();

  // final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  //     FlutterLocalNotificationsPlugin();
  // const AndroidInitializationSettings initializationSettingsAndroid =
  //     AndroidInitializationSettings('app_icon');
  // const InitializationSettings initializationSettings = InitializationSettings(
  //   android: initializationSettingsAndroid,
  // );
  // await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Puplic Information',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        home: SplashScreen(),
      ),
    );
  }
}
