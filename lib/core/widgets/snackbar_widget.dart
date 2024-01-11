import 'package:flutter/material.dart';
import 'package:study_flow/core/widgets/buttons/widgets/button_main_widget.dart';

class SnackBarWidget {
  final BuildContext context;

  // snackbar properties
  final String labelSnackbar;
  final Color? snackbarBackgroundColor;
  final Color? snackbarFontColor;
  final IconData snackbarIcon;

  // button properties
  final String labelButton;
  final VoidCallback buttonCallback;
  final Color? buttonBackgroundColor;
  final Color? buttonFontColor;

  const SnackBarWidget({
    required this.context,
    required this.labelSnackbar,
    this.snackbarBackgroundColor,
    this.snackbarFontColor,
    required this.labelButton,
    required this.buttonCallback,
    required this.snackbarIcon,
    this.buttonBackgroundColor,
    this.buttonFontColor,
  });

  void show() {
    // closes the snackbar that is currently open
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        key: const ValueKey('snackbar-floating'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: snackbarBackgroundColor,
        margin: const EdgeInsets.only(
          left: 20,
          right: 10,
          bottom: 20,
        ),
        duration: const Duration(seconds: 5),
        content: SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                snackbarIcon,
                color: Colors.white,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: Text(
                  labelSnackbar,
                  style: TextStyle(
                    color: snackbarFontColor,
                    fontSize: 16,
                    fontFamily: "MPLUS1p-Bold.ttf",
                  ),
                ),
              ),
              SizedBox(
                width: 95,
                child: ButtonMainWidget(
                  onPressed: buttonCallback,
                  backgroundColor: buttonBackgroundColor,
                  child: Text(
                    labelButton,
                    style: TextStyle(
                      color: buttonFontColor,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
