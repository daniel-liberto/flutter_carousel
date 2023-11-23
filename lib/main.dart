import 'package:flutter/material.dart';
import 'package:flutter_carousel/hex_to_color.dart';

void main() {
  runApp(const MaterialApp(
    home: Carousel(),
  ));
}

class Carousel extends StatefulWidget {
  const Carousel({super.key});
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  late final PageController pageController;

  bool isButtonPressed = false;

  int phraseQuantity = 3;
  int actualPhrase = 0;
  Color colorTheme = hexToColor("#449341");
  Color colorBg = hexToColor("#212529");

  @override
  void initState() {
    pageController = PageController(
      initialPage: 0,
      // viewportFraction: 0.85,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBg,
        appBar: AppBar(
          bottom: PreferredSize(
              preferredSize: const Size(double.infinity, 2),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.grey.withOpacity(0.1), width: 1))),
              )),
          actions: [
            CircleAvatar(
              radius: 12,
              backgroundColor: colorTheme.withOpacity(0.8),
              child: const Text("?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
          backgroundColor: colorBg,
          shadowColor: Colors.transparent,
          title: Row(
            children: [
              Icon(
                Icons.bookmark,
                color: colorTheme,
              ),
              Text(
                "Greetings",
                style:
                    TextStyle(color: colorTheme, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: SizedBox(
          height: double.infinity,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              actualPhrase = index;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                animation: pageController,
                builder: (context, child) {
                  return child!;
                },
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: colorBg,
                        height: double.infinity,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            const Column(
                              children: [
                                Text(
                                  "Hello! What's your name?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Olá! Qual seu nome?",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 22),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundColor: colorTheme,
                                  radius: 30,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.volume_up,
                                        color: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTapDown: (details) {
                                    setState(() {
                                      isButtonPressed = !isButtonPressed;
                                    });
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: colorTheme,
                                    radius: 30,
                                    child: Icon(
                                        isButtonPressed == false
                                            ? Icons.mic
                                            : Icons.multitrack_audio_rounded,
                                        color: Colors.white,
                                        size: 26),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                CircleAvatar(
                                  backgroundColor: colorTheme,
                                  radius: 30,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.star_border_rounded,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 0,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: phraseQuantity,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            color: colorTheme,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCirc);
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white.withOpacity(0.6),
                    size: 40,
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOutCirc);
                    });
                  },
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Colors.white.withOpacity(0.6),
                    size: 40,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
