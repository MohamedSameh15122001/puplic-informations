import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puplic_informations/shared/main_cubit/main_states.dart';
import 'package:http/http.dart' as http;

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  var randomTriviaFact = {};
  var randomMathFact = {};
  var randomDateFact = {};
  var randomYearFact = {};
  getRandomFact({
    type = 'trivia', //trivia, math, date , year
    min = '0',
    max = '3000',
    fragment = 'true',
    json = 'true',
  }) async {
    emit(LoadingGetRandomFactState());
    if (type == 'trivia') {
      randomTriviaFact = {};
    } else if (type == 'math') {
      randomMathFact = {};
    } else if (type == 'date') {
      randomDateFact = {};
    } else if (type == 'year') {
      randomYearFact = {};
    } else {}

    var url = Uri.parse(
        'https://numbersapi.p.rapidapi.com/random/$type?min=$min&max=$max&fragment=$fragment&json=$json');
    var headers = {
      'X-RapidAPI-Key': 'f806056228msh1b0793655feb2bfp13396ajsnb8b056de3ed4',
      'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      if (type == 'trivia') {
        randomTriviaFact = jsonDecode(response.body);
      } else if (type == 'math') {
        randomMathFact = jsonDecode(response.body);
      } else if (type == 'date') {
        randomDateFact = jsonDecode(response.body);
      } else if (type == 'year') {
        randomYearFact = jsonDecode(response.body);
      } else {}

      emit(SuccessGetRandomFactState());
    } else {
      emit(ErrorGetRandomFactState());
      throw Exception('Failed to fetch TV series');
    }
  }

  // var dataFact = {};
  // getDataFact({
  //   month = '6',
  //   day = '21',
  //   fragment = 'true',
  //   json = 'true',
  // }) async {
  //   emit(LoadingGetDataFactState());
  //   dataFact = {};
  //   var url = Uri.parse(
  //       'https://numbersapi.p.rapidapi.com/$month/$day/date?fragment=$fragment&json=$json');
  //   var headers = {
  //     'X-RapidAPI-Key': 'f806056228msh1b0793655feb2bfp13396ajsnb8b056de3ed4',
  //     'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
  //   };
  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     dataFact = jsonDecode(response.body);
  //     print(dataFact);
  //     emit(SuccessGetDataFactState());
  //   } else {
  //     emit(ErrorGetDataFactState());
  //     throw Exception('Failed to fetch TV series');
  //   }
  // }

  // var mathFact = {};
  // getMathFact({
  //   number = '6',
  //   fragment = 'true',
  //   json = 'true',
  // }) async {
  //   emit(LoadingGetMathFactState());
  //   mathFact = {};
  //   var url = Uri.parse(
  //       'https://numbersapi.p.rapidapi.com/$number/math?fragment=$fragment&json=$json');
  //   var headers = {
  //     'X-RapidAPI-Key': 'f806056228msh1b0793655feb2bfp13396ajsnb8b056de3ed4',
  //     'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
  //   };
  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     mathFact = jsonDecode(response.body);
  //     emit(SuccessGetMathFactState());
  //     print(mathFact);
  //   } else {
  //     emit(ErrorGetMathFactState());
  //     throw Exception('Failed to fetch TV series');
  //   }
  // }

  // var triviaFact = {};
  // getTriviaFact({
  //   number = '42',
  //   notfound = 'floor', //floor,default,ceil
  //   fragment = 'true',
  //   json = 'true',
  // }) async {
  //   emit(LoadingGetTriviaFactState());
  //   triviaFact = {};
  //   var url = Uri.parse(
  //       'https://numbersapi.p.rapidapi.com/$number/trivia?fragment=$fragment&json=$json');
  //   var headers = {
  //     'X-RapidAPI-Key': 'f806056228msh1b0793655feb2bfp13396ajsnb8b056de3ed4',
  //     'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
  //   };
  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     triviaFact = jsonDecode(response.body);
  //     print(triviaFact);
  //     emit(SuccessGetTriviaFactState());
  //   } else {
  //     emit(ErrorGetTriviaFactState());
  //     throw Exception('Failed to fetch TV series');
  //   }
  // }

  // var yearFact = {};
  // getYearFact({
  //   year = '2000',
  //   fragment = 'true',
  //   json = 'true',
  // }) async {
  //   emit(LoadingGetYearFactState());
  //   yearFact = {};
  //   var url = Uri.parse(
  //       'https://numbersapi.p.rapidapi.com/$year/year?fragment=$fragment&json=$json');
  //   var headers = {
  //     'X-RapidAPI-Key': 'f806056228msh1b0793655feb2bfp13396ajsnb8b056de3ed4',
  //     'X-RapidAPI-Host': 'numbersapi.p.rapidapi.com',
  //   };
  //   final response = await http.get(url, headers: headers);
  //   if (response.statusCode == 200) {
  //     yearFact = jsonDecode(response.body);
  //     print(yearFact);
  //     emit(SuccessGetYearFactState());
  //   } else {
  //     emit(ErrorGetYearFactState());
  //     throw Exception('Failed to fetch TV series');
  //   }
  // }
}
