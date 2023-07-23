import 'dart:io';

import 'package:flutter/material.dart';

class Global{

  static File? Comany_Logo ;
  static String? Company_name;
  static String? Company_email;
  static String? Company_phone;
  static String? Company_address;
  static String? Company_GST_number;
  static String? Company_bank_name;
  static String? Company_bank_Account_name;
  static String? Company_bank_Account_number;
  static String? Company_bank_IFC_code;
  static String? Company_PAN;

  static String? Customer_name;
  static String? Customer_email;
  static String? Customer_phone;
  static String? Customer_address;
  static String? Customer_GST;
  static String? Customer_PAN;
  static String? Discount = "0";

  static List<TextEditingController> Item_name = [];
  static List<TextEditingController> Item_price = [];
  static List<TextEditingController> Item_qty = [];
  static List<TextEditingController> Item_details = [];

  static double Sub_total = 0;
  static double Total = 0;
  static double all_discount =0;

}