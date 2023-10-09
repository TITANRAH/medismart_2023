import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'checkbox_provider.g.dart';

@Riverpod(keepAlive: true)
class CheckOne extends _$CheckOne {
  @override
  bool build() {
    return false;
  }

  void changeCheckBoolOne() {
    state = !state;
  }

  void changeCheckorTrue() {
    state = true;
  }

  void changeCheckorFalse() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
class CheckTwo extends _$CheckTwo {
  @override
  bool build() {
    return false;
  }

  void changeCheckBoolTwo() {
    state = !state;
  }

  void changeCheckorTrue() {
    state = true;
  }

  void changeCheckorFalse() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
class CheckThree extends _$CheckThree {
  @override
  bool build() {
    return false;
  }

  void changeCheckBoolThree() {
    state = !state;
  }

  void changeCheckorTrue() {
    state = true;
  }

  void changeCheckorFalse() {
    state = false;
  }
}

@Riverpod(keepAlive: true)
class CheckAll extends _$CheckThree {
  @override
  bool build() {
    return false;
  }

  void changeCheckBoolAll() {
    state = !state;
    if (state) {
      ref.read(checkOneProvider.notifier).changeCheckorTrue();
      ref.read(checkTwoProvider.notifier).changeCheckorTrue();
      ref.read(checkThreeProvider.notifier).changeCheckorTrue();
    } else {
      ref.read(checkOneProvider.notifier).changeCheckorFalse();
      ref.read(checkTwoProvider.notifier).changeCheckorFalse();
      ref.read(checkThreeProvider.notifier).changeCheckorFalse();
    }
  }
}
