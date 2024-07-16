import 'package:bloc/bloc.dart';
import 'package:chatinganfe/model/register_model.dart';
import 'package:chatinganfe/model/user_models.dart';
import 'package:chatinganfe/services/auth_services.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthRegister) {
        try {
          emit(AuthLoading());

          final user = await AuthService().register(event.data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }

        //  try {
        //   if (state is AuthSuccess) {
        //     final updateUser = (state as AuthSuccess).user.copywith(
        //           username: event.data.username,
        //           name: event.data.name,
        //           email: event.data.email,
        //           password: event.data.password,
        //         );
        //     emit(AuthLoading());
        //     await AuthService().register(event.data);

        //     emit(AuthSuccess(updateUser));
        //   }
        // } catch (e) {
        //   emit(AuthFailed(e.toString()));
        // }
      }
    });
  }
}
