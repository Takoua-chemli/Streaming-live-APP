import 'package:flutter/material.dart';

import 'live.dart';


class ImageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImagePage(),
      debugShowCheckedModeBanner:false,
      routes: {
        '/next': (context) => MyVideoPlayer(),
      },
    );
  }
}

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/next');
          },
          child: Image.asset('assets/img.png'),
        ),
      ),
    );
  }
}
