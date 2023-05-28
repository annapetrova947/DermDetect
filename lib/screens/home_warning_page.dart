import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skindetect/components/button.dart';
import 'package:skindetect/components/scaffold_with_nav.dart';
import 'package:skindetect/util/colors.dart';

class HomeWarningPage extends StatelessWidget {
  HomeWarningPage() {
    color.toBlueLight();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(color: kBlueLigth),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.warning_sharp, size: 100),
        const SizedBox(height: 10),
        Text(
            "Результат на следующей странице является только прогнозом нашей нейронной сети. Это приложение не заменяет дерматолога и онколога. Предсказание может быть неверным.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kBlack,
                height: 1.3)),
        const SizedBox(height: 40),
        SizedBox(
            width: double.infinity,
            child: Button(
                label: "Понятно",
                onTap: () => {context.pushReplacement("/home/diagnose")})),
      ]),
    );
  }
}
