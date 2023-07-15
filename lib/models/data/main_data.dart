import 'data.dart';

class MainData {
  final StatusModel statusModel;
  final List<DataModel> dataModel;

  MainData({
    required this.statusModel,
    required this.dataModel,
  });
  factory MainData.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<DataModel> dataModelList =
        dataList.map((e) => DataModel.fromJson(e)).toList();
    return MainData(
      statusModel: StatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  MainData.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
}
