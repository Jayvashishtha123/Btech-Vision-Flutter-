import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfScreen extends StatefulWidget {
  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  final String pdfFileName = "Dbms.pdf"; // Replace with your PDF file name

  Future<String> _getPdfURL() async {
    try {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('pdfs/$pdfFileName')
          .getDownloadURL();

      return downloadURL;
    } catch (e) {
      // Handle errors, e.g., file not found
      print(e.toString());
      return 'null';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _getPdfURL(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return Text('PDF not found.');
            } else {
              return PDFView(
                filePath: snapshot.data,
                // Add other properties as needed
              );
            }
          },
        ),
      ),
    );
  }
}
