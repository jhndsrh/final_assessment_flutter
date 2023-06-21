import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberBloc extends Bloc<int, List<dynamic>> {
  NumberBloc() : super([]);

  @override
  Stream<List<dynamic>> mapEventToState(int event) async* {
    if (event == 9) {
      yield* generateSequentialNumbers(event);
    } else if (event == 5) {
      yield* generateDescendingNumbers(event);
    } else if (event == 6) {
      yield* generateIncrementalNumbers(event);
    } else if (event == 10) {
      yield* generateSpecialNumbers(event);
    }
  }

  Stream<List<dynamic>> generateSequentialNumbers(int event) async* {
    List<int> result = [];
    for (int i = 1; i <= event; i++) {
      result.add(i);
    }
    yield result;
  }

  Stream<List<dynamic>> generateDescendingNumbers(int event) async* {
    List<int> result = [];
    // if (event > 0) {
    for (int i = 1; i <= event; i++) {
      result.add(i);
    }
    for (int i = event - 1; i >= 1; i--) {
      result.add(i);
    }
    // }
    yield result;
  }

  Stream<List<int>> generateIncrementalNumbers(int event) async* {
    List<int> result = [];
    int N = event;
    int initialNumber = 10;
    int increment = 11;

    for (int i = 0; i < N; i++) {
      int number = initialNumber + (i * increment);
      result.add(number);
    }

    yield result;
  }

  Stream<List<dynamic>> generateSpecialNumbers(int event) async* {
    List<dynamic> result = [];

    for (int i = 1; i <= event; i++) {
      if (i % 5 == 0) {
        result.add('LIMA');
      } else if (i % 7 == 0) {
        result.add('TUJUH');
      } else {
        result.add(i);
      }
    }

    yield result;
  }
}


// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NumberBloc extends Bloc<int, List<dynamic>> {
//   NumberBloc() : super([]);

//   @override
//   Stream<List<dynamic>> mapEventToState(int event) async* {
//     List<int> result = [];
//     for (int i = 1; i <= event; i++) {
//       result.add(i);
//     }
//     yield result;
//   }
// }

//   Stream<List<i>> mapEventToState(int event) async* {
//     List<int> result = [];
//     if (event > 0) {
//       for (int i = 1; i <= event; i++) {
//         result.add(i);
//       }
//       for (int i = event - 1; i >= 1; i--) {
//         result.add(i);
//       }
//     }
//     yield result;
//   }
// }
//   Stream<List<int>> mapEventToState(int event) async* {
//     List<int> result = [];
//     int N = event;
//     int initialNumber = 10;
//     int increment = 11;

//     for (int i = 0; i < N; i++) {
//       int number = initialNumber + (i * increment);
//       result.add(number);
//     }

//     yield result;
//   }
// }

//   Stream<List<dynamic>> mapEventToState(int event) async* {
//     List<dynamic> result = [];

//     for (int i = 1; i <= event; i++) {
//       if (i % 5 == 0) {
//         result.add('LIMA');
//       } else if (i % 7 == 0) {
//         result.add('TUJUH');
//       } else {
//         result.add(i);
//       }
//       yield result;
//     }
//   }
// }
