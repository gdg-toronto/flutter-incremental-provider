import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        builder: (_) => CounterModel(),
        child: MyHomePage(title: 'Flutter Demo Home Page')
      )
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}


class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counterModel.counter}',
              style: Theme.of(context).textTheme.display1,
            ),
            Consumer<CounterModel>(
              builder: (_, counterModel2, __) =>
              Text(
                '${counterModel2.counter}',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterModel.increment();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
// Alternatively
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Provider.of<CounterModel>(context).increment();
//        },
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
    );
  }
}
