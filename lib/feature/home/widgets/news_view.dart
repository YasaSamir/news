import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/feature/home/models/item_model.dart';
import 'package:news/feature/home/models/sources_response.dart';
import 'package:news/feature/home/sevices/api_services.dart';
import 'package:news/feature/home/widgets/article_item.dart';

class NewsView extends StatefulWidget {
  final ItemModel category;
  final String searchQuery;

  const NewsView({
    super.key,
    required this.category,
    required this.searchQuery,
  });

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  Sources? selectedSource;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sources>>(
      future: ApiServices.getSources(widget.category.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No sources available',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          );
        }

        final sources = snapshot.data!;
        selectedSource ??= sources.first;

        return Column(
          children: [
            DefaultTabController(
              initialIndex: 0,
              length: sources.length,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedSource = sources[index];
                  });
                },
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Theme.of(context).colorScheme.primary,
                labelColor: Theme.of(context).colorScheme.primary,
                tabs: sources.map((e) => Tab(text: e.name ?? '')).toList(),
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: FutureBuilder(
                future: ApiServices.getNews(selectedSource!.id!),
                builder: (context, newsSnapshot) {
                  if (newsSnapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (newsSnapshot.hasError) {
                    return Center(
                      child: Text(
                        newsSnapshot.error.toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }

                  var articles = newsSnapshot.data ?? [];
                  if (widget.searchQuery.isNotEmpty) {
                    articles = articles.where((article) {
                      final title = article.title?.toLowerCase() ?? '';
                      final description =
                          article.description?.toLowerCase() ?? '';
                      final author = article.author?.toLowerCase() ?? '';
                      final query = widget.searchQuery.toLowerCase();
                      return title.contains(query) ||
                          description.contains(query) ||
                          author.contains(query);
                    }).toList();
                  }

                  if (articles.isEmpty) {
                    return Center(
                      child: Text(
                        'No results found',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }

                  return Padding(
                    padding: REdgeInsets.all(16),
                    child: ListView.separated(
                      itemCount: articles.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        return ArticleItem(article: articles[index]);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
