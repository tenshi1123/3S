class ApiPath {
  //baseurl
  static const String baseUrl = 'https://trungtam3s.vn/api';

  // api về đăng nhập, các thông tin của học sinh
  static const String login = '$baseUrl/login';
  static const String loginParent = '$baseUrl/login/parents';
  static const String getlistChildren = '$baseUrl/parents/children';
  static const String register = '$baseUrl/register';
  static const String forgotPassword = '$baseUrl/forgot-password';
  static const String refreshToken = '$baseUrl/refresh-token';
  // đăng ký tư vấn
  static const String learned = '$baseUrl/contact/learned/add';
  static const String contact = '$baseUrl/contact/add';
  // danh sách danh mục
  static const String category = '$baseUrl/category';
  // danh sách khóa học
  static const String course = '$baseUrl/course';

  // lịch học sắp tới
  static const String schedule = '$baseUrl/schedule';

  // danh sách lịch học
  static const String listSchedule = '$baseUrl/schedule/list';

  // theo dõi lớp học điểm danh
  static const String lopHoc = '$baseUrl/class';

  // chi tiết lớp học
  static const String detailClass = '$baseUrl/detail/class';

  // chi tiết buổi điểm danh
  static const String detailRollCall = '$baseUrl/detail/homework/class';

  // chi tiết homework
  static const String detailHomework = '$baseUrl/detail/homework';

  // Tổng kết tháng danh sách khóa học
  static const String reportSchedule = '$baseUrl/report/schedule';

  // Tổng kết tháng - điểm tổng trên tháng
  static const String reportPoint = '$baseUrl/report/point';

  // thông tin tài khoản
  static const String user = '$baseUrl/user/info';

  // xóa tài khoản
  static const String deleteUser = '$baseUrl/user/delete';

  // check password
  static const String checkPassword = '$baseUrl/user/password/check';

  // Đổi mật khẩu
  static const String changePassword = '$baseUrl/user/password/update';

  //check thông báo mới hay không
  static const String checkNoti = '$baseUrl/notification/check';

  //danh sách thông báo
  static const String getListNoti = '$baseUrl/notification';

  //Chi tiết thông báo
  static const String getDetailNoti = '$baseUrl/notification/detail';
  //Gửi thông tin onesignal id
  static const String pushOnsignalId = '$baseUrl/notify/onesignal_id';
  //Cập nhật trạng thái khi ấn vào chi tiết
  static const String updateStatusNoti = '$baseUrl/notification/update';

  // gửi bài tập
  static const String uploadHomeWork = '$baseUrl/detail/homework/upload';
}
