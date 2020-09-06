// Here is where this gets REALLY WEIRD: Removing the last character ("2") of
// the class comment fixes the issue. It seems to be tied to the length of the
// comment, as I replaced the last character with some others and it still
// breaks the compiler. Same adding more characters to the comment.
//
// I used "2" as the last character just for consistency, to know if you remove
// that one last, the compiler error goes away, but the "2" is not special.

/// asdasdadasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasdasda.
///
/// xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
/// asdladkadlaldskalsdkalsdka2
class DynamicDispatchRegistry<B, T extends Function> {
  final _registry = <Type, T>{};

  DynamicDispatchRegistry();

  // removing this getter will also fix the issue, no matter how I enlarge or
  // change the "problematic comments"
  // Removing the function or the comment altogether also fixes the issue.
  bool get isEmpty => _registry.isEmpty;

  // Same here, removing the last 2, fixes the issue, also seems length-related.
  // Removing the function or the comment altogether also fixes the issue.

  /// xxaasdadadadasdadadadadasdasa2
  T register(Type type, T function) {
    final old = _registry[type];
    _registry[type] = function;
    return old;
  }

  // This comment is much more subtle, I could only replace real words with
  // gibberish, but when changing the spaces it also fixes the issue, so it
  // doesn't seem to be exclusively length-related in this case.

  /// asda asd dgfdgdfgdf fnhgghjh hjj ghg ghjghjgjgjghjgjghjgjhg.
  ///
  /// xx dfdfd df wq xxxxxxx2
  T getFunction(B instance) => _registry[instance.runtimeType];
}
