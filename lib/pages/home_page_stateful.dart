import 'package:flutter/material.dart';
import 'package:tested/models/new.dart';
import 'package:tested/services/news_service.dart';

class HomePageStateful extends StatefulWidget {
  const HomePageStateful({super.key});

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  List<New> News = [];
  bool isLoading = true;

  void fetchNew() async {
    isLoading = true;
    final result = await NewService.fetchNews();
    News = result;
    setState(() {});
    isLoading = false;
  }

  @override
  void initState() {
    super.initState();
    fetchNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: News.length,
              itemBuilder: (context, index) {
                final New = News[index];
                return Card(
                  child: ListTile(
                    title: Text('${New.author}'),
                    subtitle: Text(New.title),
                  ),
                );
              },
            ),
    );
  }
}
