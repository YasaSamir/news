import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/item_model.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.onCategorySelected});
  final ValueChanged<ItemModel> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: ItemModel.items.length,
        separatorBuilder: (context, index) => SizedBox(height: 8.h),
        itemBuilder: (context, index) {
          final item = ItemModel.items[index];
          return Directionality(
            textDirection: index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            child: InkWell(
              onTap: () {
                onCategorySelected(item);
              },
              child: Container(
                height: 200.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: AssetImage(ItemModel.items[index].img),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(flex: 2, child: SizedBox()),
                    Expanded(flex: 3,
                      child: Column(
                        crossAxisAlignment: .start,
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Padding(
                            padding: REdgeInsets.all(12),
                            child: Text(
                              ItemModel.items[index].title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontSize: 30.sp,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary,
                                  ),
                            ),
                          ),
                          Container(
                            padding: REdgeInsetsDirectional.only(start: 8.w),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.onPrimary,
                              borderRadius: BorderRadius.circular(84),
                            ),
                            child: Row(
                              spacing: 10,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'View All',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                CircleAvatar(
                                  radius: 26,
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 24,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
