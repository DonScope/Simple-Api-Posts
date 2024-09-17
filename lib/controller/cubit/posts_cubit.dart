import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:api_task_posts/model/Pmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());
  List<PModel>? postsList;

  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> getNews() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body);
        postsList = jsonData.map((post) => PModel.fromJson(post)).toList();
        emit(FetchData());
      }
    } catch (e) {
      print(e);
    }
  }
}