import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zillow1/Utils/AppImage.dart';
import 'package:zillow1/user_profile/user_profile_screen.dart';

import '../Utils/colors.dart';
import '../Utils/strings.dart';
import '../test.dart';

class PasswordScreen extends StatefulWidget{
  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  bool isConditionMet = true;
  bool isVisible = false;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber = false;
  bool _passwordStrength = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String passwordStrength = 'Weak';

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');
    final uppercaseRegex = RegExp(r'[A-Z]');
    final lowercaseRegex = RegExp(r'[a-z]');
    final specialCharRegex = RegExp(r'[!@#$%^&*]');


    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber = false;
      if(numericRegex.hasMatch(password) && uppercaseRegex.hasMatch(password) && lowercaseRegex.hasMatch(password) && specialCharRegex.hasMatch(password))
        _hasPasswordOneNumber = true;


      passwordStrength = 'Weak';
      if (password.length >= 8 &&
          numericRegex.hasMatch(password) &&
          uppercaseRegex.hasMatch(password) &&
          lowercaseRegex.hasMatch(password) &&
          specialCharRegex.hasMatch(password)) {
        passwordStrength = 'Good';
      } else if (password.length >= 8 && numericRegex.hasMatch(password)) {
        passwordStrength = 'Fair';
      }
    });
  }



  @override
  Widget build(BuildContext context) {

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
                        //onChange: onPasswordChanged,
                        controller: emailController,
                        labelText: Strings.email_address,
                        keyboardType: TextInputType.emailAddress,
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blue,
                        ),
                        borderColor: Colors.blue,
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
                        onChange: (password) => onPasswordChanged(password),
                        //controller: passwordController,
                        labelText: Strings.password,
                        obscureText: !isVisible,
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
                    _isPasswordEightCharacters ? SvgPicture.asset(AppImage.tick) : SvgPicture.asset(AppImage.cross),
                    SizedBox(width: 10,),
                    const Text(
                      Strings.at_least_8_char,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                          color: AppColors.text_grey,
                        ),
                        ),
                  ],
                ),


                SizedBox(height: 8),

                Row(
                  children: [
                    _hasPasswordOneNumber ? SvgPicture.asset(AppImage.tick) : SvgPicture.asset(AppImage.cross),
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
                    passwordStrength == 'Good'
                        ? SvgPicture.asset(AppImage.circle_halfColored)
                        : passwordStrength == 'Fair'
                        ? SvgPicture.asset(AppImage.circle_outline)
                        : SvgPicture.asset(AppImage.circle),
                    SizedBox(width: 8),
                    Text(
                      Strings.strength,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: AppColors.text_grey,
                      ),
                    ),
                    SizedBox(width: 2,),
                      Text(
                        passwordStrength,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
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
                            child: SizedBox(width: 4),
                          ),
                          TextSpan(
                            text: Strings.terms_of_use,
                            style: TextStyle(fontWeight: FontWeight.w500, color: AppColors.blue),
                          ),
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
                     // Navigator.push(context, MaterialPageRoute(builder: (context)=>Test()));
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
    TextEditingController? controller,
    required String labelText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
    BorderSide? borderSide,
    TextStyle? labelStyle,
    Color? borderColor,
    void Function(String)? onChange,
  }) {
    return TextFormField(
      onChanged: onChange,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: TextStyle(
        color: borderColor,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: labelStyle,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: borderColor ?? Colors.blue,
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