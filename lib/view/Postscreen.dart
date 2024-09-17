import 'package:api_task_posts/controller/cubit/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<PostsCubit,PostsState>(
      builder: (context, state) {
    final appCubit = context.read<PostsCubit>();
        return     Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
        ),
        body: appCubit.postsList != null
            ? ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 15),
                itemCount: appCubit.postsList!.length,
                itemBuilder: (context, index) {
                  final post = appCubit.postsList![index]; 
                  return ListTile(
                    title: Text(
                      post.title.toString(),
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,  fontSize: 20),

                    ),
                    
                    subtitle: Text(
                      post.body.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
      },

      listener: (context, state) {
        
      },
   
    );
  }
}
