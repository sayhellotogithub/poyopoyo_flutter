// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/20
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/app_config.dart';

void main() {
  var config1 = AppConfig();
  var config2 = AppConfig();

  print(identical(config1, config2));
}
