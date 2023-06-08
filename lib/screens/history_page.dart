import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:skindetect/components/scaffold_with_nav.dart';
import 'package:skindetect/data_model/diagnosis.dart';
import 'package:skindetect/main.dart';
import 'package:skindetect/util/harm_levels.dart';
import '../util/colors.dart';
import '../util/date_formatter.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage() {
    color.toGray();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "История диагностики",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Ваши последние сканирований",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 40),
          Text(
            "Все диагнозы",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          ValueListenableBuilder<Box<Diagnosis>>(
            valueListenable: Hive.box<Diagnosis>(history).listenable(),
            builder: (context, box, widget) {
              List<Diagnosis> scans = box.values.toList();
              return Column(children: [
                for (Diagnosis scan in scans)
                  Column(children: [
                    GestureDetector(
                        onTap: () => context.push("/history/scan/${scan.key}", extra: df.format(scan.createdAt.toLocal())),
                        child: Dismissible(
                          key: Key("${scan.key}"),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) => scan.delete(),
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Подтвердите удаление"),
                                  content: const Text(
                                      "Вы уверены, что хотите удалить этот диагноз из истории? Это действие нельзя будет отменить."),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("Отмена"),
                                    ),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text("Удалить")),
                                  ],
                                );
                              },
                            );
                          },
                          background: Container(
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: kBlack),
                                      borderRadius: BorderRadius.circular(7),
                                      color: harmColors[harmLevels[scan.label]!]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(harmLevels[scan.label]!,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Flexible(
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(harmLabels[scan.label]!,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: kBlack)),
                                      const SizedBox(height: 2),
                                      
                                      Text(df.format(scan.createdAt.toLocal()),
                                          style: TextStyle(
                                              color: kDarkGray, fontSize: 13))
                                    ]),
                              ),
                            ]),
                          ),
                        )),
                    const SizedBox(height: 8),
                  ])
              ]);
            },
          ),
          // for (final faqEntry in faqInfo)
        ],
      )),
    );
  }
}
