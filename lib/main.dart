import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tutorialapp/pages/sigin_in/sign_in.dart';
import 'package:tutorialapp/pages/welcome/welcome.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => Welcome(),
        "signIn": (context) => SignIn(), // the name of the function
      },
    );
  }
}

final appCount = StateProvider<int>((ref) {
  //defining my stateProver which is used for the text increment
  return 1; //setting your default count variable
});

class MyHomePage extends ConsumerWidget {
  // change this form StatefulWidget to ConsumerWidget
  const MyHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(
        appCount); // defining your count variable with the widgetRef increment
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("RiverPod App"), // name of the app
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                count.toString(), // displaying your count value
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          // creating buttons in rows
          mainAxisAlignment: MainAxisAlignment
              .spaceAround, //creating space between the buttons
          children: [
            FloatingActionButton(
              //first button
              heroTag: "one",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const SecondPage())); // function to go to the nextpage
              },
              tooltip: 'Increment',
              child: const Icon(Icons
                  .arrow_right_rounded), //indicating that it should go to the next page
            ),

            FloatingActionButton(
              //second button
              heroTag: "two",
              onPressed: () {
                ref
                    .read(appCount.notifier)
                    .state++; // incrementing your count value
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods. // This trailing comma makes auto-formatting nicer for build methods.
          ],
        ));
  }
}

// linking my page to the second page
class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int count = ref.watch(
        appCount); // this is defined to have access to my count result from page 1
    return Scaffold(
      appBar: AppBar(), //creating the header value
      body: Center(
        child: Text("$count",
            style: TextStyle(fontSize: 30)), // settting the font size
      ),
    );
  }
}