// Here is where this gets REALLY WEIRD: Removing the last character of the
// class comment fixes the issue. It seems to be tied to the length of the
// comment, as I replaced the last character with some others and it still
// breaks the compiler. Same adding more characters to the comment.

/// asdasdadasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasda.
///
/// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
/// asdladkadlaldskalsdkalsdka2
class DynamicDispatchRegistry<B, T extends Function> {
  /// The map from a concrete [Type] to a [T] function.
  final _registry = <Type, T>{};

  /// Constructs and empty registry.
  DynamicDispatchRegistry();

  /// True if the registry has no registered functions.
  bool get isEmpty => _registry.isEmpty;

  /// Registers a [function] for [type].
  ///
  /// If [type] was already registered, it is replaced and the old registered
  /// [fucntion] is returned. Otherwise it returns null.
  T register(Type type, T function) {
    final old = _registry[type];
    _registry[type] = function;
    return old;
  }

  /// Removes the [T] function registered for [type].
  ///
  /// Returns the registered [T] function for [type] or null if there was no
  /// function registered.
  T unregister(Type type) {
    return _registry.remove(type);
  }

  /// Gets the registered function [T] for [instance.runtimeType].
  ///
  /// If there is no registered function, then null is returned.
  T getFunction(B instance) => _registry[instance.runtimeType];
}
