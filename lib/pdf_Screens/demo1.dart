import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewn extends StatelessWidget {
  const PdfViewn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SizedBox(
        width: 100,
        child: Scaffold(
          body: SfPdfViewer.network(
            "https://drive.google.com/file/d/1Mt-6VJs4cLr_Eg1IF0Skaymb_nMkOyru/view?usp=sharing",
            scrollDirection: PdfScrollDirection.horizontal,
          ),
        ),
      ),
    );
  }
}
