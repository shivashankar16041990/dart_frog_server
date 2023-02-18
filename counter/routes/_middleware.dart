import 'package:dart_frog/dart_frog.dart';
 int _count=0;
 Handler middleware(Handler handler){
return handlerWith<int>(value:++_count, handler: handler);

}

//handy method
Handler handlerWith<T extends Object>({required T value,required Handler handler}){
   return handler.use(provider<T> ((handler) =>value));

 }





