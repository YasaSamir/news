import 'package:news/core/utils/app_assets.dart';

class ItemModel {
  final String id;
  final String title;
  final String img;

  const ItemModel(this.title, this.img, {required this.id});
  static List<ItemModel> items = [
    ItemModel('General', AppAssets.general, id: 'general'),
    ItemModel('Business', AppAssets.business,id: 'business'),
    ItemModel('Sport', AppAssets.sport,id: 'sports'),
    ItemModel('Technology', AppAssets.technology,id: 'technology'),
    ItemModel('Entertainment', AppAssets.entertainment,id: 'entertainment'),
    ItemModel('Health', AppAssets.health,id: 'health'),
    ItemModel('Science', AppAssets.science,id: "science"),
  ];
}