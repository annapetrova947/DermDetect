import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skindetect/classifiers/classifier_float.dart';
import 'package:skindetect/components/button.dart';
import 'package:skindetect/components/scaffold_with_nav.dart';
import 'package:skindetect/screens/diagnose_page.dart';
import 'package:skindetect/util/colors.dart';

// import 'package:tflite/tflite.dart';
import 'package:image/image.dart' as img;

final ImagePicker _picker = ImagePicker();

class HomePage extends StatefulWidget {
  HomePage() {
    color.toBlueLight();
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final classifierFloat;

  @override
  void initState() {
    classifierFloat = ClassifierFloat();
    super.initState();
  }

  void routeToWarningScreen(BuildContext context) {
    context.push("/home/warning");
  }

  String fromFullNamedLabelsToShortLabels(String label) {
    print('aaa: $label');
    switch (label) {
      case '0 Actinic keratosis':
        return 'akiec';
      case '1 Basal cell carcinoma':
        return 'bcc';
      case '2 Dermatofibroma':
        return 'df';
      case '3 Melanoma':
        return 'mel';
      case '4 Nevus':
        return 'nv';
      case '5 Pigmented Benign keratosis':
        return 'bkl';
      case '6 Seborrheic keratosis': // Not exists
        return 'bkl';
      case '7 Squamous Cell Carcinoma':
        return 'scc';
      case '8 Vascular lesion':
        return 'vasc';
      default:
        return 'vasc';
    }
  }

  void abstractHandler(BuildContext context, ImageSource imageSource) {
    _picker.pickImage(source: imageSource).then((image) {
      if (image != null) {
        final imageTemporary = File(image.path);

        img.Image imageInput =
            img.decodeImage(imageTemporary.readAsBytesSync())!;
        var pred = classifierFloat.predict(imageInput);

        routeToWarningScreen(context);

        imageTemporary.readAsBytes().then((value) =>
            predictionBloc.setPrediction(
                fromFullNamedLabelsToShortLabels(pred.label),
                pred.score,
                imageTemporary.path,
                value));

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(-15.0, 0, 0.0),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                  alignment: Alignment.center,
                  height: 65,
                  width: 75,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(height: 150),
              Row(children: [
                Expanded(
                    child: Text("Отсканируй новообразование для диагностики",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold, ))),
                //Icon(Icons.search, size: 70)
              ]),
              const SizedBox(height: 100),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                      label: "Выбать из галереи",
                      onTap: () =>
                          abstractHandler(context, ImageSource.gallery)),
                  const SizedBox(height: 20),
                  Button(
                      label: "Сделать фото",
                      onTap: () =>
                          abstractHandler(context, ImageSource.camera)),
                ],
              )
            ],
          )),
    );
  }
}
