import 'package:dinamik_not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_not_ortalama_hesaplama/models/ders.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DersListesi extends StatelessWidget {
  final Function oDersCikarildi;

  const DersListesi({required this.oDersCikarildi, Key? key}): super(key : key);
 
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;  
    //veri kaynağı
    return tumDersler.length>0 ? 
    ListView.builder(
      itemCount: tumDersler.length,
      itemBuilder: (context,index) {
      return Dismissible( //silme işlemi
        key: UniqueKey(),
        direction: DismissDirection.startToEnd, //sağa kaydirarak silme işlemi.
        onDismissed: (a) {
        oDersCikarildi(index);  //ders çıkarıldıgında
      
       },
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Card(
            child: ListTile(
            title: Text(tumDersler[index].ad),
            leading: CircleAvatar(
              backgroundColor:Sabitler.anaRenk,
              child: Text((tumDersler[index].harfDegeri *
               tumDersler[index].krediDegeri)
               .toStringAsFixed(0),),
            ),
            subtitle: Text('${tumDersler[index].krediDegeri} Kredi , Not degeri: ${tumDersler[index].harfDegeri}.'),
            
          ),
            ),
        ),
      );
      }
    ): Container(child: Center(
      child: Text("Lutfen Ders Ekleyin",
      style:Sabitler.baslikStyle,),),
    );
  }
}