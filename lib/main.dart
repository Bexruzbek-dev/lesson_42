import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lesson_42/hometask/task3.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with WidgetsBindingObserver {
  AppLifecycleState? appLifecycleState;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    appLifecycleState = state;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title:const Text("Dastur"),
            backgroundColor: Colors.amber,
            centerTitle: true,
          ),
          Expanded(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: appLifecycleState != AppLifecycleState.resumed ? 10 : 0,
                sigmaY: appLifecycleState != AppLifecycleState.resumed ? 10 : 0,
              ),
              child: Center(
                child: appLifecycleState != AppLifecycleState.resumed
                    ? Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9gSC7CNWKik0ZI1KvBtlNjJ0UEsyAnx_8npnEx6qiLg&s",
                        width: 200,
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
