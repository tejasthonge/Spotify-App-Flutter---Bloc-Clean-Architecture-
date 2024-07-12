import 'package:flutter/material.dart';

class BassicAppBottom extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  double? height;
   BassicAppBottom(
    {
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
         style: ElevatedButton.styleFrom(
           minimumSize: Size.fromHeight(height?? 80)
         ),
        child: Text(
          title,
          style:TextStyle(color: Colors.white),
        ),
       
        );
  }
}
