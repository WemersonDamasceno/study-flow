import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/usecases/user/save_user_usecase.dart';

part 'save_user_local_storage_event.dart';
part 'save_user_local_storage_state.dart';

@injectable
class SaveUserLocalStorageBloc
    extends Bloc<SaveUserLocalStorageEvent, SaveUserLocalStorageState> {
  final SaveUserUsecase _saveUserUsecase;

  SaveUserLocalStorageBloc({required SaveUserUsecase saveUserUsecase})
      : _saveUserUsecase = saveUserUsecase,
        super(const SaveUserLocalStorageState()) {
    on<SaveUserLocalStorage>(_saveUser);
  }

  _saveUser(
    SaveUserLocalStorage event,
    Emitter<SaveUserLocalStorageState> emit,
  ) async {
    emit(const SaveUserLocalStorageState(status: StatusEnum.loading));

    final failureOrSuccess = await _saveUserUsecase(
      SaveUserParams(user: event.userEntity),
    );

    failureOrSuccess.fold(
      (failure) {
        emit(const SaveUserLocalStorageState(status: StatusEnum.error));
      },
      (success) {
        emit(const SaveUserLocalStorageState(status: StatusEnum.initial));
        emit(SaveUserLocalStorageState(
          status: StatusEnum.success,
          userEntity: success,
        ));
      },
    );
  }
}
