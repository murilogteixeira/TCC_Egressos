import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  CircleImage({this.imageURL, this.size, this.borderColor});

  final double size;
  final Color borderColor;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.red,
          width: 4,
        ),
      ),
      child: Container(
        width: size - 10,
        height: size - 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: _validateImage(),
          ),
        ),
      ),
    );
  }

  _validateImage() {
    if (imageURL != null && imageURL != '') return NetworkImage(imageURL);
    return AssetImage('assets/placeholder-person.jpg');
  }
}