import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget {

  const BasicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
      
       Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Container(
          width: 50,
          height: 50,
          alignment: Alignment.center,
          decoration:  BoxDecoration(
              shape: BoxShape.circle,
              
              
               color:
               context.isDarkMode ? 
               AppColors.darkGrey:
                AppColors.grey),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
          ),
        ),
      ),
    );
  }
}
