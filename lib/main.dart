import 'package:desafio_frontend_wattio/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'infra/cubit/account_value_cubit.dart';
import 'infra/cubit/offer_cubit.dart';
import 'infra/cubit/offers_cubit.dart';
import 'infra/cubit/selected_offer_cubit.dart';
import 'infra/cubit/show_economy_cubit.dart';
import 'infra/cubit/show_offers_cubit.dart';
import 'infra/logger/custom_logger.dart';
import 'infra/provider/text_field_controller_provider.dart';
import 'models/cooperative.dart';

void main() {
  runApp(const EnergyApp());
}

class EnergyApp extends StatefulWidget {
  const EnergyApp({super.key});

  @override
  State<EnergyApp> createState() => _EnergyAppState();
}

class _EnergyAppState extends State<EnergyApp> {
  late List<CooperativeModel> _cooperativeList;

  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<String> _loadJson() async {
    return rootBundle.loadString('assets/cooperatives.json');
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AccountValueCubit()),
        BlocProvider(create: (_) => SelectedOfferCubit()),
        BlocProvider(create: (_) => ShowOffersCubit()),
        BlocProvider(create: (_) => ShowEconomyCubit()),
        BlocProvider(create: (_) => OffersCubit()),
        BlocProvider(create: (_) => OfferCubit()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: TextFieldControllerProvider(1000),
          ),
        ],
        child: MaterialApp(
          title: 'Economia de Energia',
          theme: ThemeData.dark().copyWith(
            primaryColor: Colors.green,
            scaffoldBackgroundColor: Color(0xFF1E252A),
          ),
          home: FutureBuilder(
            future: _loadJson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                CustomLogger.logInfo(snapshot.data);
                _cooperativeList = cooperativeListFromJson(
                  snapshot.data.toString(),
                );
                return HomeScreen(cooperativeList: _cooperativeList);
              } else {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.red,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

// class EnergyApp extends StatelessWidget {
//   const EnergyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Economia de Energia',
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Colors.green,
//         scaffoldBackgroundColor: Color(0xFF1E252A),
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
