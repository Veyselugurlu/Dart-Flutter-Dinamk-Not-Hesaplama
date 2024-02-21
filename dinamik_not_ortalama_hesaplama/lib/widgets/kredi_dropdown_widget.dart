import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/app_constants.dart';
import '../data/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final onKrediSecildi;
  const KrediDropdownWidget({required this.onKrediSecildi ,super.key});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
    double secilenKredi=1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Sabitler.dropDawnPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade300.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
        
      ),
      child: DropdownButton<double>(
        value :secilenKredi,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
  
        onChanged: (deger) {
          setState(() {
            secilenKredi=deger!;
            widget.onKrediSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),),   //itemleri aktarır ekrana    
     ); 
  }
}