import 'package:different_blocs/constant.dart';
import 'package:different_blocs/manager/counter/counter_bloc.dart';
import 'package:different_blocs/manager/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CounterBloc(),
        child: Scaffold(
          appBar: AppBar(
            title:
                BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    context.read<ThemeBloc>().add(ChangeThemeEvent());
                  },
                  icon: context.read<ThemeBloc>().isDark
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode));
            }),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocConsumer<CounterBloc, CounterStates>(
                    listener: (context, state) {
                  if (state is UpdateCounterNumberState) {
                    if (state.updatedNumber == 10||state.updatedNumber==-10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("${state.updatedNumber}")));
                    }
                  }
                }, builder: (context, state) {
                  if (state is UpdateCounterNumberState) {
                    _counter = state.updatedNumber;
                  }
                  return Text(
                    '$_counter',
                    style: TextStyle(fontSize: 18),
                  );
                }),
              ],
            ),
          ),
          floatingActionButton: BlocBuilder<CounterBloc, CounterStates>(
              builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              spacing: 12,
              children: [
                FloatingActionButton(
                  heroTag: 'Fat1',
                  onPressed: () {
                    context.read<CounterBloc>().changeCounter(_counter,
                        pickedOperation: PickedOperation.add);
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  heroTag: 'Fat2',
                  onPressed: () {
                    context.read<CounterBloc>().changeCounter(_counter,
                        pickedOperation: PickedOperation.subtract);
                  },
                  tooltip: 'Decreament',
                  child: const Icon(Icons.minimize_outlined),
                ),
              ],
            );
          }),
        ));
  }
}
