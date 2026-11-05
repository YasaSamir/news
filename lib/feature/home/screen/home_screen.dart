import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/utils/app_strings.dart';
import 'package:news/feature/home/models/item_model.dart';
import 'package:news/feature/home/widgets/build_drawer.dart';
import 'package:news/feature/home/widgets/categories.dart';
import 'package:news/feature/home/widgets/home_app_bar.dart';
import 'package:news/feature/home/widgets/news_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSelected = false;
  bool isSearching = false;
  ItemModel? selectedCategory;
  final TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void selectCategory(ItemModel item) {
    setState(() {
      isSelected = true;
      selectedCategory = item;
    });
  }

  void goToHome() {
    setState(() {
      isSelected = false;
      selectedCategory = null;
      isSearching = false;
      searchQuery = '';
      searchController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(onGoToHome: goToHome),
      appBar: HomeAppBar(
        isSelected: isSelected,
        selectedCategory: selectedCategory,
        isSearching: isSearching,
        searchController: searchController,
        onSearchChanged: (value) => setState(() => searchQuery = value),
        onSearchStart: () => setState(() => isSearching = true),
        onSearchClose: () => setState(() {
          isSearching = false;
          searchQuery = '';
          searchController.clear();
        }),
      ),
      body: SafeArea(
        child: !isSelected
            ? Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.welcomeMessage,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 16.h),
                    Categories(onCategorySelected: selectCategory),
                  ],
                ),
              )
            : NewsView(
                category: selectedCategory!,
                searchQuery: searchQuery,
              ),
      ),
    );
  }
}
