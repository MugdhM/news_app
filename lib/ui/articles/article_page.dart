import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:news_app/ui/articles/articles_card.dart';
import '../../models/article.dart';
import '../../services/api_service.dart';
import '../widgets/custom_fab.dart';

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  List<Article> _articles = [];
  int _start = 0;
  final ApiService _apiService = ApiService();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchArticles();

    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        _loadMoreArticles();
      }
    });
  }

  Future<void> _fetchArticles() async {
    setState(() {
      _isLoading = true;
    });
    List articles = await _apiService.fetchArticles(_start);
    setState(() {
      _articles.addAll(articles as Iterable<Article>);
      _isLoading = false;
    });
  }

  void _loadMoreArticles() {
    _start += 20;
    _fetchArticles();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spaceflight News')),
      body: _isLoading && _articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageController,
              itemCount: _articles.length,
              itemBuilder: (context, index) {
                if (index == _articles.length - 1 && !_isLoading) {
                  _loadMoreArticles();
                }
                return carouselView(index, _articles, _pageController);
              },
            ),
      floatingActionButton: CustomFAB(onPressed: () {
        setState(() {
          _start = 0;
          _articles.clear();
        });
        _fetchArticles();
      }),
    );
  }
}

Widget carouselView(
    int index, List<Article> articles, PageController pageController) {
  return LayoutBuilder(
    builder: (context, constraints) {
      return AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          if (!pageController.position.hasContentDimensions) {
            return Container();
          }
          final double pageValue = (pageController.page ?? 0) - index;
          final double rotation = pageValue * 45.0;

          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // Perspective
              ..rotateY(rotation * (math.pi / 180)), // Y-axis rotation
            alignment: Alignment.center,
            child: ArticleCard(article: articles[index]),
          );
        },
      );
    },
  );
}
