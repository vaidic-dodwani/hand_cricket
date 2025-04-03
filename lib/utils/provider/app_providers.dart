import 'package:hand_cricket/view_model/homescreen_view_model/homescreen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => HomeScreenNotifier()),
  ];
}
