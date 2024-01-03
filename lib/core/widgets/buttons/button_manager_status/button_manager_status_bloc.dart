import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:study_flow/core/enums/status_enum.dart';

part 'button_manager_status_event.dart';
part 'button_manager_status_state.dart';

@injectable
class ButtonManagerStatusBloc
    extends Bloc<ButtonManagerStatusEvent, ButtonManagerStatusState> {
  ButtonManagerStatusBloc() : super(const ButtonManagerStatusState()) {
    on<ButtonManagerStatus>(_changeStatusButton);
  }

  void _changeStatusButton(
    ButtonManagerStatus event,
    Emitter<ButtonManagerStatusState> emit,
  ) {
    emit(state.copyWith(status: event.status));
  }
}
