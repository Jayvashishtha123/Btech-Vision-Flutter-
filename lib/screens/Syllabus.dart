import 'package:btech_vision/screens/cse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class syllabus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
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
                "Database Management Systems",
                "Operating Systems",
                "Computer Networks",
                "Artificial Intelligence",
                "Web Development",
                "Mobile App Development",
                "Cybersecurity",
                "Machine Learning",
                "Data Mining",
                "Cloud Computing",
                "Computer Graphics",
                "Natural Language Processing",
                "Human-Computer Interaction",
                "Distributed Systems",
                "Parallel Computing",
                "Software Testing and Quality Assurance",
                "Computer Organization and Architecture",
                "Information Retrieval",
                "Computer Vision",
                "Internet of Things (IoT)",
                "Blockchain Technology",
                "Big Data Analytics",
                "Quantum Computing",
                "Embedded Systems",
                "Network Security",
                "Game Development",
                "Algorithmic Trading",
              ],
            ),
            BranchSyllabus(
              branchName: "Electronics and Communication",
              label: "Electronics and Communication",
              syllabus: [
                "Digital Signal Processing",
                "Communication Systems",
                "Microelectronics",
                "Analog Electronics",
                "VLSI Design",
                "Control Systems",
                "Electromagnetic Fields",
                "Microwave Engineering",
                "Antenna and Wave Propagation",
                "Embedded Systems",
                "Digital Communication",
                "Wireless Communication",
                "Optical Communication",
                "Electronic Devices and Circuits",
                "Network Analysis",
                "Digital Image Processing",
                "RF Circuit Design",
                "Integrated Circuit Design",
                "Satellite Communication",
                "Power Electronics",
                "Communication Networks",
                "Electronic Instrumentation",
                "Telecommunication Switching Systems",
                "Information Theory and Coding",
                "Robotics and Automation",
                "Nanoelectronics",
                "Biomedical Instrumentation",
                "Electronic Product Design",
                "Data Communication and Networking",
                "Real-time Systems",
              ],
            ),
            BranchSyllabus(
              branchName: "Mechanical Engineering",
              label: "Mechanical Engineering",
              syllabus: [
                "Engineering Mechanics",
                "Thermodynamics",
                "Fluid Mechanics",
                "Strength of Materials",
                "Machine Design",
                "Heat Transfer",
                "Dynamics of Machinery",
                "Mechanical Vibrations",
                "Manufacturing Processes",
                "Materials Science",
                "Automotive Engineering",
                "Finite Element Analysis",
                "Renewable Energy Systems",
                "Robotics and Automation",
                "Engineering Drawing",
                "CAD/CAM",
                "Refrigeration and Air Conditioning",
                "Instrumentation and Control",
                "Industrial Engineering",
                "Power Plant Engineering",
                "Composite Materials",
                "Experimental Stress Analysis",
                "Tribology",
                "Mechatronics",
                "Aerodynamics",
                "Hydraulic and Pneumatic Systems",
                "Quality Control and Assurance",
                "Nanotechnology in Mechanical Engineering",
                "Engineering Economics",
                "Advanced Manufacturing Technologies",
              ],
            ),
            BranchSyllabus(
              branchName: "Civil Engineering",
              label: "Civil Engineering",
              syllabus: [
                "Engineering Mechanics",
                "Strength of Materials",
                "Structural Analysis",
                "Concrete Technology",
                "Steel Structures",
                "Geotechnical Engineering",
                "Foundation Engineering",
                "Hydraulics",
                "Environmental Engineering",
                "Surveying",
                "Transportation Engineering",
                "Construction Management",
                "Town Planning",
                "Geographic Information Systems (GIS)",
                "Remote Sensing",
                "Earthquake Engineering",
                "Water Resources Engineering",
                "Structural Dynamics",
                "Construction Materials",
                "Highway Design",
                "Urban Drainage Systems",
                "Geographic Information Systems (GIS)",
                "Remote Sensing",
                "Environmental Impact Assessment",
                "Advanced Structural Analysis",
                "Pavement Design",
                "Construction Project Management",
                "Finite Element Analysis in Civil Engineering",
                "Coastal Engineering",
                "Advanced Geotechnical Engineering",
                "Ground Improvement Techniques",
              ],
            ),
            BranchSyllabus(
              branchName: "Electrical Engineering",
              label: "Electrical Engineering",
              syllabus: [
                "Electrical Circuits",
                "Electromagnetic Fields",
                "Signals and Systems",
                "Power Systems",
                "Control Systems",
                "Electrical Machines",
                "Digital Electronics",
                "Microprocessors and Microcontrollers",
                "Power Electronics",
                "Communication Systems",
                "Instrumentation and Measurement",
                "Renewable Energy Systems",
                "High Voltage Engineering",
                "Digital Signal Processing",
                "Electric Drives",
                "Optimization Techniques",
                "VLSI Design",
                "Embedded Systems",
                "Robotics",
                "Advanced Power Systems",
                "Biomedical Instrumentation",
                "Smart Grid Technology",
                "Machine Learning in Electrical Engineering",
                "Cyber-Physical Systems",
                "Power Quality and Energy Management",
                "Advanced Control Systems",
                "Fuzzy Logic and Neural Networks",
                "Wireless Communication",
                "Network Theory",
                "Power System Protection",
                "Renewable Energy Integration",
                "Internet of Things (IoT) in Electrical Engineering",
                "Electric Vehicle Technology",
              ],
            ),
            BranchSyllabus(
              branchName: "Chemical Engineering",
              label: "Chemical Engineering",
              syllabus: [
                "Fluid Mechanics",
                "Heat Transfer",
                "Mass Transfer",
                "Chemical Process Calculations",
                "Chemical Reaction Engineering",
                "Chemical Engineering Thermodynamics",
                "Process Dynamics and Control",
                "Chemical Process Equipment Design",
                "Transport Phenomena",
                "Process Plant Utilities",
                "Polymer Engineering",
                "Petroleum Refining Engineering",
                "Environmental Engineering in Chemical Processing",
                "Bioprocess Engineering",
                "Nanotechnology in Chemical Engineering",
                "Safety and Hazard Analysis",
                "Chemical Plant Design and Economics",
                "Process Optimization",
                "Computational Methods in Chemical Engineering",
                "Introduction to Computational Fluid Dynamics",
                "Chemical Engineering Laboratory",
                "Process Simulation and Modeling",
                "Separation Processes",
                "Materials Science in Chemical Engineering",
                "Industrial Catalysis",
                "Corrosion Engineering",
                "Renewable Energy in Chemical Processes",
                "Food Process Engineering",
                "Chemical Plant Maintenance",
                "Quality Control in Chemical Engineering",
                "Chemical Engineering Ethics and Professionalism",
                "Entrepreneurship in Chemical Engineering",
              ],
            ),
            BranchSyllabus(
              branchName: "Architecture",
              label: "Architecture",
              syllabus: [
                "Architectural Design and Drawing",
                "History of Architecture",
                "Architectural Theory",
                "Building Construction and Materials",
                "Structural Design in Architecture",
                "Architectural Acoustics",
                "Architectural Lighting Design",
                "Site Planning and Landscape Design",
                "Urban Design and Planning",
                "Building Services and Infrastructure",
                "Architectural Technology and Innovation",
                "Sustainable Architecture",
                "Interior Design and Decoration",
                "Computer-Aided Design (CAD) in Architecture",
                "Building Information Modeling (BIM)",
                "Architectural Graphics and Visualization",
                "Environmental Psychology in Architecture",
                "Construction Project Management in Architecture",
                "Architectural Professional Practice",
                "Architectural Ethics and Regulations",
                "Human-Centered Design in Architecture",
                "Architectural Conservation and Heritage",
                "Advanced Architectural Structures",
                "Digital Fabrication in Architecture",
                "Parametric Design in Architecture",
                "Interactive Architecture",
                "Architectural Photography",
                "Cultural and Social Aspects of Architecture",
                "Architecture and Film",
                "Global Perspectives in Architecture",
                "Architectural Criticism and Writing",
                "Entrepreneurship in Architecture",
              ],
            ),
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
