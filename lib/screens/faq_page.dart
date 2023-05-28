import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skindetect/components/scaffold_with_nav.dart';
import 'package:skindetect/util/cancer_type_info.dart';
import 'package:skindetect/util/faq_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/button.dart';
import '../components/faq_row.dart';

final contactLink = Uri.parse(
    "mailto:skindetect@gmail.com?subject=SkinDetect App Support&body=Please write your question here...");

class FaqPage extends StatelessWidget {
  FaqPage() {
    color.toGray();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(22, 0, 22, 0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              "Типы определяемых новообразований",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            for (final cType in cTypes)
              FaqRow(
                  onTap: () async => context.push("/faq/ct/${cType.id}"),
                  green: true,
                  title: cType.type, subtitle: '',),
                  //subtitle: cType.riskText),
            SizedBox(height: 60),
          ],
        )),
      ),
    ]);
  }
}
