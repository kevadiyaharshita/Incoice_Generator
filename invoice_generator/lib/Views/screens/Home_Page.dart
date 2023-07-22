import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/color_utils.dart';

import '../../utils/MyRoutes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: theme_1,
        foregroundColor: Colors.white,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(MyRoutes.InvoiceGenerator);
        },

        backgroundColor: theme_4,
        child: Icon(Icons.add,color: theme_1,size: 38,),
      ),
    );
  }
}
