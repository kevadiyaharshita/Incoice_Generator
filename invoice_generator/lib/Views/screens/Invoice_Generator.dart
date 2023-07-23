import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_generator/Views/components/myBackButton.dart';
import 'package:invoice_generator/utils/MyRoutes.dart';
import 'package:invoice_generator/utils/color_utils.dart';
import 'dart:io';

import '../../Globals/Global_class.dart';

class Invoice_Generator extends StatefulWidget {
  const Invoice_Generator({Key? key}) : super(key: key);

  @override
  State<Invoice_Generator> createState() => _Invoice_GeneratorState();
}

class _Invoice_GeneratorState extends State<Invoice_Generator> {

  Widget Padding_Height_SizedBox()
  {
    return SizedBox(height: 16,);
  }

  Widget Padding_Width_SizedBox()
  {
    return SizedBox(width: 16,);
  }

  RegExp emailRx = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  TextEditingController Company_name_controller = TextEditingController(text: Global.Company_name);
  TextEditingController Company_email_controller = TextEditingController(text: Global.Company_email);
  TextEditingController Company_phone_controller = TextEditingController(text: Global.Company_phone);
  TextEditingController Company_address_controller = TextEditingController(text: Global.Company_address);
  TextEditingController Company_GST_controller = TextEditingController(text: Global.Company_GST_number);
  TextEditingController Company_bank_name = TextEditingController(text: Global.Company_bank_name);
  TextEditingController Company_bank_account_name = TextEditingController(text: Global.Company_bank_Account_name);
  TextEditingController Company_bank_account_number = TextEditingController(text: Global.Company_bank_Account_number);
  TextEditingController Company_bank_IFC_code = TextEditingController(text: Global.Company_bank_IFC_code);
  TextEditingController Company_PAN = TextEditingController(text: Global.Company_PAN);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(

        appBar: AppBar(
          title: Text("Company Details"),
          centerTitle: true,
          leading: myBackButton(context: context),
          backgroundColor: theme_1,
          foregroundColor:Colors.white,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Container(
              width: w,
              decoration: BoxDecoration(
                // color: theme_4,
                border: Border.all(color: theme_1),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Form(
                key: formkey,

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: w,
                      height: 180,
                      decoration: BoxDecoration(
                        color: theme_2,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(9))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(height:
                          10,),
                          Center(
                            child: Container(
                            width: 105,
                            height: 105,
                            decoration: BoxDecoration(
                              color: theme_4,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(8),
                              // border: Border.all(color:theme_1,width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: theme_1,
                                  blurRadius: 5,
                                  spreadRadius: 2,
                                )
                              ],
                              image: (Global.Comany_Logo != null)
                                  ?DecorationImage(
                                      image:FileImage(Global.Comany_Logo!),fit: BoxFit.cover,
                                  )
                                  :null

                            ),
                              child: Visibility(
                                visible: (Global.Comany_Logo == null),
                                child: IconButton(
                                      onPressed: (){

                                        ImagePicker picker = ImagePicker();
                                        XFile? file;

                                        showDialog(context: context, builder: (context) => AlertDialog(

                                          title: Text("Pick Image"),
                                          // backgroundColor: Six_Blue,

                                          content: Text("Choose the sourse for your image"),
                                          actions: [

                                        ElevatedButton(


                                          onPressed: () async {
                                            file = await picker.pickImage(source: ImageSource.camera);

                                            if(file != null){
                                              setState(() {
                                                Global.Comany_Logo = File(file!.path);
                                              });
                                            }

                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Camera",),
                                        ),

                                        ElevatedButton(
                                          onPressed: () async {
                                            file = await picker.pickImage(source: ImageSource.gallery);

                                            if(file != null){
                                              setState(() {
                                                Global.Comany_Logo = File(file!.path);
                                              });
                                            }

                                            Navigator.of(context).pop();
                                          },
                                          child: Text("Gallary"),
                                        ),
                                      ],
                                    ));

                                  },
                                       icon: Icon(Icons.add,size: 50,color: theme_2),
                                 ),
                              ),

                            ),
                          ),
                          SizedBox(height: 5,),
                          Center(child: Text("Business Logo",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),


                   SizedBox(height: 10,),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Set Up Your Business",style: TextStyle(color: theme_1,fontSize: 18,fontWeight: FontWeight.bold,),),
                    ),


                    //Company Name
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_name_controller,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Company Name !!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Company Name",
                            // labelText: "Company Name",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_name = val;
                          });
                        },
                      ),
                    ),

                    //Company Email
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_email_controller,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Email !!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Email",
                            // labelText: "Company Name",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_email = val;
                          });
                        },
                      ),
                    ),

                    //Company Phone
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_phone_controller,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Phone !!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Phone",
                            // labelText: "Company Name",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_phone = val;
                          });
                        },
                      ),
                    ),

                    //Company Address
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.streetAddress,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        maxLines: 2,
                        controller: Company_address_controller,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Address !!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Address",
                            // labelText: "Company Name",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),

                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_address = val;
                          });
                        },
                      ),
                    ),


                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text("Set Up Your Bank Details",style: TextStyle(color: theme_1,fontSize: 18,fontWeight: FontWeight.bold,),),
                    ),

                    //Company GST
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_GST_controller,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Company GST Number !!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter GST",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_GST_number= val;
                          });
                        },
                      ),
                    ),

                    //Company Bank Name
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_bank_name,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Company Bank Name!!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Bank Name",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_bank_name= val;
                          });
                        },
                      ),
                    ),

                    //Company Bank Account Name
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_bank_account_name,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Company Bank Account Name!!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Bank Account Name",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_bank_Account_name= val;
                          });
                        },
                      ),
                    ),

                    //Company Bank Account Number
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_bank_account_number,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Company Bank Account Number!!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Bank Account Number",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_bank_Account_number= val;
                          });
                        },
                      ),
                    ),

                    //Company Bank IFC Code
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_bank_IFC_code,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter Company Bank IFC Code!!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter Bank Account IFC Code",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_bank_IFC_code= val;
                          });
                        },
                      ),
                    ),

                    //Company PAN
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: TextFormField(

                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(color:theme_1),
                        controller: Company_PAN,
                        validator: (val){
                          if(val!.isEmpty)
                          {
                            return "Please Enter PAN Number!!";
                          }
                          else
                          {
                            return null;
                          }
                        },

                        decoration: InputDecoration(

                            focusColor:theme_1,
                            hintText: "Enter PAN",
                            hintStyle: TextStyle(color: theme_4),
                            labelStyle: TextStyle(fontSize: 20,color: theme_2,),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_1,
                                  width: 2,
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: theme_2,
                                )
                            ),

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                    color: theme_4
                                )
                            )
                        ),
                        onChanged: (val){
                          setState(() {
                            Global.Company_PAN= val;
                          });
                        },
                      ),
                    ),


                    SizedBox(height: 5,),

                    Center(
                      child: Padding(
                          padding:EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(MyRoutes.CustomerInvoice);
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: theme_1,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(2,2),
                                ),
                              ],
                            ),
                            alignment: Alignment.center,
                            child: Text("SAVE",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

