import 'package:flutter/material.dart';
import 'package:invoice_generator/Views/components/myBackButton.dart';
import 'package:invoice_generator/utils/color_utils.dart';

class Invoice_Generator extends StatefulWidget {
  const Invoice_Generator({Key? key}) : super(key: key);

  @override
  State<Invoice_Generator> createState() => _Invoice_GeneratorState();
}

class _Invoice_GeneratorState extends State<Invoice_Generator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Invoice Generator"),
        centerTitle: true,
        leading: myBackButton(context: context),
        backgroundColor: theme_1,
        foregroundColor:Colors.white,
      ),
    );
  }
}
