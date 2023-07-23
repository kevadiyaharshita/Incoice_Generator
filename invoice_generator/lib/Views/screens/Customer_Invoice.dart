import 'package:flutter/material.dart';

import '../../Globals/Global_class.dart';
import '../../utils/MyRoutes.dart';
import '../../utils/color_utils.dart';
import '../components/myBackButton.dart';
import 'dart:io';

class Customer_Invoice extends StatefulWidget {
  const Customer_Invoice({Key? key}) : super(key: key);

  @override
  State<Customer_Invoice> createState() => _Customer_InvoiceState();
}

class _Customer_InvoiceState extends State<Customer_Invoice> {
  RegExp emailRx = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');

  TextEditingController Customer_name_controller = TextEditingController(text: Global.Customer_name);
  TextEditingController Customer_email_controller = TextEditingController(text: Global.Customer_email);
  TextEditingController Customer_phone_controller = TextEditingController(text: Global.Customer_phone);
  TextEditingController Custometr_address_controller = TextEditingController(text: Global.Customer_address);
  TextEditingController Customer_GST_controller = TextEditingController(text: Global.Customer_GST);
  TextEditingController Customer_PAN = TextEditingController(text: Global.Customer_PAN);
  TextEditingController Discount_AllItems = TextEditingController(text: Global.Discount);

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool addItems_check = false;
  double discount = 0;

  @override
  void initState() {
    // TODO: implement initState
    Global.all_discount = 0;
  }
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    Global.Sub_total = 0;
    Global.Total = 0;

    
    double subtotal = 0;

    double total = 0;
    double itemPrice = 0;
    double itemQty = 0;

    int Counter = 0;
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Invoice Details"),
          centerTitle: true,
          leading: myBackButton(context: context),
          backgroundColor: theme_1,
          foregroundColor:Colors.white,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(16),
                width: w,
                decoration: BoxDecoration(
                  // color: theme_4,
                  border: Border.all(color: theme_1),
                  borderRadius: BorderRadius.circular(10),
                ),

