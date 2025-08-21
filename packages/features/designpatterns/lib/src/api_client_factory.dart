// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/08/21
// Description:
// -------------------------------------------------------------------
import 'api_class.dart';

abstract class ApiClientFactory {
  ApiClient createApiClient();
}

class RestApiClientFactory implements ApiClientFactory {
  @override
  ApiClient createApiClient() {
    return RestApiClient();
  }
}

class GraphQLApiClientFactory implements ApiClientFactory {
  @override
  ApiClient createApiClient() {
    return GraphQLApiClient();
  }
}
