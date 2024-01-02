import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_flow/core/enums/shared_pref_keys_enum.dart';
import 'package:study_flow/core/enums/status_enum.dart';
import 'package:study_flow/presentation/splash/bloc/get_user_in_local_storage_bloc.dart';
import 'package:study_flow/presentation/splash/mixins/splash_mixin.dart';
import 'package:study_flow/presentation/splash/widgets/error_screen_widget.dart';
import 'package:study_flow/presentation/splash/widgets/success_screen_widget.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SplashMixin {
  late GetUserInLocalStorageBloc _getUserInLocalStorageBloc;

  @override
  void initState() {
    super.initState();

    _getUserInLocalStorageBloc =
        BlocProvider.of<GetUserInLocalStorageBloc>(context)
          ..add(GetUserInLocalStorage(
            key: SharedPrefKeysEnum.token.name,
          ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            BlocConsumer<GetUserInLocalStorageBloc, GetUserInLocalStorageState>(
          bloc: _getUserInLocalStorageBloc,
          listener: (context, state) {
            final stateIsDifferentFromError =
                state.status == StatusEnum.success ||
                    state.status == StatusEnum.empty;

            if (stateIsDifferentFromError) {
              navigationPage(hasToken: stateIsDifferentFromError);
            }
          },
          builder: (context, state) {
            switch (state.status) {
              case StatusEnum.error:
                return const Center(
                  child: ErrorScreenWidget(
                    key: ValueKey("error_screen_widget"),
                  ),
                );

              default:
                return const SuccessScreenWidget(
                  key: ValueKey("success_screen_widget"),
                );
            }
          },
        ),
      ),
    );
  }
}
