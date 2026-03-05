import 'package:flutter/material.dart';
class EmptyState extends StatelessWidget {
  final String title; final String subtitle;
  const EmptyState({super.key, required this.title, required this.subtitle});
  @override Widget build(BuildContext context) => Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Text(title), Text(subtitle)]));
}
