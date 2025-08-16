import 'package:flutter/material.dart';

class LoopBackCarousel extends StatefulWidget {
  const LoopBackCarousel({super.key});

  @override
  createState() => _LoopBackCarouselState();
}

class _LoopBackCarouselState extends State<LoopBackCarousel> {
  late PageController _pageController;
  double _currentPage = 1.0;

  final List<Color> items = List.generate(
    5,
    (index) => Colors.primaries[index % Colors.primaries.length],
  );

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.5, // shows ~3 items
    );

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? _currentPage;
      });
    });
  }

  void _handlePageChange(int index) {
    if (index == items.length) {
      // When user reaches the end → jump back to first item
      Future.delayed(Duration(milliseconds: 400), () {
        _pageController.jumpToPage(0);
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget dashBoaredItemFrame(int index) {
    return Container(
      decoration: BoxDecoration(
        color:
            (items.length != index)
                ? items[index % items.length]
                : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          "Item $index",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: _pageController,
        itemCount: items.length + 1,
        onPageChanged: _handlePageChange,
        itemBuilder: (context, index) {
          double distance = (_currentPage - index).abs();

          double targetScale = 1 - (distance * 0.3).clamp(0.0, 1.0);

          return TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: targetScale, end: targetScale),
            duration: Duration(milliseconds: 300),
            builder: (context, scale, child) {
              return Transform.scale(scale: scale, child: child);
            },
            child: InkWell(
              onTap: () {
                showDialog(
                  useRootNavigator: true,
                  useSafeArea: true,
                  context: context,
                  builder:
                      (_) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 140.0,
                          horizontal: 30,
                        ),
                        child: dashBoaredItemFrame(index),
                      ),
                );
              },
              child: dashBoaredItemFrame(index),
            ),
          );
        },
      ),
    );
  }
}
