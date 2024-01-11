import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/usecases/user/get_user_usecase.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

@injectable
class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  final GetUserUsecase _getUserUsecase;

  GetUserBloc({required GetUserUsecase getUserUsecase})
      : _getUserUsecase = getUserUsecase,
        super(const GetUserState()) {
    on<GetUser>(_getUser);
  }

  _getUser(GetUser event, Emitter<GetUserState> emit) async {
    emit(const GetUserState(status: StatusEnum.loading));

    final failureOrSuccess = await _getUserUsecase(
      GetUserParams(idUser: event.idUser),
    );

    failureOrSuccess.fold(
      (failure) {
        emit(const GetUserState(status: StatusEnum.error));
      },
      (success) {
        emit(const GetUserState(status: StatusEnum.initial));
        emit(GetUserState(
          status: StatusEnum.success,
          userEntity: success,
        ));
      },
    );
  }
}
