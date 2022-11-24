import '../../../common/state/view_data_state.dart';

class {{name.pascalCase()}}State {
  final ViewData {{name.camelCase()}}State;

  const {{name.pascalCase()}}State({
    required this.{{name.camelCase()}}State,
  });

  {{name.pascalCase()}}State copyWith({
    ViewData? {{name.camelCase()}}State,
  }) {
    return {{name.pascalCase()}}State(
      {{name.camelCase()}}State: {{name.camelCase()}}State ?? this.{{name.camelCase()}}State,
    );
  }
}
