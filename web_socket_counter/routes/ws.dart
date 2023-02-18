import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

import '../counter_cubit/counter_cubit.dart';

Future<Response> onRequest(RequestContext context) async {
final handler=webSocketHandler((channel, protocol) {
  final cubit=context.read<Counter_cubit>()..subscribe(channel);
  channel.sink.add("${cubit.state}");
  channel.stream.listen((event) {
    switch(event){
      case "inc":

          cubit.incerement();
        break;
      case "dec":

          cubit.decreament();
          break;


      default:
        break;
    }



  });
  
  

 
  


});
return handler(context);

}