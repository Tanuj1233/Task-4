import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGeneratorScreen extends StatefulWidget {
  const QRGeneratorScreen({super.key});

  @override
  State<QRGeneratorScreen> createState() => _QRGeneratorScreenState();
}

class _QRGeneratorScreenState extends State<QRGeneratorScreen> {
  TextEditingController textController = TextEditingController();
  String qrData = "Enter text to generate QR";

  void _generateQR() {
    setState(() {
      qrData =
          textController.text.isNotEmpty ? textController.text : "Empty QR";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Generator')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: qrData, size: 200, backgroundColor: Colors.white,),
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter text",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateQR,
              child: const Text("Generate QR Code"),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
