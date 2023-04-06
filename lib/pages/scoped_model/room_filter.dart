import 'package:hook_up_rent/pages/home/tab_search/filter_bar/data.dart';
import 'package:scoped_model/scoped_model.dart';

class FilterBarModel extends Model {
  List<GeneralType> _roomTypeList = [];
  List<GeneralType> _orientedList = [];
  List<GeneralType> _floorList = [];
  Set<String> _selectedList = Set();

  Map<String, List<GeneralType>> get dataList {
    var result = Map<String, List<GeneralType>>();
    result['roomTypeList'] = _roomTypeList;
    result['orientedList'] = _orientedList;
    result['floorList'] = _floorList;
    return result;
  }

  set dataList(Map<String, List<GeneralType>> data) {
    _roomTypeList = data['roomTypeList']!;
    _orientedList = data['orientedList']!;
    _floorList = data['floorList']!;
    notifyListeners(); // 模型改变的时候需要调用
  }

  Set<String> get selectedList {
    return _selectedList;
  }

  selectedListToggleItem(String data) {
    if (_selectedList.contains(data)) {
      _selectedList.remove(data);
    } else {
      _selectedList.add(data);
    }
    notifyListeners(); // 模型改变的时候需要调用
  }
}
