import 'package:bubt_app/screens/image_upload_screen.dart';
import 'package:bubt_app/widgets/register_bottom_widget.dart';
import 'package:bubt_app/widgets/register_top_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      
      designSize: const Size(360, 720),
      builder: () => Scaffold(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(

          child: SafeArea(

            child: Padding(
              
              padding: const EdgeInsets.all(20.0),
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const RegisterTopWidget(),
                  SizedBox(height: 30.h),

                  Form(

                    key: _formKey,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextFormField(

                          controller: _emailController,
                          cursorColor: Colors.black,
                          style: GoogleFonts.nunito(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(

                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20.0),
                              //borderSide: BorderSide(color: Theme.of(context).primaryColor)
                            ),
                            focusedBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Theme.of(context).primaryColor)
                            ),
                            enabledBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(color: Colors.black)
                            ),
                            icon: const Icon(Icons.email_rounded, color: Colors.black, size: 25.0),
                            hintText: "Email"
                          ),

                          validator: (value){

                            if(value!.isEmpty)
                            {
                              return "Please, enter valid email";
                            }

                            return null;
                          },
                        ),

                        SizedBox(height: 20.h),

                        TextFormField(

                          controller: _passwordController,
                          obscureText: _isObscure,
                          cursorColor: Colors.black,
                          style: GoogleFonts.nunito(color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            
                            border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20.0),
                              //borderSide: BorderSide(color: Theme.of(context).primaryColor)
                            ),
                            focusedBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Theme.of(context).primaryColor)
                            ),
                            enabledBorder: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(color: Colors.black)
                            ),

                            icon: const Icon(Icons.password_rounded, color: Colors.black, size: 25.0),
                            suffixIcon: IconButton(

                              onPressed: (){

                                setState(() {

                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure ? Icons.visibility_off : Icons.visibility,
                              )
                            ),
                            hintText: "Password"
                          ),

                          validator: (value) {

                            if(value!.isEmpty || value.length < 6)
                            {
                              return "Please, use more than 6 characters long password";
                            }

                            return null;
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  MaterialButton(

                    height: 50.h, minWidth: MediaQuery.of(context).size.width.w,
                    elevation: 0,
                    color: Colors.amberAccent[400],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    onPressed: (){

                      if(_formKey.currentState!.validate())
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ImageUploadScreen()));
                      }
                    },
                    child: Text(

                      "Register",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  const RegisterBottomWidget()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}