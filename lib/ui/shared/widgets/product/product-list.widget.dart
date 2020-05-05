import 'package:flutter/widgets.dart';
import 'package:shopping/models/product-list-item.model.dart';
import 'package:shopping/ui/shared/widgets/loader.widget.dart';
import 'package:shopping/ui/shared/widgets/product/product-card.widget.dart';

class ProductListWidget extends StatelessWidget {
  final List<ProductListItemModel> products;

  ProductListWidget({@required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 410,
      child: LoaderWidget(
        object: products,
        callback: list,
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (context, index) {
        ProductListItemModel item = products[index];

        return Padding(
          padding: EdgeInsets.all(5),
          child: ProductCardWidget(
            item: item,
          ),
        );
      },
    );
  }
}
