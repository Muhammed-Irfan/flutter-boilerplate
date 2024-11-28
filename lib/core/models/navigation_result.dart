class NavigationResult {
  final String? routeName;    
  final Map<String, String>? pathParams;  
  final Map<String, String>? queryParams; 
  final Map<String, dynamic>? extra;   
  final String? message;

  const NavigationResult({
    this.routeName,
    this.pathParams,
    this.queryParams,
    this.extra,
    this.message,
  });

  static NavigationResult navigate({
    required String routeName,
    Map<String, String>? pathParams,
    Map<String, String>? queryParams,
    Map<String, dynamic>? extra,
    String? message,
  }) =>
      NavigationResult(
        routeName: routeName,
        pathParams: pathParams,
        queryParams: queryParams,
        extra: extra,
        message: message,
      );

  static NavigationResult back({
    String? message,
    Map<String, dynamic>? extra,
  }) =>
      NavigationResult(
        message: message,
        extra: extra,
      );
} 
