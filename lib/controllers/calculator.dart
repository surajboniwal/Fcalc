import 'package:get/state_manager.dart';

enum Method { multiply, divide, subtract, add, percent, none, toggle }
enum State { firstDigit, secondDigit, continueCalculation }

class CalcController extends GetxController {
  var firstDigit = ''.obs;
  var method = Method.none.obs;
  var methodSign = ''.obs;
  var secondDigit = ''.obs;
  var result = ''.obs;
  var state = State.firstDigit;

  buttonPress(String id) {
    switch (id) {
      case 'ac':
        print('clear');
        firstDigit.value = '';
        secondDigit.value = '';
        method.value = Method.none;
        methodSign.value = '';
        state = State.firstDigit;
        result.value = '';
        break;
      case 'pn':
        print('Toggle');
        method.value = Method.toggle;
        toggleSign();
        break;
      case 'percent':
        print('percent');
        method.value = Method.percent;
        calculate();
        updateMethodSignAndState('assets/ic_percent.svg');
        break;
      case 'divide':
        print('divide');
        if (firstDigit.value == '') break;
        method.value = Method.divide;
        updateMethodSignAndState('assets/ic_divide.svg');
        break;
      case 'multiply':
        print('multiply');
        if (firstDigit.value == '') break;
        method.value = Method.multiply;
        updateMethodSignAndState('assets/ic_multiply.svg');

        break;
      case 'subtract':
        print('subtract');
        if (firstDigit.value == '') break;
        method.value = Method.subtract;
        updateMethodSignAndState('assets/ic_subtract.svg');

        break;
      case 'add':
        print('add');
        method.value = Method.add;
        if (firstDigit.value == '') break;
        updateMethodSignAndState('assets/ic_add.svg');
        break;
      case 'equal':
        print('equal');
        calculate();
        break;
      case 'backspace':
        print('backspace');
        backspace();
        break;
      case 'fullstop':
        addFullstop();
        break;
      default:
        if (state == State.firstDigit) {
          updateFirstDigit(int.parse(id));
        } else if (state == State.secondDigit) {
          updateSecondDigit(int.parse(id));
        } else if (state == State.continueCalculation) {
          firstDigit.value = result.value;
          result.value = '';
          secondDigit.value = '';
          updateSecondDigit(int.parse(id));
          state = State.secondDigit;
        }
    }
  }

  addFullstop() {
    if (state == State.firstDigit) {
      if (!firstDigit.value.contains('.')) {
        firstDigit.value = firstDigit.value + '.';
      }
    } else if (state == State.secondDigit) {
      if (!secondDigit.value.contains('.')) {
        secondDigit.value = secondDigit.value + '.';
      }
    }
  }

  backspace() {
    if (state == State.firstDigit) {
      firstDigit.value =
          firstDigit.value.substring(0, firstDigit.value.length - 1);
    } else if (state == State.secondDigit) {
      secondDigit.value =
          secondDigit.value.substring(0, secondDigit.value.length - 1);
    }
  }

  toggleSign() {
    if (state == State.firstDigit) {
      firstDigit.value = changeSign(firstDigit.value);
    } else if (state == State.secondDigit) {
      secondDigit.value = changeSign(secondDigit.value);
    } else if (state == State.continueCalculation) {
      result.value = changeSign(result.value);
    }
  }

  changeSign(value) {
    if ((double.parse(value) % 1) == 0) {
      return (double.parse(value) * -1).round().toString();
    } else {
      return (double.parse(value) * -1).toString();
    }
  }

  calculate() {
    var calculationResult = 0.0;
    if (firstDigit.value == '' || secondDigit.value == '') {
      return;
    }
    if (method.value == Method.divide) {
      calculationResult =
          (double.parse(firstDigit.value) / double.parse(secondDigit.value));
    } else if (method.value == Method.multiply) {
      calculationResult =
          (double.parse(firstDigit.value) * double.parse(secondDigit.value));
    } else if (method.value == Method.add) {
      calculationResult =
          (double.parse(firstDigit.value) + double.parse(secondDigit.value));
    } else if (method.value == Method.subtract) {
      calculationResult =
          (double.parse(firstDigit.value) - double.parse(secondDigit.value));
    } else if (method.value == Method.percent) {
      calculationResult =
          (double.parse(firstDigit.value) / double.parse(secondDigit.value)) *
              100;
      print(calculationResult);
    }
    var finalResult = calculationResult.toStringAsFixed(2);

    if (calculationResult % 1.0 == 0.0) {
      finalResult = calculationResult.round().toString();
    }
    if (finalResult == 'Infinity') finalResult = 'N/A';
    result.value = finalResult.toString();
    state = State.continueCalculation;
  }

  updateMethodSignAndState(asset) {
    if (firstDigit.value == '') return;
    methodSign.value = asset;
    if (state == State.continueCalculation && result.value != '') {
      firstDigit.value = result.value;
      secondDigit.value = '';
      result.value = '';
    } else {
      state = State.secondDigit;
    }
  }

  updateFirstDigit(number) {
    var temp = firstDigit.toString() + number.toString();
    firstDigit.value = temp;
  }

  updateSecondDigit(number) {
    var temp = secondDigit.toString() + number.toString();
    secondDigit.value = temp;
  }
}
