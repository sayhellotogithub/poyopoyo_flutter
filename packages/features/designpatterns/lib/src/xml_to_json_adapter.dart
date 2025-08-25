// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/25
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/json_parser.dart';

import 'legacy_xml_parser.dart';

class XmlToJsonAdapter implements JsonParser {
  final LegacyXmlParser _xmlParser;

  XmlToJsonAdapter(this._xmlParser);

  @override
  Map<String, dynamic> parse(String text) {
    return this._xmlParser.parseXml(text);
  }
}
