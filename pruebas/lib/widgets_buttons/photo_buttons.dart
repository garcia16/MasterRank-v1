// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../firebase_utils/mysql.dart';
import '../firebase_utils/storage_service.dart';
import '../screens/group_screen.dart';
import '../utils/buttons_style.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class PhotoButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Storage storage = Storage();
    return SafeArea(
      bottom: false,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(color:Color(0x0000ffff)),
            ElevatedButton.icon(
              onPressed: () async{
                final results = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['png','jpg'],
                );

                if (results == null){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('No file selected'),
                    )
                  );
                }

                final path = results!.files.single.path;
                final fileName = results.files.single.name;

                storage.uploadFile(path!, fileName).then((value) => print('Done'));
                
                addPhotoBBDD(fileName);


              },
              icon: Icon(Icons.image,size: iconArrowMax.size,), 
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text('Añadir foto'),
                  Icon(Icons.arrow_forward_ios_outlined,size: iconArrowMax.size,),
                ]
              ),
              style: ButtonStyles.photos(context),
            ),
          ],
        ),
      ),
    );
  }


  //upload and get download url
  



  void addPhotoBBDD(String fileName) async{

    Reference ref = FirebaseStorage.instance.ref().child(fileName);//generate a unique name
    String imageUrl = await ref.getDownloadURL();
      
      var db = Mysql();
      String insertSQL = '';
        insertSQL = 'INSERT INTO PHOTOS_GROUP_TABLE VALUES(' +id_group.toString()+ ','+'"'+name_group+'"'+ ','+'"'+imageUrl+'"'+')';
      
      db.getConnection().then((conn) async {
        await conn.query(insertSQL);

        conn.close();

      });
      print('URL: ' + imageUrl);
  }
  


}