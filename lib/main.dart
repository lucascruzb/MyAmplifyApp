import 'dart:async';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

import 'amplify_outputs.dart';
import 'models/ModelProvider.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await _configureAmplify();
    runApp(const MyApp());
  } on AmplifyException catch (e) {
    runApp(Text("Error configuring Amplify: ${e.message}"));
  }
}

Future<void> _configureAmplify() async {
  try {
    final api = AmplifyAPI(
        options: APIPluginOptions(modelProvider: ModelProvider.instance));
    await Amplify.addPlugins([api]);
    await Amplify.configure(amplifyConfig);

    safePrint('Successfully configured Amplify');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> _Posts = [];
  StreamSubscription<GraphQLResponse<Post>>? subscription;

  @override
  void initState() {
    super.initState();
    _refreshTodos();
    _subscribe();
  }

  @override
  void dispose() {
    _unsubscribe();
    super.dispose();
  }

  void _subscribe() {
    final operation = Amplify.API.subscribe(
      ModelSubscriptions.onCreate(Post.schem),
    );
    subscription = operation.listen(
      (event) {
        safePrint('Subscription event data received: ${event.data}');
        setState(() {
          _Posts.add(event.data!);
        });
      },
      onError: (Object e) => safePrint('Error in subscription stream: $e'),
    );
  }

  Future<void> _refreshTodos() async {
    try {
      final request = ModelQueries.list(Post.schem);
      final response = await Amplify.API.query(request: request).response;

      final posts = response.data?.items;
      if (response.hasErrors) {
        safePrint('errors: ${response.errors}');
        return;
      }
      setState(() {
        safePrint(posts);
        _Posts = posts!.whereType<Post>().toList();
      });
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
    }
  }

  void _unsubscribe() {
    subscription?.cancel();
    subscription = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your todos',
            ),
            _Posts.isEmpty == true
                ? const Center(
                    child: Text(
                      "The list is empty.\nAdd some items by clicking the floating action button.",
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _Posts.length,
                    itemBuilder: (context, index) {
                      final todo = _Posts[index];
                      return CheckboxListTile.adaptive(
                        value: todo.isDone,
                        title: Text(todo.content!),
                        onChanged: (isChecked) async {},
                      );
                    }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTodo = Todo(content: "New Flutter todo", isDone: false);
          final request = ModelMutations.create(newTodo);
          final response = await Amplify.API.mutate(request: request).response;
          if (response.hasErrors) {
            safePrint('Creating Todo failed.');
          } else {
            safePrint('Creating Todo successful.');
          }
        },
        tooltip: 'Add todo',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
