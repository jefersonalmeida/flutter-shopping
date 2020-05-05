import 'package:flutter/widgets.dart';
import 'package:shopping/ui/shared/widgets/progress-indicator.widget.dart';

class LoaderWidget extends StatelessWidget {
  final object;
  final Function callback;

  LoaderWidget({@required this.object, @required this.callback});

  @override
  Widget build(BuildContext context) {
    if (object == null)
      return Center(
        child: ProgressIndicator(),
      );

    if (object.length == 0)
      return Center(
        child: Text("Nenhum item encontrado"),
      );

    return callback();
  }
}
