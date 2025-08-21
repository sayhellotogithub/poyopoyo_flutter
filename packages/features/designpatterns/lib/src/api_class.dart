// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/21
// Description:
// -------------------------------------------------------------------
abstract class ApiClient {
  void request(String endpoint);
}

class RestApiClient extends ApiClient {
  @override
  void request(String endpoint) {
    print("REST API request: $endpoint");
  }
}

class GraphQLApiClient extends ApiClient {
  @override
  void request(String endpoint) {
    print("GraphQL API request: $endpoint");
  }
}
