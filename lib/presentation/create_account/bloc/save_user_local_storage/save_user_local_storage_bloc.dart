import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'save_user_local_storage_event.dart';
part 'save_user_local_storage_state.dart';

class SaveUserLocalStorageBloc
    extends Bloc<SaveUserLocalStorageEvent, SaveUserLocalStorageState> {
  SaveUserLocalStorageBloc() : super(SaveUserLocalStorageInitial()) {
    on<SaveUserLocalStorageEvent>((event, emit) {
      // implement event handler
    });
  }
}
