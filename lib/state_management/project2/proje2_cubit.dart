import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'dart:math' as math  show Random; // dart math kütüphanesinden sadece random komutu ile ilgilendiğini belirtme

part 'proje2_state.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit({required this.userList}) : super(null);
  final Iterable<String> userList;
  void getRandomName() => emit(userList.getRandomElement());
}


//Extension Nedir: Uygulamamıza esneklik sağlar.
// Var olan yapıyı bozmadan ona yeni bir yetenek kazandırmamızı sağlarlar. 
//Generic olarak alınan parametreyi içine "on"'dan sonra yazdırdı.
extension RandomElement<T> on Iterable<T> {
  // Buradaki <T> ne çeşit değişken türü  ile çalışacağını bilmediği için konuldu. "on" kısmındaki yer ise var olan yapıya yetenek kazandırmak için kullanılır.
  // Çalışma prensibi extension'ı hangi class'a yazıyorsanız yazdığınız extension içerisinde on 'dan sonraki yapıdan elde edilen bir instance veya abstract instance var.
  // Extension'da hangi değişkene yazıldığı bilinmediği için  ya da ona göre instance'ı değiştiği için
  // Hayali bir instance metodu olduğunu düşün. Elinde bir instance varmış gibi
  T getRandomElement() => elementAt(math.Random().nextInt(length));
   //nextInt içine statik bir sayı vermemeliyiz.Çünkü alabileceği liste dinamik olacaktır. 
   //O yüzden bir instance varmış gibi düşünme burada devreye giriyor.Gelenin 'length' ini al diyoruz.
   //En baştaki 'T' yerinde void vardı. Değiştirdik çünkü T generic değeri ifade ediyor.
  //Expression hali: () =>
  //Normal hali süslü parantez
}
