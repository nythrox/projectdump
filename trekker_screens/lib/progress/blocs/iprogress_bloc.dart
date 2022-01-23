

import 'package:trekkers/store/model/level.dart';

abstract class IProgressBloc{
  Future<List<Level>> get levels;
}