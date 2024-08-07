import "package:flutter/material.dart";
import "gradient_container.dart";

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(Color.fromARGB(255, 250, 18, 126),
            Color.fromARGB(255, 21, 228, 217)),
      ),
    ),
  );
}
