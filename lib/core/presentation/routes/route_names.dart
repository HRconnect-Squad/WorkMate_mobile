class RouteNames {
  RouteNames._();

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/signup';

  // Onboarding
  static const String onboarding = '/';

  // Main App
  static const String homeScreen = '/home';
  static const String attendantScreen = '/attendant';
  static const String taskScreen = '/task';
  static const String expenseScreen = '/expense';
  static const String submitExpense = '/expense/submit';
  static const String leaveScreen = '/leave';

  // Profile
  static const String profile = '/profile';
  static const String personalData = '/profile/personal-data';
  static const String payrollHistory = '/profile/payroll';
  static const String payrollDetails = '/profile/payroll/details';
  static const String officeAssets = '/profile/office-assets';

  // Error
  static const String notFound = '/404';


  static const List<String> _protectedRoutes = [
    homeScreen,
    attendantScreen,
    taskScreen,
    expenseScreen,
    leaveScreen,
    profile,
  ];

  static bool isProtectedRoute(String location) {
    return _protectedRoutes.any((route) => location.startsWith(route));
  }

  static bool isAuthRoute(String location) {
    return location == login || location == register;
  }

  static bool isOnboardingRoute(String location) {
    return location == onboarding;
  }

}