import 'package:flutter/widgets.dart';
import 'package:shopping/models/category.model.dart';
import 'package:shopping/ui/shared/widgets/category/category-card.widget.dart';
import 'package:shopping/ui/shared/widgets/loader.widget.dart';

class CategoryListWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  CategoryListWidget({@required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: LoaderWidget(
        object: categories,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        CategoryModel item = categories[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: CategoryCardWidget(
            item: item,
          ),
        );
      },
    );
  }
}
