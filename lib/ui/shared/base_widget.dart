import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewmodel, Widget child)
      builder;
  final T viewmodel;
  final Widget child;
  final Function(T) onViewModelReady;

  const BaseWidget(
      {Key key,
      this.builder,
      this.viewmodel,
      this.onViewModelReady,
      this.child})
      : super(key: key);

  @override
  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T viewmodel;

  @override
  void initState() {
    viewmodel = widget.viewmodel;

    if (widget.onViewModelReady != null) {
      widget.onViewModelReady(viewmodel);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
