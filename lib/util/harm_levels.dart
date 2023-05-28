import 'package:flutter/material.dart';
import 'package:skindetect/util/colors.dart';

Map<String, String> harmLevels = {
  "akiec": "Средний риск",
  "bkl": "Безвредно",
  "mel": "Высокий риск",
  "df": "Безвредно",
  "nv": "Безвредно",
  "bcc": "Высокий риск",
  "vasc": "Безвредно",
  "scc": "Безвредно",

};

Map<String, Color> harmColors = {
  "Средний риск": kBlue,
  "Безвредно": Colors.white,
  "Высокий риск": kGreen,
};

Map<String, String> harmLabels = {
  "akiec": "Актинический кератоз",
  "bkl": "Доброкачественный кератоз",
  "mel": "Меланома",
  "df": "Дерматофиброма",
  "nv": "Меланоцитарный невус",
  "bcc": "Базально-клеточная карцинома",
  "vasc": "Сосудистые поражения",
  "scc": "Плоскоклеточная карцинома"
};
