import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:prega_diet/articles/model/article.model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({Key? key, required this.article}) : super(key: key);
  void _launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : print('Could not launch $url');

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 200,
                child: Image.network(article.imageUrl),
              ),
              MarkdownBody(
                data: article.context,
                shrinkWrap: true,
                selectable: true,
                onTapLink: (_, url, __) {
                  if (url != null) {
                    _launchURL(url);
                  }
                },
                styleSheet: MarkdownStyleSheet(
                  textScaleFactor: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
