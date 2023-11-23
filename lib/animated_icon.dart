import 'package:flutter/material.dart';

class IconAnimated extends StatefulWidget {
  const IconAnimated({super.key});

  @override
  State<IconAnimated> createState() => _IconAnimatedState();
}

class _IconAnimatedState extends State<IconAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isButtonPressed = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        enableFeedback: true,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {
          setState(() {
            isButtonPressed = !isButtonPressed;
            isButtonPressed
                ? animationController.forward()
                : animationController.reverse();
          });
        },
        child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            color: Colors.white,
            progress: animationController));
  }
}
