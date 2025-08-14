import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_app/src/app.dart';
import 'package:quiz_app/src/bloc/auth_bloc/auth_bloc.dart';
import 'package:quiz_app/src/bloc/quiz_bloc/bloc/quiz_bloc.dart';
import 'package:quiz_app/src/service/question_service.dart';


void main() async{



   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

    


  
  runApp(  MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AuthBloc()),
        BlocProvider(create:(_)=> QuizBloc(QuestionService()) )

      ],
      child: MyApp(), 
    ),);
}

