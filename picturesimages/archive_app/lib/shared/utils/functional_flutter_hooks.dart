import 'package:flutter/src/foundation/diagnostics.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProplessFunctionalWidget extends HookWidget {
  final ProplessWidgetFunction buildFunction;

  const ProplessFunctionalWidget(this.buildFunction, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) => buildFunction(context, key: key);
}
typedef ProplessWidgetFunction = Widget Function(BuildContext context,
    {Key key});

typedef ProplessWidgetCallback = ProplessFunctionalWidget Function({Key key});

ProplessWidgetCallback proplessFunctionalWidget(
        ProplessWidgetFunction builder) =>
    ({Key key}) => new ProplessFunctionalWidget(
          builder,
          key: key,
        );

class FunctionalWidget {
  FunctionalWidget._();
  static ProplessWidgetCallback create(ProplessWidgetFunction builder) =>
      proplessFunctionalWidget(builder);
}
