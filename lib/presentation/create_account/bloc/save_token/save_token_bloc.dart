import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/usecases/save_token_in_local_storage_usecase.dart';

part 'save_token_event.dart';
part 'save_token_state.dart';

@injectable
class SaveTokenBloc extends Bloc<SaveTokenEvent, SaveTokenState> {
  final SaveTokenInLocalStorageUsecase _saveTokenInLocalStorageUsecase;

  SaveTokenBloc(
      {required SaveTokenInLocalStorageUsecase saveTokenInLocalStorageUsecase})
      : _saveTokenInLocalStorageUsecase = saveTokenInLocalStorageUsecase,
        super(const SaveTokenState()) {
    on<SaveToken>(_saveToken);
  }

  Future<void> _saveToken(
    SaveToken event,
    Emitter<SaveTokenState> emit,
  ) async {
    emit(const SaveTokenState(status: StatusEnum.loading));

    final failureOrSuccess = await _saveTokenInLocalStorageUsecase(
      SaveTokenInLocalStorageParams(token: event.token),
    );

    failureOrSuccess.fold(
      (failure) {
        emit(const SaveTokenState(status: StatusEnum.error));
      },
      (success) {
        emit(const SaveTokenState(status: StatusEnum.initial));
        emit(const SaveTokenState(status: StatusEnum.success));
      },
    );
  }
}
