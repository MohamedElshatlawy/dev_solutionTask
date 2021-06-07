import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:money_app/core/util/generate_screen.dart';
import 'package:money_app/feature/accounts/provider/accounts_provider.dart';
import 'package:money_app/feature/budgets/provider/budget_provider.dart';
import 'package:money_app/feature/budgets/ui/page/budgets_page.dart';
import 'package:money_app/feature/payees/provider/payees_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>BudgetProvider()),
        ChangeNotifierProvider(create: (context)=>AccountsProvider()),
        ChangeNotifierProvider(create: (context)=>PayeesProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
          initialRoute: NameScreen.BUDGETS_PAGE,
          onGenerateRoute: GenerateScreen.onGenerate
      ),
    );
  }
}


/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<BudgetProvider>(context, listen: false).getBudgets();
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    List customers = [];
    customers.add(Customer('Jack', 23));
    customers.add(Customer('Adam', 27));
    customers.add(Customer('Katherin', 25));

    customers.sort((b, a) => a.age.compareTo(b.age));
    print('Sort by Age: ' + customers.toString());

    customers.sort((a, b) => a.name.compareTo(b.name));
    print('Sort by Name: ' + customers.toString());
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}*/
