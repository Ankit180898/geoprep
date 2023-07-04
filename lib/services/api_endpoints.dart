
class ApiEndpoints{
  // static final String baseUrl="https://sheqonomi.vercel.app/api/";
  static const String baseUrl="https://geoprep.co.in/api/";
  static AuthEndPoints authEndpoints= AuthEndPoints();
  static ProfileEndPoints profileEndPoints=ProfileEndPoints();
  static CategoriesEndPoints categoriesEndPoints=CategoriesEndPoints();
  static CoursesEndPoints coursesEndPoints=CoursesEndPoints();
  static MaterialsEndPoints materialsEndPoints=MaterialsEndPoints();




// Future<dynamic> register(Str)
}
class AuthEndPoints {
  final String registerEmail='auth-signup.php';
  final String verifyOtp='auth-signup-otp-verify.php';
  final String resendOtp='auth-signup-otp-resend.php';
  final String loginEmail='auth-login.php';
  final String logout='auth-logout.php';
}

class ProfileEndPoints{
  final String profile='user-profile.php';
}
class CategoriesEndPoints{
  final String categories='master-category.php';
  final String subCategories='master-sub-category.php?categoryKey=';
}
class CoursesEndPoints{
  final String courses='master-course-list.php?subCategoryKey=';
  final String coursesDetails='master-course-details.php?courseKey=';
  final String courseTopicList='master-course-topics.php?courseKey=2&languageKey=2';
  final String chaptersList='master-course-chapters.php?topicKey=';

}
class MaterialsEndPoints{
  final String textMaterials="course-material-text.php?";
  final String videoMaterials="course-material-video.php?";

}