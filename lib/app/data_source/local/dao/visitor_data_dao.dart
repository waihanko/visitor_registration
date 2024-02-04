import 'package:hive/hive.dart';
import 'package:visitor_registration/app/data_source/local/vo/visitor_data_vo.dart';

import '../../../constant/app_constants.dart';

class VisitorDataDao{
  static final VisitorDataDao _singleton = VisitorDataDao._internal();

  factory VisitorDataDao() {
    return _singleton;
  }

  VisitorDataDao._internal();

  Box<VisitorDataVo> getVisitorDataBox() {
    return Hive.box<VisitorDataVo>(kBoxNameForVisitorData);
  }

  List<VisitorDataVo> getVisitorData() {
    return getVisitorDataBox().values.toList().reversed.toList();
  }

  Future addVisitorData({required VisitorDataVo visitorDataVo}) async {
    await getVisitorDataBox().add(visitorDataVo);
  }

}