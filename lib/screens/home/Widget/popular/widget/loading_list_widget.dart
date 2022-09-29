import 'package:flutter/material.dart';

class LoadingMoviesWidget extends StatelessWidget {
  final double rowHeight;

  const LoadingMoviesWidget({Key? key, this.rowHeight = 100}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) {
        return const Text('shimmer...');
      },
      itemCount: 20,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 3 / 4,
      ),
    );
  }
}
