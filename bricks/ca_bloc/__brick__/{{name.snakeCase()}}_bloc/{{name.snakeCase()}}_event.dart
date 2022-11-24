abstract class {{name.pascalCase()}}Event {
  const {{name.pascalCase()}}Event();
}

//example event
// class SignIn extends SignInEvent {
//   final AuthRequestEntity authRequestEntity;

//   const SignIn({required this.authRequestEntity});

//   @override
//   List<Object?> get props => [authRequestEntity];
// }