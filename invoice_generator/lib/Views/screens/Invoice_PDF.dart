import 'dart:async';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:invoice_generator/utils/color_utils.dart';
import 'package:printing/printing.dart';
import 'dart:io';

import '../../Globals/Global_class.dart';

class Invoice_PDF extends StatefulWidget {
  const Invoice_PDF({Key? key}) : super(key: key);

  @override
  State<Invoice_PDF> createState() => _Invoice_PDFState();
}

class _Invoice_PDFState extends State<Invoice_PDF> {

  FutureOr<Uint8List>generatePDF() async
  {

    pw.Document pdf = pw.Document();

    pdf.addPage(

      pw.Page(
          margin: pw.EdgeInsets.zero,
          build: (pw.Context contex) => pw.Center(
            child:pw.Container(
              height: double.infinity,
              width: double.infinity,

              decoration: pw.BoxDecoration(
                color: PdfColors.white,
                border: pw.Border.all(color: pdftheme_1)
              ),
              child: pw.Column(
                // crossAxisAlignment: pw.CrossAxisAlignment.center,
                children: [
                  pw.Container(
                    width: double.infinity,
                    height: 175,
                    color: pdftheme_1,
                    child: pw.Row(
                      children: [
                       pw.Container(
                         width: 130,
                         height: 175,
                         padding: pw.EdgeInsets.all(10),
                         color: pdftheme_2,
                         child:  pw.Container(
                             width: 100,
                             height: 155,
                             padding: pw.EdgeInsets.all(10),
                             decoration: pw.BoxDecoration(
                                 image: pw.DecorationImage(
                                   image: pw.MemoryImage(
                                     File(Global.Comany_Logo!.path).readAsBytesSync(),
                                   ),
                                 )
                             )
                         )
                       ),
                        pw.SizedBox(width: 10),
                       pw.Container(
                         width: 475,
                         height: 165,

                         padding: pw.EdgeInsets.all(10),
                         // color: PdfColors.red,
                         alignment: pw.Alignment.center,
                         child: pw.Column(
                           crossAxisAlignment: pw.CrossAxisAlignment.center,
                           children: [

                             pw.SizedBox(height: 3),
                             pw.Text("${Global.Company_name!.toUpperCase()}",style: pw.TextStyle(fontSize: 35,fontWeight: pw.FontWeight.bold,color: PdfColors.white)),
                             pw.SizedBox(height: 3),
                             pw.Text("${Global.Company_address}",style: pw.TextStyle(fontSize: 18,color: PdfColors.white)),
                             pw.SizedBox(height: 3),
                             pw.Text("PHONE : ${Global.Company_phone}",style: pw.TextStyle(fontSize: 18,color: PdfColors.white)),
                             pw.SizedBox(height: 3),
                             pw.Text("EMAIL : ${Global.Company_email}",style: pw.TextStyle(fontSize: 18,color: PdfColors.white)),
                             pw.SizedBox(height: 3),
                             pw.Text("GST : ${Global.Company_GST_number}",style: pw.TextStyle(fontSize: 18,color: PdfColors.white))

                           ]
                         )
                       )
                      ]
                    )
                  ),
                  pw.Row(
                    children: [
                     pw.Expanded(
                       flex: 2,
                       child: pw.Container(
                         height: 150,
                         decoration: pw.BoxDecoration(
                          border:pw.Border.all(color: pdftheme_1,width: 2)
                         ),

                         child: pw.Column(
                           crossAxisAlignment: pw.CrossAxisAlignment.start,
                           children: [
                             pw.SizedBox(height: 5),
                             pw.Text("  Byer's Details ",style: pw.TextStyle(fontSize: 22,color: pdftheme_1,fontWeight: pw.FontWeight.bold,decoration: pw.TextDecoration.underline)),
                             pw.SizedBox(height: 5),
                             pw.Text("  ${Global.Customer_name}",style: pw.TextStyle(fontSize: 16,color: pdftheme_1,)),
                             pw.Text("  ${Global.Customer_email}",style: pw.TextStyle(fontSize: 16,color: pdftheme_1,)),
                             pw.Text("  ${Global.Customer_phone}",style: pw.TextStyle(fontSize: 16,color: pdftheme_1,)),
                             pw.Text("  ${Global.Customer_address}",style: pw.TextStyle(fontSize: 16,color: pdftheme_1,)),
                             pw.Text("  ${Global.Customer_GST}",style: pw.TextStyle(fontSize: 16,color: pdftheme_1,))

                           ]
                         )
                       )
                     ),
                      
                      pw.Expanded(

                          child: pw.Container(
                            height: 150,
                           decoration: pw.BoxDecoration(
                             border: pw.Border(
                               bottom: pw.BorderSide(color: pdftheme_1,width: 2)
                             )
                           ),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.SizedBox(height: 8),
                                pw.Text(" Invoice No : 1 ",style: pw.TextStyle(fontSize:20,color: pdftheme_1,fontWeight: pw.FontWeight.bold,)),
                                pw.SizedBox(height: 8),
                                pw.Text(" Date: 22/7/2023",style: pw.TextStyle(fontSize: 20,color: pdftheme_1,fontWeight: pw.FontWeight.bold,)),
                                pw.SizedBox(height: 8),
                                pw.Text(" Challan No :",style: pw.TextStyle(fontSize:20,color: pdftheme_1,fontWeight: pw.FontWeight.bold,)),
                                pw.SizedBox(height: 8),
                                pw.Text(" Pay Mode : CREDIT",style: pw.TextStyle(fontSize:20,color: pdftheme_1,fontWeight: pw.FontWeight.bold,)),
                                pw.SizedBox(height: 8),

                              ]
                            )
                          )
                      ),
                    ]
                  ),
                  pw.Container(
                    height: 500,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(color: pdftheme_1,width: 2),
                    ),
                    child: pw.Column(
                      children: [
                        pw.Row(
                          children: [
                            pw.Container(
                              height: 40,
                              width: 50,
                              decoration: pw.BoxDecoration(
                                color: pdftheme_4,
                                border: pw.Border(
                                  right: pw.BorderSide(color: pdftheme_1,width: 2),
                                  bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                )
                              ),
                              alignment: pw.Alignment.center,
                              child: pw.Text("SR",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color: pdftheme_1)
                              )
                            ),
                            pw.Container(
                                height: 40,
                                width: 250,
                                decoration: pw.BoxDecoration(
                                    color: pdftheme_4,
                                    border: pw.Border(
                                      right: pw.BorderSide(color: pdftheme_1,width: 2),
                                      bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                    )
                                ),
                                alignment: pw.Alignment.centerLeft,
                                child: pw.Text(" ITEM NAME",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                )
                            ),
                            pw.Container(
                                height: 40,
                                width: 100,
                                decoration: pw.BoxDecoration(
                                    color: pdftheme_4,
                                    border: pw.Border(
                                      right: pw.BorderSide(color: pdftheme_1,width: 2),
                                      bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                    )
                                ),
                                alignment: pw.Alignment.center,
                                child: pw.Text("PRICE ",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                )
                            ),
                            pw.Container(
                                height: 40,
                                width: 100,
                                decoration: pw.BoxDecoration(
                                    color: pdftheme_4,
                                    border: pw.Border(
                                      right: pw.BorderSide(color: pdftheme_1,width: 2),
                                      bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                    )
                                ),
                                alignment: pw.Alignment.center,
                                child: pw.Text(" QTY ",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                )
                            ),
                            pw.Container(
                                height: 40,
                                width: 100,
                                decoration: pw.BoxDecoration(
                                    color: pdftheme_4,
                                    border: pw.Border(
                                      right: pw.BorderSide(color: pdftheme_1,width: 2),
                                      bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                    )
                                ),
                                alignment: pw.Alignment.center,
                                child: pw.Text(" TOTAL ",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                )
                            )
                          ]
                        ),
                         ...List.generate(Global.Item_name.length, (index) {
                           double Total = double.parse(Global.Item_price[index].text) * double.parse(Global.Item_qty[index].text);
                           return  pw.Row(
                               children: [
                                 pw.Container(
                                     height: 40,
                                     width: 50,
                                     decoration: pw.BoxDecoration(
                                         // color: pdftheme_4,
                                         border: pw.Border(
                                           right: pw.BorderSide(color: pdftheme_1,width: 2),
                                           bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                         )
                                     ),
                                     alignment: pw.Alignment.center,
                                     child: pw.Text("${index+1}",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color: pdftheme_1)
                                     )
                                 ),
                                 pw.Container(
                                     height: 40,
                                     width: 250,
                                     decoration: pw.BoxDecoration(
                                         // color: pdftheme_4,
                                         border: pw.Border(
                                           right: pw.BorderSide(color: pdftheme_1,width: 2),
                                           bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                         )
                                     ),
                                     alignment: pw.Alignment.centerLeft,
                                     child: pw.Text(" ${Global.Item_name[index].text}",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                     )
                                 ),
                                 pw.Container(
                                     height: 40,
                                     width: 100,
                                     decoration: pw.BoxDecoration(
                                         // color: pdftheme_4,
                                         border: pw.Border(
                                           right: pw.BorderSide(color: pdftheme_1,width: 2),
                                           bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                         )
                                     ),
                                     alignment: pw.Alignment.center,
                                     child: pw.Text("${Global.Item_price[index].text}",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                     )
                                 ),
                                 pw.Container(
                                     height: 40,
                                     width: 100,
                                     decoration: pw.BoxDecoration(
                                         // color: pdftheme_4,
                                         border: pw.Border(
                                           right: pw.BorderSide(color: pdftheme_1,width: 2),
                                           bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                         )
                                     ),
                                     alignment: pw.Alignment.center,
                                     child: pw.Text(" ${Global.Item_qty[index].text}",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                     )
                                 ),
                                 pw.Container(
                                     height: 40,
                                     width: 100,
                                     decoration: pw.BoxDecoration(
                                         // color: pdftheme_4,
                                         border: pw.Border(
                                           right: pw.BorderSide(color: pdftheme_1,width: 2),
                                           bottom: pw.BorderSide(color: pdftheme_1,width: 2),
                                         )
                                     ),
                                     alignment: pw.Alignment.center,
                                     child: pw.Text(" ${Total} ",style: pw.TextStyle(fontSize: 18,fontWeight: pw.FontWeight.bold,color:pdftheme_1)
                                     )
                                 )
                               ]
                           );
                         }),

                        pw.Spacer(),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: pdftheme_1,width: 2),
                            ),
                            child: pw.Row(
                                children: [
                                  pw.SizedBox(width:5),
                                  pw.Text("Sub Total",style: pw.TextStyle(fontSize: 20,color:pdftheme_1,fontWeight:pw.FontWeight.bold)),
                                  pw.Spacer(),
                                  pw.Text("${ Global.Sub_total}",style: pw.TextStyle(fontSize: 20,color:pdftheme_1,fontWeight:pw.FontWeight.bold)),
                                  pw.SizedBox(width: 10),
                                ]
                            )
                        ),
                        pw.Container(
                          width: double.infinity,
                          height: 40,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: pdftheme_1,width: 2),
                          ),
                          child: pw.Row(
                            children: [
                              pw.SizedBox(width:5),
                              pw.Text("Discount",style: pw.TextStyle(fontSize: 20,color:pdftheme_1,fontWeight:pw.FontWeight.bold)),
                              pw.Spacer(),
                              pw.Text("${(Global.all_discount * Global.Sub_total) / 100}",style: pw.TextStyle(fontSize: 20,color:pdftheme_1,fontWeight:pw.FontWeight.bold)),
                              pw.SizedBox(width: 10),
                            ]
                          )
                        ),
                        pw.Container(
                            width: double.infinity,
                            height: 40,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: pdftheme_1,width: 2),
                            ),
                            child: pw.Row(
                                children: [
                                  pw.SizedBox(width:5),
                                  pw.Text("Total Amount",style: pw.TextStyle(fontSize: 20,color:pdftheme_1,fontWeight:pw.FontWeight.bold)),
                                  pw.Spacer(),
                                  pw.Text("${Global.Total}",style: pw.TextStyle(fontSize: 20,color:pdftheme_1,fontWeight:pw.FontWeight.bold)),
                                  pw.SizedBox(width: 10),
                                ]
                            )
                        )

                      ]

                    )
                  ),
                ]
              )
            ),
          ),
      )
    );

    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoice PDF"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: theme_1,
      ),
      body: PdfPreview(
        build: (format) => generatePDF(),
      ),
    );
  }
}
