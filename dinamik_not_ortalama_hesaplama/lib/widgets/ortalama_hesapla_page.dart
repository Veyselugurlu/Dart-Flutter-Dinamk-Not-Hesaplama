import 'package:dinamik_not_ortalama_hesaplama/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesaplama/data/data_helper.dart';
import 'package:dinamik_not_ortalama_hesaplama/models/ders.dart';
import 'package:dinamik_not_ortalama_hesaplama/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalama_hesaplama/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_not_ortalama_hesaplama/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_not_ortalama_hesaplama/widgets/ortalama_goster_page.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
    double secilenHarfDeger=4.0;
    double secilenKredi=1;
    String girilenDersAdi='';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,  //ekrani yana cevirince ekranı hata almamamizi saglar.
      appBar: AppBar(
        backgroundColor: Colors.amber,
        elevation: 0,
        title: Center(child: Text(Sabitler.baslikText),),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(flex:2,
              child: _buildForm(),
              ),
                Expanded(flex:1,
              child: OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length,
              ortalama:DataHelper.ortalamaHesapla()),
              ),
            ],
          ),
            Expanded(
              child:DersListesi(
                oDersCikarildi: (index){
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {
                    
                  });
                },
              ),
              ),
        ],
      )
    );
  }
  
Widget _buildForm() {
return Form(
  key: formKey,
  child: Column(
    children: [
    Padding(
      padding: Sabitler.yatayxy,
    child:_buildTextFormField(),),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric
          (horizontal: 8),
        child:HarfDropdownWidget(
          onHarfSecildi: (harf){
            secilenHarfDeger=harf;
          },
        ),
        ),
      ),
        Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric
          (horizontal: 8),
        child:KrediDropdownWidget(
          onKrediSecildi:(kredi){
            secilenKredi=kredi;
          },
        ),
        ),
      ),
    IconButton(
    onPressed: dersEkleVeOrtalamaHesapla,
    icon: Icon(Icons.arrow_forward_ios_sharp),
    color: Sabitler.anaRenk.shade600,
    iconSize: 30,),],
    ),SizedBox(height: 5,)

  ],),);

  }
  
  _buildTextFormField() {
      return TextFormField(
        onSaved: (deger) {
          setState(() {
            girilenDersAdi=deger!;
          });
        },
        validator: 
        (s) {
          if(s!.length<=0){   //kullanıcı ders adini girmek zorunda.
            return'Ders Adi Giriniz';
          }
        },
        decoration: InputDecoration(
          hintText: "Matematik",
          border: OutlineInputBorder(
            borderRadius: Sabitler.borderRadius,
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Sabitler.anaRenk.shade50,
        ),
      );
  }
  



  void dersEkleVeOrtalamaHesapla() {
    if(formKey.currentState!.validate()){

      formKey.currentState!.save();  // onsaved içerisindeki degerleri kaydedittik kaydetmezsek dersadi gelmez.
      var eklencekDers=Ders(
        ad: girilenDersAdi, harfDegeri: secilenHarfDeger,
         krediDegeri:secilenKredi);
    DataHelper.dersEkle(eklencekDers);
      print(DataHelper.ortalamaHesapla());
      setState(() {
        
      });
    }
}
}