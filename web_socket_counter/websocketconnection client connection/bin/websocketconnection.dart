import 'package:websocketconnection/websocketconnection.dart' as websocketconnection;
import 'package:web_socket_channel/web_socket_channel.dart';
void main() async{
  final uri=Uri.parse('ws://localhost:8080/ws');
  final handler=WebSocketChannel.connect(uri);
  handler.stream.listen(print,onDone: (){print("disconnected from client");});
  await Future.delayed(Duration(seconds: 2));
  handler.sink.add("inc");
  await  Future.delayed(Duration(seconds: 2));
  handler.sink.add("inc");
  await  Future.delayed(Duration(seconds: 2));
  handler.sink.add("inc");
  await  Future.delayed(Duration(seconds: 2));

  handler.sink.add("dec");
  await  Future.delayed(Duration(seconds: 2));
  handler.sink.close();

}