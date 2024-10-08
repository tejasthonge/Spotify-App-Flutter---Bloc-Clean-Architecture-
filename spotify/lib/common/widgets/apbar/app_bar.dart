import 'package:flutter/material.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget{

  final Widget? title;
  final bool? hideBack ;
  final Widget? action;
  const BasicAppBar({super.key, this.title,this.hideBack, this.action,});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      backgroundColor:
      
       Colors.transparent,
       centerTitle: true,
       title: title!=null ? title : null,
      leading:
       hideBack == true? null :
       IconButton(
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
               AppColors.darkGrey.withOpacity(0.3):
                AppColors.grey.withOpacity(0.3)),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 15,
          ),
        ),

        
      ),
      actions: [ 
        action ?? Text("")
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}
