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
  String result = ''; // To store the result from the API
  bool isLoading = false; // To indicate loading status

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
              onPressed: () async {
                // Start loading when the button is pressed
                setState(() {
                  isLoading = true;
                });

                try {
                  var response = await getData();
                  if (response.statusCode == 200) {
                    setState(() {
                      result = response.body;
                      isLoading = false;
                    });
                  } else {
                    setState(() {
                      result = 'Error: ${response.statusCode}';
                      isLoading = false;
                    });
                  }
                } catch (e) {
                  setState(() {
                    result = 'Error: $e';
                    isLoading = false;
                  });
                }
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
