
import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';


Future<String> reportView(context) async {

  final Document pdf = Document();

  pdf.addPage(
      MultiPage(
      pageFormat:
      PdfPageFormat.letter.copyWith(marginBottom: 1.5 * PdfPageFormat.cm),
      crossAxisAlignment: CrossAxisAlignment.start,
      header: (Context context) {
//        if (context.pageNumber == 1) {
//          return null;
//        }
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            decoration: const BoxDecoration(
                border:
                BoxBorder(bottom: true, width: 0.5, color: PdfColors.grey)),
            child: Text('Ejemplo de PDF',
                style: Theme.of(context)
                    .defaultTextStyle
                    .copyWith(color: PdfColors.grey))
        );
      },
      footer: (Context context) {
        return Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
            child: Text('Pagina ${context.pageNumber} de ${context.pagesCount}'));
      },
      build: (Context context) => <Widget>[
        Header(
            level: 0,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Reporte', textScaleFactor: 2),
                ])),
        SizedBox(
          height: 100.0
        ),
        Header(level: 1, text: 'Este es un titulo'),
        Paragraph(
            text:'Este es un ejemplo de parrafo'),
        Table.fromTextArray(context: context, data: const <List<String>>[
          <String>['Cantidad', 'Produto', 'Total'],
          <String>['1', 'Producto 1.0', '10.0'],
          <String>['2', 'Producto 1.1', '20.0'],
          <String>['3', 'Producto 1.2', '39.0'],
          <String>['4', 'Producto 1.3', '40.0'],
          <String>['5', 'Producto 1.4', '95.0'],
          <String>['', '', '204.0'],
        ]),
      ]));

  //save PDF
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/reporte.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());

 return path;
}