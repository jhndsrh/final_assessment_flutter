import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'number_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deret Angka',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NumberBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NumberBloc numberBloc = BlocProvider.of<NumberBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Deret Angka'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number/N',
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('N = 9'),
                      ElevatedButton(
                        onPressed: () {
                          final int n =
                              int.tryParse(_numberController.text) ?? 0;
                          numberBloc.add(
                              n); // Memanggil metode generateSequentialNumbers
                        },
                        child: Text('1'),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text('N = 5'),
                      ElevatedButton(
                        onPressed: () {
                          final int n =
                              int.tryParse(_numberController.text) ?? 0;
                          numberBloc.add(
                              n); // Memanggil metode generateDescendingNumbers
                        },
                        child: Text('2'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('N = 6'),
                  ElevatedButton(
                    onPressed: () {
                      final int n = int.tryParse(_numberController.text) ?? 0;
                      numberBloc.add(
                          n); // Memanggil metode generateIncrementalNumbers
                    },
                    child: Text('3'),
                  ),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text('N = 10'),
                  ElevatedButton(
                    onPressed: () {
                      final int n = int.tryParse(_numberController.text) ?? 0;
                      numberBloc
                          .add(n); // Memanggil metode generateSpecialNumbers
                    },
                    child: Text('4'),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(height: 20.0),
          BlocBuilder<NumberBloc, List<dynamic>>(
            builder: (context, state) {
              return Text(
                state.join(' '),
                style: TextStyle(fontSize: 18.0),
              );
            },
          ),
        ],
      ),
    );
  }
}
