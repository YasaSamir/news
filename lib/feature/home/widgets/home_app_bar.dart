import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/core/utils/app_strings.dart';
import 'package:news/feature/home/models/item_model.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isSelected;
  final ItemModel? selectedCategory;
  final bool isSearching;
  final TextEditingController searchController;
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSearchStart;
  final VoidCallback onSearchClose;

  const HomeAppBar({
    super.key,
    required this.isSelected,
    required this.selectedCategory,
    required this.isSearching,
    required this.searchController,
    required this.onSearchChanged,
    required this.onSearchStart,
    required this.onSearchClose,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (isSearching) {
      return AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        titleSpacing: 16.w,
        automaticallyImplyLeading: false,
        title: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(24.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1,
            ),
          ),
          child: TextField(
            controller: searchController,
            autofocus: true,
            style: Theme.of(context).textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: AppStrings.search,
              hintStyle: TextStyle(
                color: AppColors.grey,
                fontSize: 16.sp,
              ),
              prefixIcon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
                size: 22.sp,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).colorScheme.primary,
                  size: 22.sp,
                ),
                onPressed: onSearchClose,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
            ),
            onChanged: onSearchChanged,
          ),
        ),
      );
    }

    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      title: Text(
        isSelected && selectedCategory != null
            ? selectedCategory!.title
            : AppStrings.home,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 20.sp),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: onSearchStart,
          icon: Icon(
            Icons.search,
            size: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
