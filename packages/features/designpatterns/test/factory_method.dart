// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/21
// Description:
// -------------------------------------------------------------------
import 'package:design_patterns/src/api_client_factory.dart';

void main() {
  ApiClientFactory factory = RestApiClientFactory();
  var client = factory.createApiClient();
  client.request("/users");

  factory = GraphQLApiClientFactory();
  client = factory.createApiClient();
  client.request("/users");
}
