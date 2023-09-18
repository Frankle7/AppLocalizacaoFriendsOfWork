import 'package:app_dos_mlk/app/asset/images_of_projecto.dart';
import 'package:app_dos_mlk/app/modules/shared/screen_fundo/detalhes_superior_bckd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundAllPage extends StatefulWidget {
   BackgroundAllPage({super.key});

  @override
  State<BackgroundAllPage> createState() => _BackgroundAllPageState();
}

class _BackgroundAllPageState extends State<BackgroundAllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // Conteúdo abaixo da curva
            color: Color.fromRGBO(39, 124, 185, 83),
            height: double.infinity,
          ),

          // UploadFile(),

          ClipPath(
            // Container com curva no topo
            clipper: DetalhesSuperiorBckd(),
            child: Container(
              color: Colors.white,
              height: 200.0, // Altura da curva
            ),
          ),
          SizedBox(
            width: 80,
            height: 38,
            child: Center(
              child: Transform.translate(
                offset: const Offset(35, 33),
                child: SvgPicture.string(ImagesOfProjecto.logoPan),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
