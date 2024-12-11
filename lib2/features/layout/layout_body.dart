import 'package:flutter/material.dart';
import 'layout_screen.dart';


class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutView(),
    );
  }
}

