// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/25
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/legacy_xml_parser.dart';
import 'package:design_patterns/src/xml_to_json_adapter.dart';

void main() {
  final parser = XmlToJsonAdapter(LegacyXmlParser());
  final result = parser.parse("<data>hello</data>");
  print(result);
}
