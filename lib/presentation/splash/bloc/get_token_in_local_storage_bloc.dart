import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/usecases/get_token_in_local_storage_usecase.dart';

part 'get_token_in_local_storage_event.dart';
part 'get_token_in_local_storage_state.dart';

@injectable
class GetTokenInLocalStorageBloc
    extends Bloc<GetTokenInLocalStorageEvent, GetTokenInLocalStorageState> {
  final GetTokenInLocalStorageUsecase _getUserInLocalStorageUsecase;

  GetTokenInLocalStorageBloc(
      {required GetTokenInLocalStorageUsecase getUserInLocalStorageUsecase})
      : _getUserInLocalStorageUsecase = getUserInLocalStorageUsecase,
        super(const GetTokenInLocalStorageState()) {
    on<GetUserInLocalStorage>(_getUserInLocalStorage);
  }
  void _getUserInLocalStorage(GetUserInLocalStorage event,
      Emitter<GetTokenInLocalStorageState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess = await _getUserInLocalStorageUsecase(NoParams());

    await Future.delayed(const Duration(seconds: 3));

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(status: StatusEnum.error));
      },
      (userEntity) {
        emit(state.copyWith(status: StatusEnum.initial));

        emit(state.copyWith(
          status: userEntity != null ? StatusEnum.success : StatusEnum.empty,
          token: userEntity,
        ));
      },
    );
  }
}
