import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/core/usecase/usecases.dart';
import 'package:study_flow/domain/usecases/token/get_token_in_local_storage_usecase.dart';

part 'get_token_event.dart';
part 'get_token_state.dart';

@injectable
class GetTokenBloc extends Bloc<GetTokenEvent, GetTokenState> {
  final GetTokenInLocalStorageUsecase _getUserInLocalStorageUsecase;

  GetTokenBloc(
      {required GetTokenInLocalStorageUsecase getUserInLocalStorageUsecase})
      : _getUserInLocalStorageUsecase = getUserInLocalStorageUsecase,
        super(const GetTokenState()) {
    on<GetToken>(_getUserInLocalStorage);
  }
  void _getUserInLocalStorage(
      GetToken event, Emitter<GetTokenState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess = await _getUserInLocalStorageUsecase(NoParams());

    await Future.delayed(const Duration(seconds: 3));

    failureOrSuccess.fold(
      (failure) {
        emit(state.copyWith(status: StatusEnum.error));
      },
      (token) {
        emit(state.copyWith(status: StatusEnum.initial));

        emit(state.copyWith(
          status: token != null ? StatusEnum.success : StatusEnum.empty,
          token: token,
        ));
      },
    );
  }
}
