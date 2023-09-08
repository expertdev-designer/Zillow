import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zillow1/user_profile/user_profile_screen.dart';

import '../Utils/colors.dart';
import '../Utils/strings.dart';

class PasswordScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    bool isConditionMet = true;

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            child: Icon(Icons.arrow_back,size: 30,color: AppColors.blue,),
          ),
          Positioned(
            top: 95,
            left: 18,
            right: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(Strings.password_to_be,
                  style: GoogleFonts.ptSerifCaption(
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 15,),
                Container(
                  child: Text(Strings.register_detail_text,
                    style: GoogleFonts.ptSerifCaption(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                        controller: emailController,
                        labelText: Strings.email_address,
                        keyboardType: TextInputType.emailAddress,
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                        ),
                        borderColor: Colors.blue,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          // Add more validation logic as needed
                          return null;
                        },
                      ),
                    ),

                    SizedBox(width: 2),
                    Text(
                      Strings.change,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                        //height: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                        controller: passwordController,
                        labelText: Strings.password,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                        ),
                        borderColor: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 12),
                    Text(
                      Strings.show,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                        //height: 1.5,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),

                Row(
                  children: [
                    if (isConditionMet) // Show the icon only when the condition is met
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      )
                    else
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                    SizedBox(width: 8), // Add spacing between icon and text
                    Text(
                      isConditionMet ? Strings.at_least_8_char : 'Minimum 8 characters required', // Change the text based on the condition
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.text_grey,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 8), // Add spacing between rows

                Row(
                  children: [
                    Icon(
                      isConditionMet ? Icons.check_circle : Icons.cancel,
                      color: isConditionMet ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 8),
                    const Text(
                      Strings.mix_of_letters,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.text_grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                Row(
                  children: [
                    Icon(
                      isConditionMet ? Icons.check_circle : Icons.cancel,
                      color: isConditionMet ? Colors.green : Colors.red,
                    ),
                    SizedBox(width: 8),
                    Text(
                      Strings.strenght_fair,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.text_grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w200,
                            fontSize: 12
                        ),
                        children: const <InlineSpan>[
                          TextSpan(
                            text: Strings.by_tapping_continue,
                            style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                          ),
                          //SizedBox(width: 4,),
                          WidgetSpan(
                            child: SizedBox(width: 4), // Add a SizedBox for space
                          ),
                          TextSpan(
                            text: Strings.terms_of_use,
                            style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.blue),
                          ),
                          // TextSpan(
                          //   text: ' text example.',
                          //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Background color
                      // textStyle: MaterialStateProperty.all<TextStyle>(
                      //   TextStyle(fontSize: 18.0, color: Colors.white), // Text style
                      // ),
                      elevation: MaterialStateProperty.all<double>(6.0), // Elevation
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0), // Padding
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0), // Border radius
                        ),
                      ),
                    ),
                    onPressed: () {
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                    },
                    child: Text(Strings.register,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customTextField({
    required TextEditingController controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
    BorderSide? borderSide,
    TextStyle? labelStyle,
    Color? borderColor,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        color: borderColor, // Change the text color to the border color
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.blue, // Default to blue if no color provided
            width: 2.0,
          ),
        ),
      ),
      validator: validator,
    );
  }


  Widget AppText({
    required String text,
    double fontSize = 15,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.black,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
    double? decorationThickness,
    TextAlign? textAlign,
  }) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        decorationThickness: decorationThickness,
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}