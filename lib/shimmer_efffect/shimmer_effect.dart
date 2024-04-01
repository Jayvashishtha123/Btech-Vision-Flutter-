import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class EnhancedShimmerEffect extends StatefulWidget {
  final Widget child;
  final Duration shimmerDuration;
  final Duration delayDuration;

  EnhancedShimmerEffect({
    required this.child,
    required this.shimmerDuration,
    required this.delayDuration,
  });

  @override
  _EnhancedShimmerEffectState createState() => _EnhancedShimmerEffectState();
}

class _EnhancedShimmerEffectState extends State<EnhancedShimmerEffect> {
  bool _showShimmer = true;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(widget.delayDuration, () {
      if (mounted) {
        setState(() {
          _showShimmer = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showShimmer
        ? Shimmer.fromColors(
            baseColor: Color.fromARGB(255, 36, 37, 38),
            highlightColor: Color.fromARGB(255, 66, 69, 71),
            period: widget.shimmerDuration,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.grey[300], // Placeholder color
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 16.0,
                            ),
                            child: Container(
                              width: 100.0,
                              height: 16.0,
                              color: Colors.grey[200],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 16.0,
                            ),
                            child: Container(
                              width: 200.0,
                              height: 16.0,
                              color: Colors.grey[200],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 16.0,
                            ),
                            child: Container(
                              width: 150.0,
                              height: 16.0,
                              color: Colors.grey[200],
                            ),
                          ),
                          SizedBox(
                              height: 16.0), // Added space between sections
                          _buildBubbles(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : widget.child;
  }

  Widget _buildBubbles() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildBubble(40.0, 'assets/bubble1.svg'),
        _buildBubble(40.0, 'assets/bubble2.svg'),
        _buildBubble(50.0, 'assets/bubble3.svg'),
      ],
    );
  }

  Widget _buildBubble(double size, String assetPath) {
    return Container(
      width: size,
      height: size,
      child: SvgPicture.asset(assetPath),
    );
  }
}
