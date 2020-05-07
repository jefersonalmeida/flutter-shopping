import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/ui/shared/widgets/category/category-list.widget.dart';
import 'package:shopping/ui/shared/widgets/product/product-list.widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return CupertinoPageScaffold(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Categorias",
              style: Theme.of(context).textTheme.headline,
            ),
            CategoryListWidget(
              categories: bloc.categories,
            ),
            Text(
              'Mais Vendidos',
              style: Theme.of(context).textTheme.headline,
            ),
            ProductListWidget(
              products: bloc.products,
            ),
          ],
        ),
      ),
    );
  }
}