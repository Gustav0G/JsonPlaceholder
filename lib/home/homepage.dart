import 'package:flutter/material.dart';
import 'package:json_placeholder_estudo/model/post_model.dart';
import 'package:json_placeholder_estudo/repository/post_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final postRepository = PostRepository();

  @override
  void initState() {
    postRepository.addListener(() {
      setState(() {});
    });
    postRepository.getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = postRepository.posts;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json PlaceHolder'),
      ),
      body: ListView.builder(
          itemCount: post.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(post[index].title),
              subtitle: Text(post[index].body),
            );
          }),
    );
  }
}
