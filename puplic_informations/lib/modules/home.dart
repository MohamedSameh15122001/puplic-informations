import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:puplic_informations/modules/notification.dart';
import 'package:puplic_informations/shared/components/constants.dart';
import 'package:puplic_informations/shared/main_cubit/main_cubit.dart';
import 'package:puplic_informations/shared/main_cubit/main_states.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    internetConection(context);
    MainCubit ref = MainCubit.get(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blueGrey[600],
        // statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blueGrey[300],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: const Text(
          'Puplic information',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              internetConection(context);
              await ref.getRandomFact(type: 'date');
              await ref.getRandomFact(type: 'math');
              await ref.getRandomFact(type: 'trivia');
              await ref.getRandomFact(type: 'year');
            },
            icon: const Icon(
              Icons.refresh_rounded,
              weight: .6,
            ),
          )
        ],
      ),
      body: BlocConsumer<MainCubit, MainState>(
        bloc: MainCubit.get(context)
          ..getRandomFact(type: 'date')
          ..getRandomFact(type: 'math')
          ..getRandomFact(type: 'trivia')
          ..getRandomFact(type: 'year'),
        listener: (context, state) {},
        builder: (context, state) {
          if (ref.randomYearFact['text'] != null &&
              ref.randomYearFact['number'] != null) {
            NotificationService notificationService = NotificationService();
            notificationService.initializeNotification();
            // notificationService.secheduleNotification(
            //   'Year Fact (${ref.randomYearFact['number'] ?? ''})',
            //   '${ref.randomYearFact['text']}.',
            // );
          }
          return RefreshIndicator(
            backgroundColor: Colors.blueGrey[700],
            color: Colors.white,
            onRefresh: () async {
              internetConection(context);
              await ref.getRandomFact(type: 'date');
              await ref.getRandomFact(type: 'math');
              await ref.getRandomFact(type: 'trivia');
              await ref.getRandomFact(type: 'year');
            },
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                clipBehavior: Clip.antiAlias,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //DATE
                      ref.randomDateFact['text'] == null
                          ? const SpinKitThreeInOut(
                              color: Color.fromARGB(255, 209, 213, 211),
                              size: 30,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  margin: const EdgeInsets.only(top: 10),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      internetConection(context);
                                      await ref.getRandomFact(type: 'date');
                                    },
                                    child: Text(
                                      'Date Fact (${ref.randomDateFact['year'] ?? ''})    🔃',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    '${ref.randomDateFact['text']}.',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ref.randomMathFact['text'] == null
                          ? const SpinKitThreeInOut(
                              color: Color.fromARGB(255, 209, 213, 211),
                              size: 30,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () async {
                                        internetConection(context);
                                        await ref.getRandomFact(type: 'math');
                                      },
                                      child: Text(
                                        'Math Fact (${ref.randomMathFact['number'] ?? ''})    🔃',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    '${ref.randomMathFact['text']}.',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ref.randomTriviaFact['text'] == null
                          ? const SpinKitThreeInOut(
                              color: Color.fromARGB(255, 209, 213, 211),
                              size: 30,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () async {
                                        internetConection(context);
                                        await ref.getRandomFact(type: 'trivia');
                                      },
                                      child: Text(
                                        'Trivia Fact (${ref.randomTriviaFact['number'] ?? ''})    🔃',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    '${ref.randomTriviaFact['text']}.',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      ref.randomYearFact['text'] == null
                          ? const SpinKitThreeInOut(
                              color: Color.fromARGB(255, 209, 213, 211),
                              size: 30,
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    margin: const EdgeInsets.only(top: 10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () async {
                                        internetConection(context);
                                        await ref.getRandomFact(type: 'year');
                                      },
                                      child: Text(
                                        'Year Fact (${ref.randomYearFact['number'] ?? ''})    🔃',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                    bottom: 20,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.only(
                                      // topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(4),
                                      bottomRight: Radius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    '${ref.randomYearFact['text']}.',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
