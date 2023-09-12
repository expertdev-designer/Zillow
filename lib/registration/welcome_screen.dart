import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zillow1/registration/password_screen.dart';
import 'package:zillow1/registration/register_email_screen.dart';

import '../Utils/AppImage.dart';
import '../Utils/colors.dart';
import '../Utils/strings.dart';

class WelcomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 70,
            left: 20,
            child: SvgPicture.asset(AppImage.zillow_logo),
          ),

          Positioned(
            top: 120,
            left: 18,
            right: 18,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(Strings.welcome_to_zillow,
                  style: GoogleFonts.ptSerifCaption(
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: Text(Strings.whats_your_email,
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                //SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    labelText: Strings.email_address,
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blue,
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterEmail()));
                    },
                    child: Text(Strings.continue_text,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5,),


               //  SizedBox(height: 10,),

              ],
            ),
          ),

          Positioned(
            top: 335,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        Strings.or,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.text_grey,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Positioned(
            top: 370,
              left: 18,
              right: 18,
             child: Column(
               children: [
                 Container(
                   padding: EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.0),
                     border: Border.all(
                       color: Colors.grey, // Border color
                       width: 1.0, // Border width
                     ),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       //Icon(Icons.facebook,size: 40,color: AppColors.blue,),
                       SvgPicture.asset(AppImage.facebook,width: 30, height: 30,),
                       SizedBox(width: 16.0),
                       Text(
                         Strings.continue_with_facebook,
                         style: GoogleFonts.poppins(
                           fontSize: 15.0,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ],
                   ),
                 ),



                 SizedBox(height: 15,),

                 Container(
                   padding: EdgeInsets.all(10.0),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5.0),
                     border: Border.all(
                       color: Colors.grey, // Border color
                       width: 1.0, // Border width
                     ),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       // Icon(Icons.g_mobiledata ,size: 40,color: AppColors.blue,),
                       SvgPicture.asset(AppImage.google,width: 30, height: 30,),
                       SizedBox(width: 16.0), // Add spacing between the logo and text
                       Text(
                         Strings.continue_with_google,
                         style: GoogleFonts.poppins(
                           fontSize: 15.0,
                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 20,),

                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     RichText(
                       text: TextSpan(
                         style: GoogleFonts.poppins(
                             fontWeight: FontWeight.w500,
                             fontSize: 12
                         ),
                         children: const <InlineSpan>[
                           TextSpan(
                             text: Strings.by_tapping_continue,
                             style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                           ),
                           WidgetSpan(
                             child: SizedBox(width: 4),
                           ),
                           TextSpan(
                             text: Strings.zillow_term_use,
                             style: TextStyle(fontWeight: FontWeight.w100, color: AppColors.blue),
                           ),
                           // TextSpan(
                           //   text: ' text example.',
                           //   style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                           // ),
                         ],
                       ),
                     ),
                   ],
                 )
               ],
             ),

          )
        ],
      ),
    );
  }

}