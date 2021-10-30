import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prega_diet/articles/cubit/articles_cubit.dart';
import 'package:prega_diet/articles/repository/articles_repository.dart';
import 'package:prega_diet/auth/bloc/auth_bloc.dart';
import 'package:prega_diet/auth/screen/authentication_wrapper.dart';
import 'package:prega_diet/homescreen.dart';

import 'auth/repository/auth_repositiry.dart';
import 'login/cubit/login_cubit.dart';
import 'login/repository/login_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(auth: FirebaseAuth.instance),
        ),
        RepositoryProvider(
          create: (context) => LoginRepository(
              auth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance),
        ),
        RepositoryProvider(
          create: (context) =>
              ArticleRepository(firestore: FirebaseFirestore.instance),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthBloc(repository: context.read<AuthRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                LoginCubit(repository: context.read<LoginRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                ArticlesCubit(repository: context.read<ArticleRepository>()),
          ),
        ],
        child: MaterialApp(
          title: 'Prega Diet',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: AuthenticationWrapper(),
        ),
      ),
    );
  }
}
