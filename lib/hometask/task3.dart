import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Loading'),),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 100,
        itemBuilder: (context, index) {
          return FadeInImage.assetNetwork(
            placeholder: 'assets/wait.png',
            image:
                "https://e0.pxfuel.com/wallpapers/505/856/desktop-wallpaper-16k-resolution-england-page-1-16k-city.jpg",
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
