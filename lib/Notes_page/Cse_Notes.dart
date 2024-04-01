import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  String pdfUrl = ''; // Set the URL of the PDF file in Firebase Storage
  bool isLoading = true;
  int totalPages = 0;
  int currentPage = 0;
  PDFViewController? pdfViewController;

  @override
  void initState() {
    super.initState();
    // Load PDF file from Firebase Storage
    loadPdfFromFirebase();
  }

  Future<void> loadPdfFromFirebase() async {
    // Fetch PDF file from Firebase Storage
    Reference pdfRef = FirebaseStorage.instance.ref().child('Book.pdf');
    final String url = await pdfRef.getDownloadURL();
    // Update state with the PDF URL
    setState(() {
      pdfUrl = url;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : PDFView(
                filePath: pdfUrl,
                autoSpacing: true,
                pageFling: true,
                onRender: (pages) {
                  setState(() {
                    totalPages = pages!;
                    isLoading = false;
                  });
                },
                onViewCreated: (PDFViewController vc) {
                  setState(() {
                    pdfViewController = vc;
                  });
                },
                onPageChanged: (int? page, int? total) {
                  setState(() {
                    currentPage = page!;
                  });
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Example: Go to the next page
          pdfViewController?.setPage(currentPage + 1);
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PdfViewerPage(),
  ));
}
