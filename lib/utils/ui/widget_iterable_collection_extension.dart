extension WidgetIterableCollectionExtension<Widget> on Iterable<Widget> {
  Iterable<Widget> separateWith([Widget? widget]) sync* {
    if (widget == null) {
      yield* this;
      return;
    }

    final int len = length;

    if (len == 1) {
      yield* this;
      return;
    }

    int count = 0;
    final Iterator<Widget> it = iterator;
    while (it.moveNext()) {
      count++;
      yield it.current;
      if (count != len) yield widget;
    }
  }

  /// Adds one or more widgets to the beginning.
  ///
  /// ```dart
  /// List<Widget> arr = [ D(), E(), F() ];
  ///
  /// print(
  ///   arr.unshift( widget: A() )
  /// ); // [ A(), D(), E(), F() ]
  ///
  /// print(
  ///   arr.unshift(widgets: [ A(), B(), C() ])
  /// ); // [ A(), B(), C(), D(), E(), F() ]
  ///
  /// print(
  ///   arr.unshift(
  ///     widget: S(),
  ///     widgets: [ A(), B(), C() ]
  ///   )
  /// ); // [ S(), A(), B(), C(), D(), E(), F() ]
  /// ```
  Iterable<Widget> unshift({
    Widget? widget,
    List<Widget> widgets = const [],
  }) sync* {
    if (widget != null) yield widget;

    if (widgets.isNotEmpty) yield* widgets;

    yield* this;
  }

  /// Adds one or more widgets to the end.
  ///
  /// ```dart
  /// List<Widget> arr = [ D(), E(), F() ];
  ///
  /// print(
  ///   arr.push( widget: A() )
  /// ); // [ D(), E(), F(), A() ]
  ///
  /// print(
  ///   arr.unshift(widgets: [ A(), B(), C() ])
  /// ); // [ D(), E(), F(), A(), B(), C() ]
  ///
  /// print(
  ///   arr.unshift(
  ///     widget: S(),
  ///     widgets: [ A(), B(), C() ]
  ///   )
  /// ); // [ D(), E(), F(), S(), A(), B(), C() ]
  /// ```
  Iterable<Widget> push({
    Widget? widget,
    List<Widget> widgets = const [],
  }) sync* {
    yield* this;

    if (widget != null) yield widget;

    if (widgets.isNotEmpty) yield* widgets;
  }
}

extension IterableOfWidgetIterableCollectionExtension<Widget> on Iterable<Iterable<Widget>> {
  Iterable<Widget> flatAndSeparateWith([Widget? widget]) sync* {
    if (widget == null) {
      yield* expand((e) => e);
      return;
    }

    final int len = length;

    if (len == 1) {
      yield* expand((e) => e);
      return;
    }

    int count = 0;
    final Iterator<Iterable<Widget>> it = iterator;
    while (it.moveNext()) {
      count++;
      yield* it.current;
      if (count != len) yield widget;
    }
  }
}
