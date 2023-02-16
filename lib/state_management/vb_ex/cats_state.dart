import 'package:bloc_ex/state_management/vb_ex/cat.dart';
import 'package:flutter/foundation.dart';

abstract class CatsState {
  const CatsState();
}

class CatsInitial extends CatsState {
  const CatsInitial();
}

// Tek tek senaryolar için classlar oluşturuldu. yükleme başarılı yükleme, yüklememe error verme diye
class CatsLoading extends CatsState {
  const CatsLoading();
}

class CatsCompleted extends CatsState {
  final List<Cat> response; //Liste şeklinde bir cevap döndürmek için konuldu
  // Provider'daki IsLoading mantığı gibi çalışıyor.

  const CatsCompleted(this.response);
  //Equality Functions:
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CatsCompleted && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class CatsError extends CatsState {
  final String message;
  const CatsError(this.message);
}
