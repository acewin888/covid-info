import 'package:flutter/cupertino.dart';

class CustomViewList<T> extends StatelessWidget {
  final List<T> list;
  final CustomBuilder builder;

  CustomViewList(this.list, this.builder);

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    for (int i = 0; i < list.length; i++) {
      widgets.addAll(
          [const SizedBox(height: 4.0), CustomItem(list[i], builder)]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }
}

class CustomItem<T> extends StatelessWidget {
  final T item;
  final CustomBuilder<T> builder;

  CustomItem(this.item, this.builder);

  @override
  Widget build(BuildContext context) {
    return builder.buildItem(context, item);
  }
}

abstract class CustomBuilder<T> {
  Widget buildItem(BuildContext context, T item);
}
