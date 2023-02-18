import 'package:dart_frog/dart_frog.dart';

import '../counter_cubit/counter_cubit.dart';

Handler middleware(Handler handler){
  return
      handler.use(counterProvider);
  
  
  
}
