import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/domain/entities/user_entity.dart';
import 'package:study_flow/domain/usecases/get_user_in_local_storage_usecase.dart';

part 'get_user_in_local_storage_event.dart';
part 'get_user_in_local_storage_state.dart';

@injectable
class GetUserInLocalStorageBloc
    extends Bloc<GetUserInLocalStorageEvent, GetUserInLocalStorageState> {
  final GetUserInLocalStorageUsecase _getUserInLocalStorageUsecase;

  GetUserInLocalStorageBloc(
      {required GetUserInLocalStorageUsecase getUserInLocalStorageUsecase})
      : _getUserInLocalStorageUsecase = getUserInLocalStorageUsecase,
        super(const GetUserInLocalStorageState()) {
    on<GetUserInLocalStorage>(_getUserInLocalStorage);
  }
  void _getUserInLocalStorage(GetUserInLocalStorage event,
      Emitter<GetUserInLocalStorageState> emit) async {
    emit(state.copyWith(status: StatusEnum.loading));

    final failureOrSuccess = await _getUserInLocalStorageUsecase(
      GetUserInLocalParams(key: event.key),
    );

    await Future.delayed(const Duration(seconds: 3));

    failureOrSuccess.fold(
      (failure) {
        return emit(state.copyWith(status: StatusEnum.error));
      },
      (userEntity) {
        return emit(state.copyWith(
          status: userEntity != null ? StatusEnum.success : StatusEnum.empty,
          userEntity: userEntity,
        ));
      },
    );
  }
}
