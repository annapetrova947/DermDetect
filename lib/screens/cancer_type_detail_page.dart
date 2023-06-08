import 'package:flutter/material.dart';
import 'package:skindetect/components/scaffold_with_nav.dart';
import 'package:skindetect/util/colors.dart';
import 'package:skindetect/util/text_styles.dart';
import '../components/custom_app_bar.dart';
import '../util/cancer_type_info.dart';

class CancerTypeDetailPage extends StatelessWidget {
  CancerTypeDetailPage({required this.cancerTypeId}) {
    color.toGray();
  }

  final String cancerTypeId;

  @override
  Widget build(BuildContext context) {
    CancerTypeEntry cTypeEntry =
        cTypes.firstWhere((entry) => entry.id == int.parse(cancerTypeId));
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(color: kGray),
            child: Column(
              children: [
                CustomAppBar(title: "Информация"),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: AspectRatio(
                                          aspectRatio: 1,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image(
                                                image: AssetImage(
                                                    cTypeEntry.picture),
                                                alignment: Alignment.center,
                                                fit: BoxFit.cover,
                                              )))),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(cTypeEntry.type,
                                        textAlign: TextAlign.center,
                                        style: kAppbarHeader),
                                  )),
                                ]),
                            // const SizedBox(height: 30),
                            // RangeBar(percent: cTypeEntry.risk, label: "Risk"),
                            const SizedBox(height: 25),
                            Text("О новообразовании", style: kAppbarHeader),
                            const SizedBox(height: 10),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    cTypeEntry.description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ]),
                            const SizedBox(height: 30),
                            //MyLesionLooksDifferentInfo(),
                            const SizedBox(
                              height: 40,
                            ),
                          ])),
                )
              ],
            )),
      ],
    );
  }
}
