import 'package:flutter_shop_ui_template_for_sale/presentionals/presentionals_index.dart';

class CategoryUIModel {
  final List<String> categories;
  final int selectedIndex;
  final List<List<ProductUIModel>> products;
  CategoryUIModel(
    this.categories,
    this.selectedIndex,
    this.products,
  );
}
