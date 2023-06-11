// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lightweight Baby',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      routes: {
        '/details': (context) => DetailsPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lightweight Baby'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(200, 50, 200, 0), // Adjust padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                'Every weight is lightweight!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(width: 50), // Change the width to 50 pixels
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(width: 50), // Change the width to 50 pixels
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(width: 50), // Change the width to 50 pixels
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
              ],
            ),
            const SizedBox(height: 20), // Add spacing between the rows
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(width: 50), // Change the width to 50 pixels
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(width: 50), // Change the width to 50 pixels
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
                SizedBox(width: 50), // Change the width to 50 pixels
                HoverImage(
                  imagePath: 'assets/RC2.png',
                  width: 300,
                  height: 300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



class HoverImage extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const HoverImage({
    required this.imagePath,
    required this.width,
    required this.height,
  });

  @override
  // ignore: library_private_types_in_public_api
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage>
    with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _darkenAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _darkenAnimation =
        Tween<double>(begin: 0.0, end: 0.5).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToDetails() {
    Navigator.pushNamed(context, '/details');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
        _animationController.forward();
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
        _animationController.reverse();
      },
      child: GestureDetector(
        onTap: _navigateToDetails,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _darkenAnimation,
                builder: (context, child) {
                  return ColorFiltered(
                    colorFilter: ColorFilter.matrix([
                      1 - _darkenAnimation.value,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1 - _darkenAnimation.value,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1 - _darkenAnimation.value,
                      0,
                      0,
                      0,
                      0,
                      0,
                      1,
                      0,
                    ]),
                    child: child,
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    widget.imagePath,
                    width: widget.width,
                    height: widget.height,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (isHovered)
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.5),
                    child: ElevatedButton(
                      onPressed: _navigateToDetails,
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'More info',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.black,
                          decorationThickness: 2.0,
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BB Info'), // Update the title
      ),
      body: const Center(
        child: Text(
          'Details Page',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}