import 'dart:async';

mixin Validators {
  final validateEmail =
      StreamTransformer<String,String>.fromHandlers(handleData:(value, sink){
        if (value.contains('@')){
          sink.add(value);
        } else {
          sink.addError("Gunakan format email yang benar");
        }
      });
  
  
  final validateName =
      StreamTransformer<String,String>.fromHandlers(handleData:(value, sink){
        if(value.contains(' ')) {
          sink.add(value);
        } else {
          sink.addError("Nama minimal 2 suku kata");
        }
      });

  
  final validatePassword =
      StreamTransformer<String,String>.fromHandlers(handleData:(value, sink){
        if (value.length > 7) {
          sink.add(value);
        } else {
          sink.addError("Kata sandi harus minimal 8 huruf");
        }
      });
}