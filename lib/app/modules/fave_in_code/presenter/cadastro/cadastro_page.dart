import 'dart:io';
import 'package:app_dos_mlk/app/modules/shared/screen_fundo/background_all_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  String? imagePath;

  void _uploadImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      final appDir = await getApplicationDocumentsDirectory();
      final fileName = 'asset/banco-pan.png';
      final savedImage = await file.copy('${appDir.path}/$fileName');

      setState(() {
        imagePath = savedImage.path;
      });
    } else {
      print('usuario cancelou a selecao de imagem');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundAllPage(),
          Center(
            child: Transform.translate(
              offset: const Offset(100, -240),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: imagePath != null
                          ? DecorationImage(
                              image: FileImage(File(imagePath!)),
                              fit: BoxFit.cover,
                            )
                          : null,
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: imagePath != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.file(
                              File(imagePath!),
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
          Center(
            // Botão de upload
            child: Transform.translate(
              offset: const Offset(70, -160),
              child: ElevatedButton.icon(
                onPressed: _uploadImage,
                icon: const Icon(Icons.cloud_upload),
                label: Text(''), 
              ),
            ),
          )
        ],
      ),
    );
  }
}
