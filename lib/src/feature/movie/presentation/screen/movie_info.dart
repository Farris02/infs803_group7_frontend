import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieInfo extends ConsumerStatefulWidget {
  final String name;

  const MovieInfo({super.key, required this.name});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieInfoState();
}

class _MovieInfoState extends ConsumerState<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage(
              'assets/profile_image.png',
            ), // Replace with actual image
          ),
          const SizedBox(height: 16),
          Text(
            widget.name,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Email: user@example.com', // Replace with actual email
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          // Add more user details here (bio, location, etc.)
        ],
      ),
    );
  }
}
