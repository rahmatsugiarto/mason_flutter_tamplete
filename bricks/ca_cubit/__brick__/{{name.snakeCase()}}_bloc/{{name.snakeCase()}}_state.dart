import '../../../common/state/view_data_state.dart';

class {{name.pascalCase()}}State {
  final ViewData<DATA ENTITY> {{name.camelCase()}}State;

  const {{name.pascalCase()}}State({
    required this.{{name.camelCase()}}State,
  });

  {{name.pascalCase()}}State copyWith({
    ViewData<DATA ENTITY>? {{name.camelCase()}}State,
  }) {
    return {{name.pascalCase()}}State(
      {{name.camelCase()}}State: {{name.camelCase()}}State ?? this.{{name.camelCase()}}State,
    );
  }
}
