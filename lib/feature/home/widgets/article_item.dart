import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/feature/home/models/news_response.dart';
import 'package:news/feature/home/widgets/bottom_sheet.dart';

class ArticleItem extends StatelessWidget {
  final Articles article;

  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ArticleBottomSheet.show(context, article),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (article.urlToImage != null && article.urlToImage!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    article.urlToImage!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                  ),
                ),
              SizedBox(height: 12.h),
              Text(
                article.title ?? '',
                maxLines: 2,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'By : ${article.author ?? 'Unknown'}',
                      style: TextStyle(
                        color: AppColors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Text(
                    article.publishedAt != null &&
                            article.publishedAt!.length >= 10
                        ? article.publishedAt!.substring(0, 10)
                        : '',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
