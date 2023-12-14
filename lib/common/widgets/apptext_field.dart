import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tutorialapp/common/widgets/app_shadow.dart';
import 'package:tutorialapp/common/widgets/image_widget.dart';
import 'package:tutorialapp/common/widgets/text_widgets.dart';
import 'package:tutorialapp/pages/sign_up/notifier/register_notifier.dart';

Widget appTextField(
    {TextEditingController? controller,
    String text = "",
    String iconName = "",
    String hintText = "Type in your info",
    bool obscureText = false,
    void Function(String value)? func}) {
  //declearing a function that can be used
  return Container(
    padding: EdgeInsets.only(left: 25, right: 25),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text14Normal(text: text),
        SizedBox(height: 5),
        Container(
            width: 325,
            height: 50,
            decoration: appBoxDecorationTextField(),
            //row contains icon and textfield
            child: Row(children: [
              //for showing icons
              Container(
                margin: EdgeInsets.only(left: 17),
                child: AppImage(imagePath: iconName),
              ),
              Container(
                width: 280,
                height: 50,
                child: TextField(
                  //updating your  textfield
                  controller: controller,
                  onChanged: (value) => func!(value),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: hintText,
                    //border without any input
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    //inside border without any input
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),

                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),

                  maxLines: 1,
                  autocorrect: false,
                  // by default it is false
                  obscureText: obscureText,
                ),
              ),
            ])),
      ],
    ),
  );
}
