import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:json_placeholder_estudo/model/post_model.dart';

class PostRepository extends ChangeNotifier {
  final dio = Dio();
  List<PostModel> _posts = [];

  Future<List> _getPost() async {
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/posts/');
    return await response.data;
  }

  Future<List<PostModel>> getPosts() async {
    final list = await _getPost();
    final posts = list.map((e) => PostModel.fromJson(e)).toList();
    _posts = posts;
    notifyListeners();
    return _posts;
  }

  List<PostModel> get posts => _posts;
}
