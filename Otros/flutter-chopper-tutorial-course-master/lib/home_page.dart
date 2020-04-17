import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:built_collection/built_collection.dart';

import 'data/profesor_service.dart';
import 'model/built_profesor.dart';
import 'data/post_api_service.dart';
import 'model/built_post.dart';
import 'single_post_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chopper Blog'),
      ),
      body: _buildBody1(context),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final newPost = BuiltPost((b) => b
            ..title = 'New Title'
            ..body = 'New body');

          // The JSONPlaceholder API always responds with whatever was passed in the POST request
//          final response =
//              await Provider.of<PostApiService>(context).postPost(newPost);
          // We cannot really add any new posts using the placeholder API,
          // so just print the response to the console
//          print(response.body);
        },
      ),
    );
  }

  FutureBuilder<Response> _buildBody(BuildContext context) {
    Provider.of<PostApiService>(context).getPosts();
//    Provider.of<ProfesorService>(context).getProfesors();
    return FutureBuilder<Response<BuiltList<BuiltPost>>>(
      future: Provider.of<PostApiService>(context).getPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          final posts = snapshot.data.body;
          return _buildPosts(context, posts);
        } else {
          // Show a loading indicator while waiting for the posts
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, BuiltList<BuiltPost> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].body),
            onTap: () => _navigateToPost(context, posts[index].id),
          ),
        );
      },
    );
  }

  void _navigateToPost(BuildContext context, int id) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SinglePostPage(postId: id),
      ),
    );
  }



  FutureBuilder<Response> _buildBody1(BuildContext context) {
    return FutureBuilder<Response<BuiltList<BuiltProfesor>>>(
      future: Provider.of<ProfesorService>(context).getProfesors(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          final posts = snapshot.data.body;
          return _buildPosts1(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildPosts1(BuildContext context, BuiltList<BuiltProfesor> posts) {
    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            title: Text(
              posts[index].nombre,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].email),
            onTap: () => {},
          ),
        );
      },
    );
  }
}
