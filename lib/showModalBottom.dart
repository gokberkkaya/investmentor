import 'package:flutter/material.dart';

void showModalBottom(BuildContext context, icerik) {
    showModalBottomSheet(
      enableDrag: true,
      isScrollControlled: true,
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(200)),
      context: context,
      builder: (BuildContext context) {
        return showModalBottomClip(icerik, context);
      },
    );
}

ClipRRect showModalBottomClip(icerik,context){
  return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
      child: ModalBottomIcerik(icerik,context));
}

Container ModalBottomIcerik(icerik,context) {
  return  Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset: const Offset(0,3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: 
                    icerik,
                    
                  
                );
}