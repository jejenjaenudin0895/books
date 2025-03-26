import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

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
                        ElevatedButton(
              child: const Text('Go!'),
              onPressed: () {

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
              },
            ),

            const Spacer(),
            Text(result),
            const CircularProgressIndicator(),
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
}
