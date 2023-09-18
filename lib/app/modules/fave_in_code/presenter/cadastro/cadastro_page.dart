import 'dart:io';
import 'package:app_dos_mlk/app/modules/shared/screen_fundo/background_all_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
      setState(() {
        imagePath = result.files.single.path!;
      });
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
              offset: const Offset(0, -240),
              child: Row(
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
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

                  const SizedBox(
                    width: 10,
                  ),
                  // Botão de upload
                  Positioned(
                    top: 160,
                    right: 40,
                    child: ElevatedButton(
                      onPressed: _uploadImage,
                      child: Text('Fazer Upload de Imagem'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
