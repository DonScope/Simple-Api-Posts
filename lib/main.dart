import 'package:api_task_posts/controller/cubit/posts_cubit.dart';
import 'package:api_task_posts/view/Postscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PostsCubit()..getNews()),
      ],
      child: MaterialApp(
        title: 'News',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          
        ),
        debugShowCheckedModeBanner: false,
        home: PostsScreen()
      ),
    );
  }
}

