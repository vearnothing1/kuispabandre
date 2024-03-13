import 'package:flutter/material.dart';
import 'package:tested/models/new.dart';
import 'package:tested/services/news_service.dart';

class HomePageStateLessFutureBuilder extends StatelessWidget {
  const HomePageStateLessFutureBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<New>>(
        future: NewService.fetchNews(),
        builder: (context, snapshot) {
          final News = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }

          return ListView.builder(
            itemCount: News!.length,
            itemBuilder: (context, index) {
              final New = News[index];
              return Card(
                child: ListTile(
                  title: Text('${New.author}'),
                  subtitle: Text(New.title),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
