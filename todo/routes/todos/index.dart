import 'dart:async';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:todos_data_source/todos_data_source.dart';
FutureOr<Response> onRequest(RequestContext context) async {




  switch (context.request.method) {
    case HttpMethod.get:
      return _get(context);
    case HttpMethod.post:
      return _post(context);
    case HttpMethod.delete:
    case HttpMethod.head:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.put:
      return Response(statusCode: HttpStatus.methodNotAllowed);
  }
}

Future<Response> _get(RequestContext context) async {
  final dataSource = context.read<TodosDataSource>();
  final todos = await dataSource.readAll();
  return Response.json(body: todos);
}

Future<Response> _post(RequestContext context) async {
 // return Response(body:"hi this is from _post");


  final dataSource = context.read<TodosDataSource>();
  final todo = Todo.fromJson(await context.request.json() as Map<String,dynamic>);
  final todocreated=await dataSource.create(todo);

/*return Response(body:  "id: ${todocreated.id} "
    "title: ${todocreated.title}");*/

   return Response.json(
     statusCode: HttpStatus.created,
   body: await dataSource.create(todo),
   );
}