import 'package:bloc/bloc.dart';
import 'package:chatinganfe/model/user_models.dart';
import 'package:chatinganfe/services/auth_services.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserList) {
        try {
          emit(UserLoading());
          final user = await AuthService().getUser();
          print(user);
          emit(UserSuccess(user));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
