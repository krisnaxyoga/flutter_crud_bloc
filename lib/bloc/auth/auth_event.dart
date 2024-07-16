part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthRegister extends AuthEvent {
  final RegisterModel data;
  const AuthRegister(this.data);
  @override
  // TODO: implement props
  List<Object> get props => [data];
}
