import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final Function(bool authorised) onComplete;

  const SplashPage({Key? key, required this.onComplete}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }

  void _load() {
    Future.delayed(const Duration(seconds: 3), () {
      widget.onComplete(true);
    });
  }
}
