class ApiEndPoint {
  static const String baseUrl = "https://cleaning.visooft.com/api";
  //! Auth
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String checkUser = "/auth/check-user";
  static const String forgotPassword = "/auth/forgot-password";
  static const String verifyCode = "/auth/send-verification-code";
  static const String verifyCodePassword = "/auth/verify-code";
  static const String resendCode = "/send-reset-otp";
  static const String resetPassword = "/auth/reset-password";
  static const String logout = "/auth/logout";
  //! Profile
  static const String getAndUpdateProfile = "/profile";
  static const String updatePassword = "/user/change-password";
  //! More
  static const String getMorePrivacyAndAboutUs = "/settings/app-info";
  static const String contactUs = "/contact-us";
  static const String branches = "/branches";
  //! classification and sub
  static const String classification = "/categories";
  static String getSubClassificationProduct(int id) =>
      "/ecommerce/product/category/$id";
  static String getDetailsProduct(int id) => "/ecommerce/product/$id";
  static String getRelatedProduct(int id) => "/ecommerce/product/$id/related";
  //! home
  static const String getHome = "/home";
  static String detailsPackages(int id) => "/packages/${id}";
  //! cart
  static const String getAndAddToCart = "/ecommerce/cart";
  static String updateQuantity(int id) => "/ecommerce/cart/$id";
  static const String coupon = "/coupons";
  static const String getNearOurBranches = "/branches/getNearly";
  static String getNearByDoctor(int id) => "/doctors/$id/online";
  //! favourite
  static String addOrDeleteFavourite(int id) => "/favourite/$id";
  static const String getFavourite = "/favourite";
  //! address
  static const String addAndGetAddress = "/addresses";
  //! Requests
  static const String requests = "/orders";
  static String returnTheRequest(int id) => "/orders/return/$id";
  //! Notification
  static const String notification = "/notifications";
  //! Search
  static const String search = "/search";
}
