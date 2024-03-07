import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoadingWidget extends StatelessWidget {
  bool loading;
  Widget child;
  LoadingWidget({super.key, required this.loading, required this.child});

  @override
  Widget build(BuildContext context) {
    return loading ? const Center(child: CircularProgressIndicator()) : child;
  }
}