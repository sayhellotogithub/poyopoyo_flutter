// -------------------------------------------------------------------
// Author: WANG JUN
// Date: 2025/09/09
// Description: 
// -------------------------------------------------------------------
class ErrorRouteConfig {
  final String loginRoute;
  final String kycRoute;
  final String maintenanceRoute;
  final String networkErrorRoute;

  const ErrorRouteConfig({
    this.loginRoute = '/login',
    this.kycRoute = '/kyc',
    this.maintenanceRoute = '/maintenance',
    this.networkErrorRoute = '/network-error',
  });
}