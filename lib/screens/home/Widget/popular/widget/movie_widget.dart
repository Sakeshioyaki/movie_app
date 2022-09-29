import 'package:flutter/material.dart';
import 'package:movie_app/models/movie/movie.dart';

class MovieWidget extends StatelessWidget {
  final Movie? movie;
  final VoidCallback? onPressed;

  const MovieWidget({
    Key? key,
    this.movie,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return InkWell(
      onTap: onPressed,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildThumbWidget(),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.2),
                    ], // Gradien
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 5),
              child: Text(
                movie?.title ?? '',
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbWidget() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Image.network(
        movie?.posterUrl ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
