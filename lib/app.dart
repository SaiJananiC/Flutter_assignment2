import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:assignmentt_2/redux/reducer.dart';
import 'package:assignmentt_2/redux/store.dart';
import 'package:assignmentt_2/screens/input/input.dart';
import 'package:assignmentt_2/screens/landing/landing.dart';
import 'package:redux/redux.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late BuildContext appStateContext;
  final Store<AppState> _store = Store(
    reducers,
    initialState: AppState.initial(),
  );

  @override
  Widget build(BuildContext) {
    return StoreProvider<AppState>(
      store: _store,
      child: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          appStateContext = context;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              Landing.routeName: (context) => Landing(),
              Input.routeName: (context) => Input(),
            },
          );
        },
      ),
    );
  }
}
