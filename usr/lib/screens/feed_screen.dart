import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, String>> _stories = [
    {
      'title': 'The Quantum Heist',
      'creator': '@sci_fi_dude',
      'desc': 'A fast-paced interactive sci-fi thriller.',
      'color': '0xFF1A0B2E',
    },
    {
      'title': 'Midnight Cafe',
      'creator': '@mystery_tales',
      'desc': 'Who poisoned the barista? You decide.',
      'color': '0xFF2A0845',
    },
    {
      'title': 'Lost in the Woods',
      'creator': '@horror_fan',
      'desc': 'Escape the forest before dawn.',
      'color': '0xFF11001C',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: _stories.length,
        itemBuilder: (context, index) {
          final story = _stories[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              Container(
                color: Color(int.parse(story['color']!)),
                child: Center(
                  child: Icon(Icons.movie_creation_outlined, size: 100, color: Colors.white54),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 20,
                right: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story['title']!,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      story['creator']!,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white70),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      story['desc']!,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/viewer', arguments: story);
                      },
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Play Interactive Story'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purpleAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 80,
                right: 16,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon: const Icon(Icons.favorite_border, color: Colors.white, size: 32), onPressed: () {}),
                    const SizedBox(height: 16),
                    IconButton(icon: const Icon(Icons.comment, color: Colors.white, size: 32), onPressed: () {}),
                    const SizedBox(height: 16),
                    IconButton(icon: const Icon(Icons.share, color: Colors.white, size: 32), onPressed: () {}),
                  ],
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).padding.top + 16,
                right: 16,
                child: FloatingActionButton.small(
                  heroTag: 'studio',
                  backgroundColor: Colors.purpleAccent,
                  onPressed: () {
                    Navigator.pushNamed(context, '/studio');
                  },
                  child: const Icon(Icons.edit, color: Colors.white),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
