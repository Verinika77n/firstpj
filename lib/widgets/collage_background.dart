import 'package:flutter/material.dart';

class CollageBackground extends StatelessWidget {
  const CollageBackground({super.key, this.showBottomOverlay = true});

  final bool showBottomOverlay;

  static const List<String> _images = [
    'https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=500',
    'https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=500',
    'https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=500',
    'https://images.unsplash.com/photo-1542204165-65bf26472b9b?w=500',
    'https://images.unsplash.com/photo-1536440136628-849c177e76a1?w=500',
    'https://images.unsplash.com/photo-1524985069026-dd778a71c7b4?w=500',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.62,
          ),
          itemCount: _images.length,
          itemBuilder: (context, index) {
            final double angle = index.isEven ? -0.08 : 0.08;
            return Transform.rotate(
              angle: angle,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  _images[index],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(color: const Color(0xFF27273E)),
                ),
              ),
            );
          },
        ),
        Container(color: Colors.black.withOpacity(0.45)),
        if (showBottomOverlay)
          const Align(
            alignment: Alignment.bottomCenter,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xFF12121F)],
                ),
              ),
              child: SizedBox(height: 260, width: double.infinity),
            ),
          ),
      ],
    );
  }
}