                child:Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 16,top: 16),
                        child: Text("Customer Details",style: TextStyle(color: theme_1,fontSize: 18,fontWeight: FontWeight.bold,),),
                      ),

                      //Customer Name
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          controller: Customer_name_controller,
                          validator: (val){
                            if(val!.isEmpty)
                            {
                              return "Please Enter Customer Name !!";
                            }
                            else
                            {
                              return null;
                            }
                          },

                          decoration: InputDecoration(

                              focusColor:theme_1,
                              hintText: "Enter Customer Name",
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
                              Global.Customer_name = val;
                            });
                          },
                        ),
                      ),

                      //Customer Email
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          controller: Customer_email_controller,
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
                              Global.Customer_email = val;
                            });
                          },
                        ),
                      ),

                      //Customer Phone
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          controller: Customer_phone_controller,
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
                              Global.Customer_phone = val;
                            });
                          },
                        ),
                      ),

                      //Customer Address
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.streetAddress,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          maxLines: 2,
                          controller: Custometr_address_controller,
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
                              Global.Customer_address = val;
                            });
                          },
                        ),
                      ),

                      //Customer GST
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          controller: Customer_GST_controller,
                          validator: (val){
                            if(val!.isEmpty)
                            {
                              return "Please Enter Customer GST Number !!";
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
                              Global.Customer_GST = val;
                            });
                          },
                        ),
                      ),

                      //Customer PAN
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          controller: Customer_PAN,
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
                              Global.Customer_PAN= val;
                            });
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("Item Details",style: TextStyle(color: theme_1,fontSize: 18,fontWeight: FontWeight.bold,),),
                      ),

                      //Item Details
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Container(
                          width: w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: theme_1),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              (Global.Item_name.isNotEmpty)
                                  ?Container(
                                   width: w,
                                   height: 30,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.vertical(top: Radius.circular(9)),
                                     color: theme_2,
                                   ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 85,
                                      height: 30
                                      ,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                        border: Border(
                                          right: BorderSide(
                                            color: theme_1,
                                            width: 1,
                                          ),
                                        )
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(" Item Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      width: 85,
                                      height: 30
                                      ,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: theme_1,
                                              width: 1,
                                            ),
                                          )
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(" Price ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      width: 85,
                                      height: 30
                                      ,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: theme_1,
                                              width: 1,
                                            ),
                                          )
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(" Quantity",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),
                                    Container(
                                      width: 85,
                                      height: 30
                                      ,
                                      // color: Colors.red,
                                      decoration: BoxDecoration(
                                          border: Border(
                                            right: BorderSide(
                                              color: theme_1,
                                              width: 1,
                                            ),
                                          )
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(" Delete",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                    ),

                                  ],
                                ),
                              )
                                  :SizedBox(),
                              ...List.generate(Global.Item_name.length, (index) {

                                if(Global.Item_price[index].text == "")
                                  {
                                    itemPrice = 0;
                                  }
                                else
                                  {
                                    itemPrice = double.parse(Global.Item_price[index].text);

                                  }

                                if(Global.Item_qty[index].text == "")
                                  {
                                    itemQty = 0;
                                  }
                                else
                                  {
                                    itemQty = double.parse(Global.Item_qty[index].text);
                                  }
                                
                                subtotal = subtotal + (itemPrice * itemQty);
                                Global.Sub_total = subtotal;

                                return Container(
                                  width: w,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(9)),
                                     color: theme_4.withOpacity(0.1),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 85,
                                        height: 30
                                        ,
                                        // color: Colors.red,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: theme_1,
                                                width: 1,
                                              ),
                                            )
                                        ),
                                        alignment: Alignment.center,
                                        child: Text("  ${Global.Item_name[index].text}",style: TextStyle(color: theme_1,fontWeight: FontWeight.bold),),
                                      ),
                                      Container(
                                        width: 85,
                                        height: 30
                                        ,
                                        // color: Colors.red,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: theme_1,
                                                width: 1,
                                              ),
                                            )
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(" ${Global.Item_price[index].text}",style: TextStyle(color: theme_1,fontWeight: FontWeight.bold),),
                                      ),
                                      Container(
                                        width: 85,
                                        height: 30
                                        ,
                                        // color: Colors.red,
                                        decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                color: theme_1,
                                                width: 1,
                                              ),
                                            )
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(" ${Global.Item_qty[index].text}",style: TextStyle(color: theme_1,fontWeight: FontWeight.bold),),
                                      ),


                                      Container(
                                        width: 88,
                                        height: 30,


                                        alignment: Alignment.center,
                                        child: GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              Global.Item_name.removeAt(index);
                                              Global.Item_price.removeAt(index);
                                              Global.Item_qty.removeAt(index);
                                              Global.Item_details.removeAt(index);
                                            });
                                          },
                                            child: Text("Delete",style: TextStyle(color: theme_1,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),)),
                                      ),

                                    ],
                                  ),
                                );
                              }),
                              (Global.Item_name.isNotEmpty)?Divider(color: theme_1,):SizedBox(),
                              SizedBox(height: 15,),
                              Center(
                                child: Padding(
                                  padding:EdgeInsets.fromLTRB(16, 0, 16, 16),
                                  child: GestureDetector(
                                    onTap: (){
                                       setState(() {
                                         addItems_check = true;
                                         if(Global.Item_name.isEmpty) {
                                           Global.Item_name.add(
                                               TextEditingController());
                                           Global.Item_price.add(
                                               TextEditingController());
                                           Global.Item_qty.add(
                                               TextEditingController());
                                           Global.Item_details.add(
                                               TextEditingController());
                                         }
                                       });
                                    },
                                    child: Container(
                                      width:150,
                                      height: 40,
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
                                      child: Text("ADD ITEMS",style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(" Discount(%)",style: TextStyle(color: theme_1,fontSize: 18,fontWeight: FontWeight.bold,),),
                      ),

                      //Discount(%)
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: TextFormField(

                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          style: TextStyle(color:theme_1),
                          controller: Discount_AllItems,
                          validator: (val){
                            if(val!.isEmpty)
                            {
                              return "Please Enter Discount!!";
                            }
                            else
                            {
                              return null;
                            }
                          },

                          decoration: InputDecoration(

                              focusColor:theme_1,
                              hintText: "Enter Discount(%)",
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
                              Global.Discount= val;
                              if(Discount_AllItems.text == null)
                                {
                                  print("discount not");
                                  discount = 0;
                                }
                              else
                                {

                                  print("discount yes");
                                discount = double.parse(Discount_AllItems.text);
                                Global.all_discount = discount;
                                print("$discount");
                                }
                            });
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Container(
                          width: w,
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            border: Border.all(color: theme_1,),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 16,),
                                  Text("SubTotal ",style: TextStyle(fontWeight: FontWeight.bold,color: theme_1,fontSize: 18),),
                                  Spacer(),
                                  Text("${subtotal}",style: TextStyle(fontWeight: FontWeight.bold,color: theme_1,fontSize: 18),),
                                  SizedBox(width: 16,),
                                ],
                              ),
                              Divider(color: theme_1,),
                              Row(
                                children: [
                                  SizedBox(width: 16,),
                                  Text("Discount ",style: TextStyle(color: theme_1,fontSize: 18),),
                                  Spacer(),
                                  // (Global.Discount == null)?Text("00",style: TextStyle(fontWeight: FontWeight.bold,color: theme_1,fontSize: 18),):
                                  Text("${(subtotal * discount )/100}",style: TextStyle(fontWeight: FontWeight.bold,color: theme_1,fontSize: 18),),
                                  SizedBox(width: 16,),
                                ],
                              ),
                              Divider(color: theme_1,),
                              Row(
                                children: [
                                  SizedBox(width: 16,),
                                  Text("Total ",style: TextStyle(color: theme_1,fontSize: 18),),
                                  Spacer(),
                                  Text("${subtotal - ((subtotal * discount )/100)}",style: TextStyle(fontWeight: FontWeight.bold,color: theme_1,fontSize: 18),),
                                  SizedBox(width: 16,),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding:EdgeInsets.fromLTRB(16, 0, 16, 16),
                          child: GestureDetector(
                            onTap: (){
                             Navigator.of(context).pushNamed(MyRoutes.InvoicePdf);
                            },
                            child: Container(
                              width:250,
                              height: 40,
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
                              child: Text("GENERATE INVOICE",style: TextStyle(color: Colors.white,fontSize:18,fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                )

              ),
            ),
            Visibility(
              visible: addItems_check,
              child: SingleChildScrollView(
                child: Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.6),
                  ),
                  child: Column(
                    children: [
                      Spacer(),
                      Container(
                        width: w,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        ),
                        child: Column(
                          children: [
                            //Heading Container
                            Container(
                              width: w,
                              height: 50,
                              decoration: BoxDecoration(
                                color: theme_1,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15))
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 15,),
                                  Text("Add Items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                                  Spacer(),
                                  IconButton(
                                      onPressed: (){
                                        setState(() {
                                          addItems_check = false;
                                        });
                                      },
                                      icon: Icon(Icons.done_all,color: Colors.white,size: 30,)
                                  ),
                                  SizedBox(width: 15,),
                                ],
                              ),
                            ),

                            Container(
                              width: w,
                              height: 500,
                              child: SingleChildScrollView(

                                child: Column(
                                  children:List.generate(Global.Item_name.length, (index) {
                                    Counter ++;
                                    return Container(
                                      width: w,
                                      height: 375,
                                      margin: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: theme_1,),
                                        borderRadius: BorderRadius.circular(10),
                                      ),

                                      child: Column(
                                        children: [
                                          Container(
                                            width: w,
                                            height: 35,
                                            padding: EdgeInsets.only(left: 10,),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.vertical(top: Radius.circular(9)),
                                              color: theme_2
                                            ),
                                            child: Row(
                                              children: [
                                               Text("Item-${Counter}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                                                Spacer(),
                                                IconButton(
                                                    onPressed: (){
                                                      setState(() {

                                                        formkey.currentState!.reset();
                                                        Global.Item_name.removeAt(index);
                                                        Global.Item_price.removeAt(index);
                                                        Global.Item_qty.removeAt(index);
                                                        Global.Item_details.removeAt(index);
                                                      });
                                                    },
                                                    icon: Icon(Icons.delete,color: Colors.white,size: 20,)
                                                ),
                                              ],
                                            ),
                                          ),

                                          //Item Name
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(16, 16, 16, 16),
                                            child: TextFormField(

                                              keyboardType: TextInputType.name,
                                              textInputAction: TextInputAction.next,
                                              // initialValue: e['Course/Degree'],
                                              controller: Global.Item_name[index],
                                              style: TextStyle(color: theme_1),
                                              validator: (val){
                                                if(val!.isEmpty)
                                                {
                                                  return "Please Enter Item Name !!";
                                                }
                                                else
                                                {
                                                  return null;
                                                }
                                              },

                                              decoration: InputDecoration(
                                                  focusColor: theme_1,
                                                  // hintText: "Course / Degree",

                                                  labelText: "Item Name",
                                                  hintStyle:
                                                  TextStyle(color: theme_3),
                                                  labelStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: theme_3,
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_1,
                                                        width: 2,
                                                      )),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_2,
                                                      )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                          color: theme_4))),
                                              onChanged: (val) {
                                                setState(() {

                                                });
                                              },
                                            ),
                                          ),

                                          //Item Price
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(16, 0, 16, 16),
                                            child: TextFormField(

                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.next,
                                              // initialValue: e['Course/Degree'],
                                              controller: Global.Item_price[index],
                                              style: TextStyle(color: theme_1),
                                              validator: (val){
                                                if(val!.isEmpty)
                                                {
                                                  return "Please Enter Item Price !!";
                                                }
                                                else
                                                {
                                                  return null;
                                                }
                                              },

                                              decoration: InputDecoration(
                                                  focusColor: theme_1,
                                                  // hintText: "Course / Degree",

                                                  labelText: "Price",
                                                  hintStyle:
                                                  TextStyle(color: theme_3),
                                                  labelStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: theme_3,
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_1,
                                                        width: 2,
                                                      )),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_2,
                                                      )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                          color: theme_4))),
                                              onChanged: (val) {
                                                setState(() {

                                                });
                                              },
                                            ),
                                          ),

                                          //Item Qty
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(16, 0, 16, 16),
                                            child: TextFormField(
                                              keyboardType: TextInputType.number,
                                              textInputAction: TextInputAction.next,
                                              // initialValue: e['Course/Degree'],
                                              controller: Global.Item_qty[index],
                                              style: TextStyle(color: theme_1),
                                              validator: (val){
                                                if(val!.isEmpty)
                                                {
                                                  return "Please Enter Quntity !!";
                                                }
                                                else
                                                {
                                                  return null;
                                                }
                                              },

                                              decoration: InputDecoration(
                                                  focusColor: theme_1,
                                                  // hintText: "Course / Degree",

                                                  labelText: "Quantity",
                                                  hintStyle:
                                                  TextStyle(color: theme_3),
                                                  labelStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: theme_3,
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_1,
                                                        width: 2,
                                                      )),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_2,
                                                      )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                          color: theme_4))),
                                              onChanged: (val) {
                                                setState(() {

                                                });
                                              },
                                            ),
                                          ),

                                          //Item Details
                                          Padding(
                                            padding:
                                            EdgeInsets.fromLTRB(16, 0, 16, 16),
                                            child: TextFormField(

                                              keyboardType: TextInputType.name,
                                              textInputAction: TextInputAction.next,
                                              // initialValue: e['Course/Degree'],
                                              controller: Global.Item_details[index],
                                              style: TextStyle(color: theme_1),
                                              validator: (val){
                                                if(val!.isEmpty)
                                                {
                                                  return "Please Enter Details !!";
                                                }
                                                else
                                                {
                                                  return null;
                                                }
                                              },

                                              decoration: InputDecoration(
                                                  focusColor: theme_1,
                                                  // hintText: "Course / Degree",

                                                  labelText: "Details",
                                                  hintStyle:
                                                  TextStyle(color: theme_3),
                                                  labelStyle: TextStyle(
                                                    fontSize: 20,
                                                    color: theme_3,
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_1,
                                                        width: 2,
                                                      )),
                                                  enabledBorder: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                        color: theme_2,
                                                      )),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                      BorderRadius.circular(8),
                                                      borderSide: BorderSide(
                                                          color: theme_4))),
                                              onChanged: (val) {
                                                setState(() {

                                                });
                                              },
                                            ),
                                          ),

                                        ],
                                      ),
                                    );
                                  })
                                ),
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
            )
          ],
        ),
         floatingActionButton: Visibility(
           visible: addItems_check,
           
           child: Align(
             alignment: Alignment.bottomRight,
             child: FloatingActionButton(
              backgroundColor: theme_4,
              onPressed: (){
                FocusManager.instance.primaryFocus!.unfocus();
                // bool validated = formkey.currentState!.validate();
                setState(() {


                    Global.Item_name.add(TextEditingController());
                    Global.Item_price.add(TextEditingController());
                    Global.Item_qty.add(TextEditingController());
                    Global.Item_details.add(TextEditingController());

                });

              },
              child: Icon(Icons.add,color: theme_1,size: 38,),
        ),
           ),
         ),
      ),
    );
  }
}
