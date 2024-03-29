import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skindetect/util/colors.dart';

class ScaffoldColorCubit extends Cubit<Color> {
  ScaffoldColorCubit() : super(kGreen);

  toGreen() => emit(kGreen);
  toGray() => emit(kGray);
  toBlueLight() => emit(kBlueLigth);
}
