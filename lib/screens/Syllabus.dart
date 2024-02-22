import 'package:btech_vision/screens/cse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class syllabus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      //DeviceOrientation.landscapeRight,
    ]);

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => cse()));
          },
          child: Icon(CupertinoIcons.back),
        ),
        backgroundColor: const Color.fromARGB(31, 0, 0, 0),
        title: Text('Syllabus'),
      ),
      backgroundColor: const Color.fromARGB(96, 119, 117, 117),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Adjust padding
        child: ListView(
          children: [
            BranchSyllabus(
              branchName: "Computer Science",
              label: "Computer Science",
              syllabus: [
                "Introduction to Computer Science",
                "Data Structures and Algorithms",
                "Software Engineering",
              ],
            ),
            BranchSyllabus(
              branchName: "Electronics and Communication",
              label: "Electronics and Communication",
              syllabus: [
                "Digital Signal Processing",
                "Communication Systems",
                "Microelectronics",
              ],
            ),
            BranchSyllabus(
              branchName: "Mechanical Engineering",
              label: "Mechanical Engineering",
              syllabus: [
                "Engineering Mechanics",
                "Thermodynamics",
                "Fluid Mechanics",
              ],
            ),
            // Add more BranchSyllabus items for other branches as needed
          ],
        ),
      ),
    );
  }
}

class BranchSyllabus extends StatefulWidget {
  final String branchName;
  final String label;
  final List<String> syllabus;

  const BranchSyllabus({
    Key? key,
    required this.branchName,
    required this.label,
    required this.syllabus,
  }) : super(key: key);

  @override
  _BranchSyllabusState createState() => _BranchSyllabusState();
}

class _BranchSyllabusState extends State<BranchSyllabus>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  // Add this variable to track whether the content should be initially visible
  bool isContentVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Automatically animate the content when the widget is created
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (isContentVisible) {
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Color textColor = Colors.white;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          if (_animationController.status == AnimationStatus.completed) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  // Change the icon based on the content visibility
                  isContentVisible
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_right,
                  color: textColor,
                  size: 24,
                ),
                SizedBox(width: 8), // Add some spacing
                Text(
                  widget.label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: screenWidth * 0.04, // Adjust font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizeTransition(
              sizeFactor: _animationController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.syllabus
                    .map(
                      (item) => Text(
                        "- $item",
                        style: TextStyle(
                          color: textColor,
                          fontSize: screenWidth * 0.035, // Adjust font size
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
