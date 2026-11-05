import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/feature/home/models/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article_web_view.dart';

class ArticleBottomSheet extends StatelessWidget {
  final Articles article;

  const ArticleBottomSheet({super.key, required this.article});

  static void show(BuildContext context, Articles article) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      builder: (context) => ArticleBottomSheet(article: article),
    );
  }

  Future<void> openArticleUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Container(
        padding: REdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(
                  article.urlToImage!,
                  width: double.infinity,
                  height: 180.h,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox.shrink(),
                ),
              ),
            SizedBox(height: 12.h),
            Text(
              article.title ?? '',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              article.description ?? '',
              style: Theme.of(context).textTheme.bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleWebViewScreen(
                      url: article.url ?? '',
                      title: article.title ?? 'News Article',
                    ),
                  ),
                );
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
              ),
              child: Text('View Full Articel'),
            ),
          ],
        ),
      ),
    );
  }
}
