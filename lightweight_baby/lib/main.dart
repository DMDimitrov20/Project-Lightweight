// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(200, 50, 200, 50),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center, // Align children in the center
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
                    Center(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final imageWidth = constraints.maxWidth * 0.2;
                          final spacing = imageWidth * 0.1;

                          return Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) {
                                if (index == 1) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/AS.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                } else if (index == 2) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/KL.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                                else if (index == 3) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/JC.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                                else if (index == 4) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/JC.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                                 else {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/RC.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    
                    
                    const SizedBox(height: 20),
                    Center( // Center the photos
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final imageWidth = constraints.maxWidth * 0.2;
                          final spacing = imageWidth * 0.1;

                          return Wrap(
                            alignment: WrapAlignment.spaceBetween,
                            children: List.generate(
                              4,
                              (index) {
                                if (index == 1) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/DY.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                } else if (index == 2) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/TP.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                                else if (index == 3) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/FZ.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                                else if (index == 4) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/JC.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                                 else {
                                  return Padding(
                                    padding: EdgeInsets.only(right: spacing),
                                    child: HoverImage(
                                      imagePath: 'assets/LH.png',
                                      width: imageWidth,
                                      height: imageWidth,
                                    ),
                                  );
                                }
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: const Text(
                  'Footer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ],
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
    _darkenAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _navigateToDetailsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetailsPage()),
    );
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
        onTap: _navigateToDetailsPage,
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
                      onPressed: _navigateToDetailsPage,
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
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/RC.png', // Update the image path for the second image
                    width: 477, // Adjust the width as desired
                    height: 477, // Adjust the height as desired
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Product Description',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'This is the description of the product. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut placerat elit, id tristique ex. Donec tristique semper sapien, nec pulvinar nisi volutpat nec.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Container(
                width: 477, // Set the width to 477 pixels
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}



class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'Footer',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}