class ApiPath {
  //baseurl
  static const String baseUrl = 'https://trungtam3s.vn/api';

  // api về đăng nhập, các thông tin của học sinh
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String forgotPassword = '$baseUrl/forgot-password';

  // danh sách khóa học
  static const String course = '$baseUrl/course';

  // lịch học sắp tới
  static const String schedule = '$baseUrl/schedule';

  // theo dõi lớp học điểm danh
  static const String lopHoc = '$baseUrl/class';

  // chi tiết lớp học
  static const String detailClass = '$baseUrl/detail/class';

  // chi tiết buổi điểm danh
  static const String detailHomework = '$baseUrl/detail/class';

  // thông tin tài khoản
  static const String user = '$baseUrl/user';
}
