import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:async/async.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back From The Future JEJEN'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Spacer(),
            ElevatedButton(
              child: const Text('Go!'),
              onPressed: () {
/*
                setState(() {
                  isLoading = true; 
                  result = '';
                });

             
                getData().then((value) {
                  setState(() {
                    result = value.body.toString().substring(0, 450); 
                    isLoading = false; 
                  });
                }).catchError((_) {
                  setState(() {
                    result = 'An error occurred'; 
                    isLoading = false; 
                  });
                });



              count(); //kode praktek ke 2


              //langkah ke 3 praktekurm ke 3
                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                });

                 */
                getNumber().then((value) {
                  setState(() {
                    result = value.toString();
                  });
                }).catchError((e) {
                  result = 'An error occurred';
                });


              },
            ),
            const Spacer(),
            const Spacer(),
            Text(result),
            const CircularProgressIndicator(),
            const Spacer(),
            const Spacer(),

          ],
        ),
      ),
    );
  }


  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/Y0EgEQAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);

  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }




Future count() async{

    int total = 0;
    total = await returnOneAsync();
    total += await returnTwoAsync();
    total += await returnThreeAsync();
    setState(() {

      result = total.toString();

    });
}

  late Completer completer;

  Future getNumber() {
    completer = Completer<int>();
    calculate();
    return completer.future;

  }

  Future calculate() async {
    try {
      await Future.delayed(const Duration(seconds: 5));
      completer.complete(42);
    }
    catch (_) {
      completer.completeError({});
    }
  }
}
