import 'package:flutter/material.dart';

class LabelsWidget extends StatelessWidget {
  final String ruta;
  final String subLabel;
  final String buttonLabel;
  const LabelsWidget({super.key, required this.ruta, required this.buttonLabel, required this.subLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          subLabel,
          style: const TextStyle(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: () => Navigator.pushReplacementNamed(context, ruta),
          child: Text(
            buttonLabel,
            style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
