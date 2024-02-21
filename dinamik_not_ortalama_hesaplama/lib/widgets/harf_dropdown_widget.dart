import 'package:dinamik_not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../data/data_helper.dart';

class HarfDropdownWidget extends StatefulWidget {
 final Function onHarfSecildi;
  const HarfDropdownWidget({required this.onHarfSecildi, super.key});

  @override
  State<HarfDropdownWidget> createState() => _HarfDropdownWidgetState();
}

class _HarfDropdownWidgetState extends State<HarfDropdownWidget> {
   double secilenHarfDeger=4.0;
   

  @override
  Widget build(BuildContext context) {
     return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDawnPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade300.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value :secilenHarfDeger,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk,
        onChanged: (deger) {
          setState(() {
            secilenHarfDeger=deger!;
            widget.onHarfSecildi(secilenHarfDeger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),      ),
     ); 
  }
}