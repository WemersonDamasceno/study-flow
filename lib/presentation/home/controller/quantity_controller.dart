import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class QuantityController extends ChangeNotifier {
  int _quantity = 1;
  late Timer _timer;
  final _quantityController = TextEditingController(text: '1');

  late BuildContext _context;

  set context(BuildContext context) {
    _context = context;
  }

  get quantity => _quantity;
  get quantityController => _quantityController;
  get timer => _timer;

  setValueQuantityWorkforce({required int value}) {
    _quantity = value;
    _quantityController.text = _quantity.toString();
    _updateControllerValue();
  }

  incrementQuantity() {
    _quantity++;
    _updateControllerValue();
  }

  decrementQuantity() {
    if (_quantity > 0) {
      _quantity--;
      _updateControllerValue();
    }
  }

  continuousIncrement() => _timer = Timer.periodic(
        const Duration(milliseconds: 100),
        (timer) => incrementQuantity(),
      );

  continuousDecrement() => _timer = Timer.periodic(
        const Duration(milliseconds: 100),
        (timer) => decrementQuantity(),
      );

  timerCancel() {
    _timer.cancel();
    notifyListeners();
  }

  onChange(String value) {
    if (value.isEmpty) {
      _quantity = 0;
      _quantityController.text = _quantity.toString();
    }

    if (value.contains('.') || value.contains(',')) {
      _quantityController.text = value.replaceAll(".", "").replaceAll(",", "");
      FocusScope.of(_context).unfocus();
      return;
    }

    _quantity = num.parse(_quantityController.text.replaceAll(",", "")).toInt();
    _updateControllerValue();
  }

  _updateControllerValue() {
    _quantityController.text = _quantity.toString();
    //move the cursor to the end of the text
    _quantityController.selection = TextSelection.fromPosition(
      TextPosition(offset: _quantityController.text.length),
    );
    notifyListeners();
  }

  resetValues() {
    _quantity = 0;
    _quantityController.text = _quantity.toString();
    notifyListeners();
  }
}
