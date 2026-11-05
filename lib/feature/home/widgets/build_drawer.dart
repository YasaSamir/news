import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/providers/theme_provider.dart';
import 'package:news/core/utils/app_assets.dart';
import 'package:news/core/utils/app_strings.dart';
import 'package:provider/provider.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({super.key, required this.onGoToHome});

  final VoidCallback onGoToHome;

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Column(
        children: [
          Container(
            height: 170.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Text(
                AppStrings.newsApp,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: .bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          buildListTile(
            context: context,
            img: AppAssets.home,
            title: AppStrings.goToHome,
            onTap: () {
              widget.onGoToHome(); // 1. Reset isSelected = false on HomeScreen
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 24.h),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1,
            indent: 20.w,
            endIndent: 20.w,
          ),
          SizedBox(height: 24.h),
          buildThemeTile(context),
          SizedBox(height: 24.h),
          Divider(
            color: Theme.of(context).colorScheme.primary,
            thickness: 1,
            indent: 20.w,
            endIndent: 20.w,
          ),
          SizedBox(height: 24.h),
          buildListTile(
            context: context,
            img: AppAssets.language,
            title: AppStrings.language,
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget buildListTile({
    required BuildContext context,
    required String img,
    required String title,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Image.asset(
          img,
          height: 24.h,
          width: 24.w,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ),
    );
  }

  Widget buildThemeTile(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            spacing: 10,
            children: [
              Image.asset(
                AppAssets.theme,
                height: 24.h,
                width: 24.w,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                AppStrings.theme,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          DropdownButton<ThemeMode>(
            value: themeProvider.themeMode,
            icon: Image.asset(AppAssets.dropIcon),
            items: const [
              DropdownMenuItem(value: ThemeMode.light, child: Text('Light')),
              DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark')),
            ],
            onChanged: (ThemeMode? newMode) {
              if (newMode != null) {
                themeProvider.setThemeMode(newMode);
              }
            },
          ),
        ],
      ),
    );
  }
}
