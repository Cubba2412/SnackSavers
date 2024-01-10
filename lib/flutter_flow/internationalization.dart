import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'zh_Hans', 'vi', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? zh_HansText = '',
    String? viText = '',
    String? esText = '',
  }) =>
      [enText, zh_HansText, viText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ListView
  {
    'fd1wp338': {
      'en': 'Your Listings',
      'es': 'Tus anuncios',
      'vi': 'danh sách của bạn',
      'zh_Hans': '您的清单',
    },
    'n7ge3ut7': {
      'en': 'Bakery',
      'es': 'Panadería',
      'vi': 'Cửa hàng bánh mì',
      'zh_Hans': '面包店',
    },
    'gxvryn8x': {
      'en': 'Restaurant',
      'es': 'Restaurante',
      'vi': 'Quán ăn',
      'zh_Hans': '餐厅',
    },
    'luih89km': {
      'en': 'Cafe',
      'es': 'Cafetería',
      'vi': 'quán cà phê',
      'zh_Hans': '咖啡店',
    },
    'dn4aeljg': {
      'en': 'What would you like to save?',
      'es': '¿Qué te gustaría guardar?',
      'vi': 'Bạn muốn lưu gì?',
      'zh_Hans': '你想保存什么？',
    },
    'otjbt4dq': {
      'en': '',
      'es': '',
      'vi': '',
      'zh_Hans': '',
    },
    'fcqynxjv': {
      'en': 'Your listings',
      'es': 'Tus anuncios',
      'vi': 'danh sách của bạn',
      'zh_Hans': '您的列表',
    },
    'vesd9j7x': {
      'en': 'Other listings',
      'es': 'Otros listados',
      'vi': 'danh sách khác',
      'zh_Hans': '其他房源',
    },
    'ydrov2x2': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // MapView
  {
    '2lj7tueg': {
      'en': 'Click here to see more stores with food to save',
      'es': 'Haga clic aquí para ver más tiendas con alimentos para ahorrar',
      'vi': 'Nhấn vào đây để xem thêm các cửa hàng có thực phẩm để tiết kiệm',
      'zh_Hans': '单击此处查看更多可节省食物的商店',
    },
    'am9o3xjv': {
      'en': 'Map',
      'es': 'Mapa',
      'vi': 'Bản đồ',
      'zh_Hans': '地图',
    },
  },
  // AccountView
  {
    'fjsq4w0r': {
      'en': 'Account',
      'es': 'Cuenta',
      'vi': 'Tài khoản',
      'zh_Hans': '帐户',
    },
    'kxgvsqig': {
      'en': 'Account Details',
      'es': 'detalles de la cuenta',
      'vi': 'Chi tiết tài khoản',
      'zh_Hans': '帐户详细资料',
    },
    'lxve3i7r': {
      'en': 'Your Orders',
      'es': 'Tus ordenes',
      'vi': 'đơn đặt hàng của bạn',
      'zh_Hans': '你的命令',
    },
    'aum4i87b': {
      'en': 'Your Sold Orders',
      'es': 'Tus pedidos vendidos',
      'vi': 'Đơn đặt hàng đã bán của bạn',
      'zh_Hans': '您的已售订单',
    },
    'qn43mpm7': {
      'en': 'Stripe Account',
      'es': 'Cuenta de banda',
      'vi': 'Tài khoản sọc',
      'zh_Hans': '条纹帐户',
    },
    '42q3d0p2': {
      'en': 'General',
      'es': 'General',
      'vi': 'Chung',
      'zh_Hans': '一般的',
    },
    '6zrzkwan': {
      'en': 'App Settings',
      'es': 'Ajustes de Aplicacion',
      'vi': 'Cài đặt ứng dụng',
      'zh_Hans': '应用程序设置',
    },
    'mlvl7wvr': {
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
      'vi': 'Chính sách bảo mật',
      'zh_Hans': '隐私政策',
    },
    'b899rrve': {
      'en':
          'Don\'t have an account yet?\nClick here to sign up\nand start saving snacks!',
      'es':
          '¿Aún no tienes una cuenta?\nHaga clic aquí para registrarte\n¡y empieza a ahorrar snacks!',
      'vi':
          'Vẫn chưa có tài khoản?\nNhấp chuột vào đây để đăng ký\nvà bắt đầu tiết kiệm đồ ăn nhẹ!',
      'zh_Hans': '还没有帐户？\n点击此处注册\n并开始节省零食！',
    },
    'zgiwg9em': {
      'en': 'Sign up here',
      'es': 'Registrate aquí',
      'vi': 'Đăng ký tại đây',
      'zh_Hans': '在此注册',
    },
    '3vxehiov': {
      'en':
          'A you a food business owner?\nJoin SnackSavers and regain revenue while saving the planet',
      'es':
          '¿Eres dueño de un negocio de comida?\nÚnase a SnackSavers y recupere ingresos mientras salva el planeta',
      'vi':
          'Bạn là chủ doanh nghiệp kinh doanh thực phẩm?\nTham gia SnackSavers và lấy lại doanh thu trong khi cứu hành tinh',
      'zh_Hans': '您是食品企业主吗？\n加入 SnackSavers 并在拯救地球的同时重获收入',
    },
    'lsdag8m5': {
      'en': 'Sign up as a Business',
      'es': 'Regístrese como empresa',
      'vi': 'Đăng ký làm doanh nghiệp',
      'zh_Hans': '注册为企业',
    },
    'z43bez9c': {
      'en': 'Account',
      'es': 'Cuenta',
      'vi': 'Tài khoản',
      'zh_Hans': '帐户',
    },
  },
  // AccountSettingsView
  {
    '5mq5yr88': {
      'en': 'Your profile',
      'es': 'Tu perfil',
      'vi': 'Hồ sơ của bạn',
      'zh_Hans': '您的个人资料',
    },
    'mc34axka': {
      'en': 'Account Settings',
      'es': 'Configuraciones de la cuenta',
      'vi': 'Cài đặt tài khoản',
      'zh_Hans': '帐号设定',
    },
    '9uzqb8my': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'vi': 'Chỉnh sửa hồ sơ',
      'zh_Hans': '编辑个人资料',
    },
    'xmb3dqik': {
      'en': 'Log Out',
      'es': 'Cerrar sesión',
      'vi': 'Đăng xuất',
      'zh_Hans': '登出',
    },
    'uwmgb9r7': {
      'en': 'Delete Account',
      'es': 'Borrar cuenta',
      'vi': 'Xóa tài khoản',
      'zh_Hans': '删除帐户',
    },
    'm09qq35b': {
      'en': '__',
      'es': '__',
      'vi': '__',
      'zh_Hans': '__',
    },
  },
  // FavouriteView
  {
    'q81s4m6b': {
      'en': 'Favourite stores',
      'es': 'tiendas favoritas',
      'vi': 'Cửa hàng yêu thích',
      'zh_Hans': '最喜欢的商店',
    },
    '54uaz87c': {
      'en': 'Favourites',
      'es': 'Favoritos',
      'vi': 'yêu thích',
      'zh_Hans': '收藏夹',
    },
  },
  // ListingView
  {
    'gfx15s2c': {
      'en': 'Purchased by: ',
      'es': 'Comprado por:',
      'vi': 'Được mua bởi:',
      'zh_Hans': '购买者：',
    },
    'ik12cyxt': {
      'en': 'Purchase time: ',
      'es': 'Tiempo de compra:',
      'vi': 'Thời gian mua hàng:',
      'zh_Hans': '购买时间：',
    },
    'ca90e5kf': {
      'en': 'Order Number: ',
      'es': 'Número de orden:',
      'vi': 'Số thứ tự:',
      'zh_Hans': '订单号：',
    },
    'q80d7dau': {
      'en': 'Quantity:',
      'es': 'Cantidad:',
      'vi': 'Định lượng:',
      'zh_Hans': '数量：',
    },
    '2fbx0y41': {
      'en': 'Order Total:',
      'es': 'Total del pedido:',
      'vi': 'Tổng số đơn đặt hàng:',
      'zh_Hans': '合计订单：',
    },
    '5yfyh31x': {
      'en': 'Valued at:',
      'es': 'Valorado en:',
      'vi': 'Có giá trị tại:',
      'zh_Hans': '价值：',
    },
    'xzt3boze': {
      'en': 'Update Listing',
      'es': 'Actualizar listado',
      'vi': 'Cập nhật danh sách',
      'zh_Hans': '更新清单',
    },
    '7xmals27': {
      'en': 'Delete Listing',
      'es': 'Eliminar listado',
      'vi': 'Xóa danh sách',
      'zh_Hans': '删除列表',
    },
  },
  // AppSettings
  {
    'x34et9df': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'es':
          'Elija qué notificaciones desea recibir a continuación y actualizaremos la configuración.',
      'vi':
          'Chọn những thông báo bạn muốn nhận bên dưới và chúng tôi sẽ cập nhật cài đặt.',
      'zh_Hans': '在下面选择您想要接收的通知，我们将更新设置。',
    },
    'x6k8a65s': {
      'en': 'Language',
      'es': 'Idioma',
      'vi': 'Ngôn ngữ',
      'zh_Hans': '语言',
    },
    '2lu99n34': {
      'en': 'Push Notifications',
      'es': 'Notificaciones push',
      'vi': 'thông báo đẩy',
      'zh_Hans': '推送通知',
    },
    'mdsde6cg': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'es':
          'Reciba notificaciones Push de nuestra aplicación de forma semi regular.',
      'vi':
          'Nhận thông báo Đẩy từ ứng dụng của chúng tôi một cách bán thường xuyên.',
      'zh_Hans': '半定期地从我们的应用程序接收推送通知。',
    },
    '98utjane': {
      'en': 'Email Notifications',
      'es': 'Notificaciónes de Correo Electrónico',
      'vi': 'thông báo thư điện tử',
      'zh_Hans': '电子邮件通知',
    },
    '3p2nm2af': {
      'en':
          'Receive email notifications from our marketing team about new features.',
      'es':
          'Reciba notificaciones por correo electrónico de nuestro equipo de marketing sobre nuevas funciones.',
      'vi':
          'Nhận thông báo qua email từ nhóm tiếp thị của chúng tôi về các tính năng mới.',
      'zh_Hans': '从我们的营销团队接收有关新功能的电子邮件通知。',
    },
    'mn7r47yf': {
      'en': 'Switch to Dark Mode',
      'es': 'Cambiar al modo oscuro',
      'vi': 'Chuyển sang Chế độ tối',
      'zh_Hans': '切换到深色模式',
    },
    'o9xwca44': {
      'en': 'Switch to Light Mode',
      'es': 'Cambiar al modo de luz',
      'vi': 'Chuyển sang Chế độ ánh sáng',
      'zh_Hans': '切换到灯光模式',
    },
    'wk9gwizv': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'vi': 'Lưu thay đổi',
      'zh_Hans': '保存更改',
    },
    'gjaz3djs': {
      'en': 'Settings',
      'es': 'Ajustes',
      'vi': 'Cài đặt',
      'zh_Hans': '设置',
    },
  },
  // EditProfileView
  {
    'zeyir2h5': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'vi': 'Chỉnh sửa hồ sơ',
      'zh_Hans': '编辑个人资料',
    },
    'tpa7z11m': {
      'en': 'Upload photo',
      'es': 'Subir foto',
      'vi': 'Tải ảnh lên',
      'zh_Hans': '上传图片',
    },
    'mb7ntx2f': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'vi': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'v2wboeak': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'vi': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'de87i6vh': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'vi': 'Số điện thoại',
      'zh_Hans': '电话号码',
    },
    'rjzg6pod': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'vi': 'Số điện thoại',
      'zh_Hans': '电话号码',
    },
    'szlly8fb': {
      'en': 'Name is required',
      'es': 'Se requiere el nombre',
      'vi': 'Tên là bắt buộc',
      'zh_Hans': '姓名为必填项',
    },
    'ovuepu6j': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'w4ix31j3': {
      'en': 'Email is required',
      'es': 'correo electronico es requerido',
      'vi': 'Email thì cần thiết',
      'zh_Hans': '电子邮件是必需的',
    },
    'ksm2okob': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'fkufzhfc': {
      'en': 'Phone number is required',
      'es': 'Se requiere el número de teléfono',
      'vi': 'Số điện thoại là bắt buộc',
      'zh_Hans': '电话号码是必需的',
    },
    'dhx8nif0': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'u7blv2da': {
      'en': 'Upload photo',
      'es': 'Subir foto',
      'vi': 'Tải ảnh lên',
      'zh_Hans': '上传图片',
    },
    'o84ytfn8': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'vi': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'nyb68wvb': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'vi': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'oba5s7b9': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'vi': 'Số điện thoại',
      'zh_Hans': '电话号码',
    },
    'gps4x8bo': {
      'en': 'Phone Number',
      'es': 'Número de teléfono',
      'vi': 'Số điện thoại',
      'zh_Hans': '电话号码',
    },
    'cnwdxycd': {
      'en': 'ABN Number',
      'es': 'Número ABN',
      'vi': 'Số ABN',
      'zh_Hans': 'ABN号码',
    },
    'p327npvu': {
      'en': 'ABN Number',
      'es': 'Número ABN',
      'vi': 'Số ABN',
      'zh_Hans': 'ABN号码',
    },
    'sdvindu4': {
      'en': 'Address',
      'es': 'Dirección',
      'vi': 'Địa chỉ nhà',
      'zh_Hans': '地址',
    },
    'eal0jq8i': {
      'en': 'Address',
      'es': 'Dirección',
      'vi': 'Địa chỉ nhà',
      'zh_Hans': '地址',
    },
    '5xyyxirx': {
      'en': 'Change Address',
      'es': 'Cambiar dirección',
      'vi': 'Thay đổi địa chỉ',
      'zh_Hans': '更换地址',
    },
    'izo8318o': {
      'en': 'Business name is required',
      'es': 'El nombre de la empresa es obligatorio',
      'vi': 'Tên doanh nghiệp là bắt buộc',
      'zh_Hans': '企业名称为必填项',
    },
    'gforbbhw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'yt31l3iq': {
      'en': 'Email is required',
      'es': 'correo electronico es requerido',
      'vi': 'Email thì cần thiết',
      'zh_Hans': '电子邮件是必需的',
    },
    '2ha5sj90': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'iww1oqi6': {
      'en': 'Phonenumber is required',
      'es': 'Se requiere número de teléfono',
      'vi': 'Số điện thoại là bắt buộc',
      'zh_Hans': '电话号码是必需的',
    },
    '0qpyn0af': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'rqf2cqoo': {
      'en': 'ABN number is required',
      'es': 'Se requiere el número ABN',
      'vi': 'Số ABN là bắt buộc',
      'zh_Hans': '需要 ABN 号码',
    },
    'azsiay5k': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '24her7nj': {
      'en': 'Street address is required (set it with the button below)',
      'es':
          'La dirección de la calle es obligatoria (configúrela con el botón de abajo)',
      'vi': 'Địa chỉ đường phố là bắt buộc (đặt nó bằng nút bên dưới)',
      'zh_Hans': '街道地址是必需的（使用下面的按钮设置）',
    },
    'coz583r2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '1n4ijqrh': {
      'en': 'Save Changes',
      'es': 'Guardar cambios',
      'vi': 'Lưu thay đổi',
      'zh_Hans': '保存更改',
    },
  },
  // AuthenticationView
  {
    'gvhj1c8f': {
      'en': 'Sign In',
      'es': 'Registrarse',
      'vi': 'Đăng nhập',
      'zh_Hans': '登入',
    },
    'hl721qdn': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'vi': 'E-mail',
      'zh_Hans': '电子邮件',
    },
    'zcq3l0iu': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'vi': 'Nhập email của bạn...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'ybluzk67': {
      'en': 'Password',
      'es': 'Contraseña',
      'vi': 'Mật khẩu',
      'zh_Hans': '密码',
    },
    'obyuzwnl': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
      'vi': 'Nhập mật khẩu của bạn...',
      'zh_Hans': '输入您的密码...',
    },
    'arm983i5': {
      'en': 'Sign In',
      'es': 'Registrarse',
      'vi': 'Đăng nhập',
      'zh_Hans': '登入',
    },
    'hey9u2r0': {
      'en': 'Forgot password?',
      'es': '¿Se te olvidó tu contraseña?',
      'vi': 'Quên mật khẩu?',
      'zh_Hans': '忘记密码？',
    },
    '5jmb94to': {
      'en': 'Skip login',
      'es': 'Saltar inicio de sesión',
      'vi': 'Bỏ qua đăng nhập',
      'zh_Hans': '跳过登录',
    },
    'lfnjyq3y': {
      'en': 'Please enter your email',
      'es': 'Por favor introduzca su correo electrónico',
      'vi': 'vui lòng nhập địa chỉ email của bạn',
      'zh_Hans': '请输入您的邮箱',
    },
    'cbexnewg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'chujvub9': {
      'en': 'Please enter your password',
      'es': 'Por favor, introduzca su contraseña',
      'vi': 'Xin hãy điền mật khẩu',
      'zh_Hans': '请输入您的密码',
    },
    'a8z3ivaw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '8wnl1odz': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
      'vi': 'Đăng ký',
      'zh_Hans': '报名',
    },
    'ufg2na7a': {
      'en': 'First Name',
      'es': 'Primer nombre',
      'vi': 'Tên đầu tiên',
      'zh_Hans': '名',
    },
    'h9uiw4mv': {
      'en': 'Enter your first name...',
      'es': 'Ponga su primer nombre...',
      'vi': 'Nhập tên của bạn...',
      'zh_Hans': '输入您的名字...',
    },
    'f0n2yer6': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'vi': 'Địa chỉ email',
      'zh_Hans': '电子邮件地址',
    },
    '7imrxe36': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'vi': 'Nhập email của bạn...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'wxv1iqlg': {
      'en': 'Phone number',
      'es': 'Número de teléfono',
      'vi': 'Số điện thoại',
      'zh_Hans': '电话号码',
    },
    '1d0zvztp': {
      'en': 'Enter your phone number...',
      'es': 'Ingrese su número telefónico...',
      'vi': 'Nhập số điện thoại của bạn...',
      'zh_Hans': '输入你的电话号码...',
    },
    'eqaatdxn': {
      'en': 'Password',
      'es': 'Contraseña',
      'vi': 'Mật khẩu',
      'zh_Hans': '密码',
    },
    'mdm21luw': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
      'vi': 'Nhập mật khẩu của bạn...',
      'zh_Hans': '输入您的密码...',
    },
    'dfcj00cm': {
      'en': 'Confirm Password',
      'es': 'Confirmar contraseña',
      'vi': 'Xác nhận mật khẩu',
      'zh_Hans': '确认密码',
    },
    'maiq7g79': {
      'en': 'Confirm password...',
      'es': 'Confirmar contraseña...',
      'vi': 'Xác nhận mật khẩu...',
      'zh_Hans': '确认密码...',
    },
    'ld12ajp0': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'vi': 'Tạo tài khoản',
      'zh_Hans': '创建账户',
    },
    'ktbeanrl': {
      'en': 'Skip login',
      'es': 'Saltar inicio de sesión',
      'vi': 'Bỏ qua đăng nhập',
      'zh_Hans': '跳过登录',
    },
    'txk32liy': {
      'en': 'Please enter your name',
      'es': 'por favor, escriba su nombre',
      'vi': 'xin hãy nhập tên của bạn',
      'zh_Hans': '请输入你的名字',
    },
    'hv74jb3z': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'yeeh3xhu': {
      'en': 'Email required for sign up',
      'es': 'Correo electrónico requerido para registrarse',
      'vi': 'Email cần thiết để đăng ký',
      'zh_Hans': '注册需要电子邮件',
    },
    'zrkf16ya': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '8n5f9n18': {
      'en': 'Phonenumber required for sign up',
      'es': 'Número de teléfono requerido para registrarse',
      'vi': 'Số điện thoại cần thiết để đăng ký',
      'zh_Hans': '注册需要电话号码',
    },
    'cpnyinkg': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'viaphkn4': {
      'en': 'Enter a password for your account',
      'es': 'Introduzca una contraseña para su cuenta',
      'vi': 'Nhập mật khẩu cho tài khoản của bạn',
      'zh_Hans': '输入您帐户的密码',
    },
    'ju48miej': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '4nr8xfrw': {
      'en': 'Enter the same password',
      'es': 'Introduce la misma contraseña',
      'vi': 'Nhập cùng một mật khẩu',
      'zh_Hans': '输入相同的密码',
    },
    '4cnha9ko': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'btpxrrjd': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // ForgotPasswordView
  {
    'jg8ptban': {
      'en': 'Forgot password',
      'es': 'Se te olvidó tu contraseña',
      'vi': 'Quên mật khẩu',
      'zh_Hans': '忘记密码',
    },
    '0z0dy2t8': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta a continuación.',
      'vi':
          'Chúng tôi sẽ gửi cho bạn một email có liên kết để đặt lại mật khẩu của bạn, vui lòng nhập email được liên kết với tài khoản của bạn bên dưới.',
      'zh_Hans': '我们将向您发送一封电子邮件，其中包含重置密码的链接，请在下方输入与您的帐户关联的电子邮件。',
    },
    '2jif4sh6': {
      'en': 'Your email address...',
      'es': 'Su dirección de correo electrónico...',
      'vi': 'Địa chỉ email của bạn...',
      'zh_Hans': '您的电子邮件地址...',
    },
    '8mfubcam': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'vi': 'Nhập email của bạn...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'k2bm657b': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
      'vi': 'Gửi đường dẫn',
      'zh_Hans': '发送链接',
    },
    'xdfpcr2u': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // IntroView
  {
    '16dxv45k': {
      'en': 'Welcome to SnackSavers',
      'es': 'Bienvenido a SnackSavers',
      'vi': 'Chào mừng đến với SnackSavers',
      'zh_Hans': '欢迎来到 SnackSavers',
    },
    'i6uhtiwz': {
      'en': 'Get quality food for less',
      'es': 'Consigue comida de calidad por menos',
      'vi': 'Nhận thực phẩm chất lượng với giá thấp hơn',
      'zh_Hans': '花更少的钱买到优质的食物',
    },
    '2oi0tjej': {
      'en':
          'Help businesses reduce waste and regain revenue while getting your hands on affordable quality food!',
      'es':
          '¡Ayude a las empresas a reducir el desperdicio y recuperar los ingresos mientras obtiene alimentos asequibles y de calidad!',
      'vi':
          'Giúp các doanh nghiệp giảm lãng phí và lấy lại doanh thu trong khi vẫn có được thực phẩm chất lượng với giá cả phải chăng!',
      'zh_Hans': '帮助企业减少浪费并重获收入，同时让您获得负担得起的优质食品！',
    },
    'zs97usr8': {
      'en': 'Reduce food waste',
      'es': 'Reducir el desperdicio de alimentos',
      'vi': 'Giảm chất thải thực phẩm',
      'zh_Hans': '减少食物浪费',
    },
    '5ohwdod8': {
      'en':
          '7.3 million tons of food is wasted every year. This is the equivavlent needed to feed the entire state of Victoria for an additional year!',
      'es':
          'Cada año se desperdician 7,3 millones de toneladas de alimentos. ¡Este es el equivalente necesario para alimentar a todo el estado de Victoria durante un año más!',
      'vi':
          '7,3 triệu tấn thực phẩm bị lãng phí mỗi năm. Đây là số tiền tương đương cần thiết để nuôi sống toàn bang Victoria thêm một năm nữa!',
      'zh_Hans': '每年有 730 万吨食物被浪费。这相当于整个维多利亚州再供养一年所需的量！',
    },
    '5njhhhcn': {
      'en': 'Dine from your favourite stores',
      'es': 'Cene de sus tiendas favoritas',
      'vi': 'Dùng bữa tại các cửa hàng yêu thích của bạn',
      'zh_Hans': '从您最喜欢的商店用餐',
    },
    'cvbfv3fy': {
      'en':
          'Support your favourite restaurants while enjoying their delicious food!',
      'es':
          '¡Apoya a tus restaurantes favoritos mientras disfrutas de su deliciosa comida!',
      'vi':
          'Hỗ trợ các nhà hàng yêu thích của bạn trong khi thưởng thức các món ăn ngon của họ!',
      'zh_Hans': '支持您最喜爱的餐厅，同时享受他们的美味佳肴！',
    },
    'duuvc4gm': {
      'en': 'Login or Register',
      'es': 'Inicie sesión o regístrese',
      'vi': 'đăng nhập hay đăng ký',
      'zh_Hans': '登录或注册',
    },
    'jub65lrl': {
      'en': 'Register as a business',
      'es': 'Regístrate como empresa',
      'vi': 'Đăng ký như một doanh nghiệp',
      'zh_Hans': '注册为企业',
    },
    'pr2ll3a8': {
      'en': 'Skip',
      'es': 'Saltar',
      'vi': 'Nhảy',
      'zh_Hans': '跳过',
    },
    'cqv9xtk9': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // BusinessAuthenticationView
  {
    'tqpfe5kx': {
      'en': 'Register as a Business',
      'es': 'Regístrese como empresa',
      'vi': 'Đăng ký như một doanh nghiệp',
      'zh_Hans': '注册为企业',
    },
    'fk20a6y9': {
      'en': 'Business Name',
      'es': 'Nombre del Negocio',
      'vi': 'Tên doanh nghiệp',
      'zh_Hans': '公司名称',
    },
    '5ysed5gl': {
      'en': 'Enter the name of your business...',
      'es': 'Ingrese el nombre de su empresa...',
      'vi': 'Nhập tên doanh nghiệp của bạn...',
      'zh_Hans': '输入您的公司名称...',
    },
    '5yrevizq': {
      'en': 'ABN number',
      'es': 'número ABN',
      'vi': 'số ABN',
      'zh_Hans': 'ABN号码',
    },
    '25m3s80g': {
      'en': 'Enter your ABN number...',
      'es': 'Ingrese su número ABN...',
      'vi': 'Nhập số ABN của bạn...',
      'zh_Hans': '输入您的 ABN 号码...',
    },
    '7a54rxha': {
      'en': 'Select your business address',
      'es': 'Selecciona la dirección de tu empresa',
      'vi': 'Chọn địa chỉ doanh nghiệp của bạn',
      'zh_Hans': '选择您的公司地址',
    },
    'uefrvab0': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'vi': 'Địa chỉ email',
      'zh_Hans': '电子邮件地址',
    },
    'wm9q3acq': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
      'vi': 'Nhập email của bạn...',
      'zh_Hans': '输入你的电子邮箱...',
    },
    'opa62w8z': {
      'en': 'Phone number',
      'es': 'Número de teléfono',
      'vi': 'Số điện thoại',
      'zh_Hans': '电话号码',
    },
    'bklem6uf': {
      'en': 'Enter your phone number...',
      'es': 'Ingrese su número telefónico...',
      'vi': 'Nhập số điện thoại của bạn...',
      'zh_Hans': '输入你的电话号码...',
    },
    'lu958r1t': {
      'en': 'Password',
      'es': 'Contraseña',
      'vi': 'Mật khẩu',
      'zh_Hans': '密码',
    },
    'zrasmp68': {
      'en': 'Enter your password...',
      'es': 'Ingresa tu contraseña...',
      'vi': 'Nhập mật khẩu của bạn...',
      'zh_Hans': '输入您的密码...',
    },
    '1oc0e4d9': {
      'en': 'Confirm Password',
      'es': 'Confirmar contraseña',
      'vi': 'Xác nhận mật khẩu',
      'zh_Hans': '确认密码',
    },
    '8cjwmaes': {
      'en': 'Confirm password...',
      'es': 'Confirmar contraseña...',
      'vi': 'Xác nhận mật khẩu...',
      'zh_Hans': '确认密码...',
    },
    'd19g5eop': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
      'vi': 'Tạo tài khoản',
      'zh_Hans': '创建账户',
    },
    'pcnqatjx': {
      'en': 'Cancel ',
      'es': 'Cancelar',
      'vi': 'Hủy bỏ',
      'zh_Hans': '取消',
    },
    'gyt15jsn': {
      'en': 'Business name required',
      'es': 'Nombre comercial requerido',
      'vi': 'Tên doanh nghiệp bắt buộc',
      'zh_Hans': '需要商家名称',
    },
    'h7rwhcjr': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'm3yl35oa': {
      'en': 'ABN number required',
      'es': 'número ABN requerido',
      'vi': 'yêu cầu số ABN',
      'zh_Hans': '需要 ABN 号码',
    },
    '9hcg7xjh': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'gnfkvdgo': {
      'en': 'Email required',
      'es': 'Correo electronico (requerido',
      'vi': 'Email (bắt buộc',
      'zh_Hans': '需要电子邮件',
    },
    'j7ua3ujf': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '39o5o5c1': {
      'en': 'Phone number required',
      'es': 'Número de teléfono requerido',
      'vi': 'Số điện thoại bắt buộc',
      'zh_Hans': '需要电话号码',
    },
    'kv6l56pa': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '72ix6940': {
      'en': 'Enter a password for your account',
      'es': 'Introduzca una contraseña para su cuenta',
      'vi': 'Nhập mật khẩu cho tài khoản của bạn',
      'zh_Hans': '输入您帐户的密码',
    },
    'x3ms7lkm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '9mzmqkdm': {
      'en': 'Enter the same password',
      'es': 'Introduce la misma contraseña',
      'vi': 'Nhập cùng một mật khẩu',
      'zh_Hans': '输入相同的密码',
    },
    'gdsiw0lu': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '0ud2fkvy': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // CreateListingView
  {
    'x3tadsdx': {
      'en': 'Create listing',
      'es': 'Crear listado',
      'vi': 'Tạo danh sách',
      'zh_Hans': '创建列表',
    },
    '88y6uhpp': {
      'en': 'Title',
      'es': 'Título',
      'vi': 'Chức vụ',
      'zh_Hans': '标题',
    },
    'w39nc38m': {
      'en': 'Give your listing a title...',
      'es': 'Ponle un título a tu anuncio...',
      'vi': 'Đặt tiêu đề cho danh sách của bạn...',
      'zh_Hans': '给你的列表一个标题...',
    },
    '3680dspc': {
      'en': 'Description',
      'es': 'Descripción',
      'vi': 'Sự miêu tả',
      'zh_Hans': '描述',
    },
    '6wu52sau': {
      'en':
          'Enter a short description here of what customers can find in your food bag...',
      'es':
          'Ingrese una breve descripción aquí de lo que los clientes pueden encontrar en su bolsa de alimentos...',
      'vi':
          'Nhập một mô tả ngắn ở đây về những gì khách hàng có thể tìm thấy trong túi thực phẩm của bạn...',
      'zh_Hans': '在此处输入简短说明，说明客户可以在您的食品袋中找到什么……',
    },
    'k1h56k38': {
      'en': 'Select how many you want to sell',
      'es': 'Selecciona cuantos quieres vender',
      'vi': 'Chọn số lượng bạn muốn bán',
      'zh_Hans': '选择你想卖多少',
    },
    'zrnabx2k': {
      'en': 'Price',
      'es': 'Precio',
      'vi': 'Giá bán',
      'zh_Hans': '价格',
    },
    'nf657x6d': {
      'en': 'How much should each bag cost?',
      'es': '¿Cuánto debe costar cada bolsa?',
      'vi': 'Mỗi túi nên có giá bao nhiêu?',
      'zh_Hans': '每个袋子应该多少钱？',
    },
    'scwq5owp': {
      'en': 'Original value',
      'es': 'Valorado en',
      'vi': 'Giá trị tại',
      'zh_Hans': '估价于',
    },
    '0upntdra': {
      'en': 'What is the original price of the snack?',
      'es': '¿Cuál es el precio original de la merienda?',
      'vi': 'Giá gốc của món ăn vặt là bao nhiêu?',
      'zh_Hans': '零食原价是多少？',
    },
    'fdmi1b1a': {
      'en': 'Bakery',
      'es': 'Panadería',
      'vi': 'Cửa hàng bánh mì',
      'zh_Hans': '面包店',
    },
    '9rp76gct': {
      'en': 'Restaurant',
      'es': 'Restaurante',
      'vi': 'Quán ăn',
      'zh_Hans': '餐厅',
    },
    't84nrm9c': {
      'en': 'Cafe',
      'es': 'Cafetería',
      'vi': 'quán cà phê',
      'zh_Hans': '咖啡店',
    },
    'tchlznn7': {
      'en': 'Please select a category',
      'es': 'Porfavor seleccione una categoría',
      'vi': 'Hãy chọn một danh mục',
      'zh_Hans': '请选择类别',
    },
    'wcc0l12t': {
      'en': 'Upload photo',
      'es': 'Subir foto',
      'vi': 'Tải ảnh lên',
      'zh_Hans': '上传图片',
    },
    'xhk34itg': {
      'en':
          'Please upload a photo of the food you will be selling. If you don\'t upload a photo the following photo will be displayed for your listing:',
      'es':
          'Sube una foto de la comida que venderás. Si no carga una foto, se mostrará la siguiente foto para su anuncio:',
      'vi':
          'Vui lòng tải lên một bức ảnh về thực phẩm bạn sẽ bán. Nếu bạn không tải ảnh lên, ảnh sau sẽ được hiển thị cho danh sách của bạn:',
      'zh_Hans': '请上传一张您将要出售的食物的照片。如果您不上传照片，您的列表将显示以下照片：',
    },
    '0jdiw12t': {
      'en': 'Create Listing',
      'es': 'Crear listado',
      'vi': 'Tạo danh sách',
      'zh_Hans': '创建列表',
    },
    'j0jvg520': {
      'en': 'You need a title for your listing',
      'es': 'Necesitas un título para tu anuncio',
      'vi': 'Bạn cần một tiêu đề cho danh sách của bạn',
      'zh_Hans': '您的列表需要一个标题',
    },
    'wra9fd03': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'texe9tvm': {
      'en': 'Put a description of the snack',
      'es': 'Pon una descripción de la merienda',
      'vi': 'Đặt một mô tả của bữa ăn nhẹ',
      'zh_Hans': '写下小吃的描述',
    },
    'ata2uj1u': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'fggsoush': {
      'en': 'You need to put a price for the listing',
      'es': 'Necesitas poner un precio para el listado.',
      'vi': 'Bạn cần đặt một mức giá cho danh sách',
      'zh_Hans': '您需要为清单定价',
    },
    '6kagzbzw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    't9g8sxg6': {
      'en': 'Add',
      'es': 'Agregar',
      'vi': 'Thêm vào',
      'zh_Hans': '添加',
    },
  },
  // SuccessScreen
  {
    'zeujaker': {
      'en': 'Go Home',
      'es': 'Vete a casa',
      'vi': 'Về nhà',
      'zh_Hans': '回家',
    },
    '4067a6hv': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // PrivacyPolicyView
  {
    '7hy3hnjb': {
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
      'vi': 'Chính sách bảo mật',
      'zh_Hans': '隐私政策',
    },
    'hau1yceq': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // ErrorScreen
  {
    'mfpd59y1': {
      'en': 'Go back',
      'es': 'Regresa',
      'vi': 'Quay lại',
      'zh_Hans': '回去',
    },
    'enprvwl8': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // OrdersView
  {
    'mdsndvqo': {
      'en': 'Your Orders',
      'es': 'Tus ordenes',
      'vi': 'đơn đặt hàng của bạn',
      'zh_Hans': '你的命令',
    },
    '4jp44oss': {
      'en': 'Favourites',
      'es': 'Favoritos',
      'vi': 'yêu thích',
      'zh_Hans': '收藏夹',
    },
  },
  // BusinessOrdersView
  {
    'u8ro710c': {
      'en': 'Your Sold Orders',
      'es': 'Tus pedidos vendidos',
      'vi': 'Đơn đặt hàng đã bán của bạn',
      'zh_Hans': '您的已售订单',
    },
    'dudz0z5i': {
      'en': 'Favourites',
      'es': 'Favoritos',
      'vi': 'yêu thích',
      'zh_Hans': '收藏夹',
    },
  },
  // StripeRefreshPage
  {
    'pbx0xnth': {
      'en': 'Failed Stripe account setup',
      'es': 'Configuración de cuenta de Stripe fallida',
      'vi': 'Thiết lập tài khoản Stripe không thành công',
      'zh_Hans': 'Stripe 帐户设置失败',
    },
    'hxrotyys': {
      'en':
          'Something went wrong while setting up your business stripe account. This account is needed for you to receive payments from snacks you sold. Click the button below to setup your stripe account',
      'es':
          'Algo salió mal al configurar su cuenta de banda comercial. Esta cuenta es necesaria para recibir los pagos de los refrigerios que vendió. Haga clic en el botón de abajo para configurar su cuenta de Stripe',
      'vi':
          'Đã xảy ra lỗi khi thiết lập tài khoản sọc doanh nghiệp của bạn. Tài khoản này là cần thiết để bạn nhận thanh toán từ đồ ăn nhẹ bạn đã bán. Nhấp vào nút bên dưới để thiết lập tài khoản sọc của bạn',
      'zh_Hans':
          '设置您的 business stripe 帐户时出了点问题。您需要此帐户才能收到所售零食的付款。单击下面的按钮设置您的条纹帐户',
    },
    'n2wk1dme': {
      'en': 'Create Stripe Account',
      'es': 'Crear cuenta de banda',
      'vi': 'Tạo tài khoản Stripe',
      'zh_Hans': '创建条纹帐户',
    },
    'uoxvyrga': {
      'en': 'Setup Later',
      'es': 'Configurar mas tarde',
      'vi': 'Thiết lập sau',
      'zh_Hans': '稍后设置',
    },
    '1eja5e5m': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // CreateStripeAccountPage
  {
    'dcrue3v2': {
      'en': 'Connect your account to Stripe',
      'es': 'Conecta tu cuenta a Stripe',
      'vi': 'Kết nối tài khoản của bạn với Stripe',
      'zh_Hans': '将您的帐户连接到 Stripe',
    },
    'dui5cm1g': {
      'en':
          'We use Stripe to make sure you get paid on time and keep your personal and bank details secure.',
      'es':
          'Usamos Stripe para asegurarnos de que le paguen a tiempo y mantener seguros sus datos personales y bancarios.',
      'vi':
          'Chúng tôi sử dụng Stripe để đảm bảo bạn được thanh toán đúng hạn và giữ an toàn cho các chi tiết cá nhân và ngân hàng của bạn.',
      'zh_Hans': '我们使用 Stripe 来确保您按时收到付款并确保您的个人和银行详细信息安全。',
    },
    'zji66sys': {
      'en': 'Set Up Payments',
      'es': 'Configurar pagos',
      'vi': 'Thiết lập thanh toán',
      'zh_Hans': '设置付款',
    },
    'lmn5aw5j': {
      'en': 'Setup Later',
      'es': 'Configurar mas tarde',
      'vi': 'Thiết lập sau',
      'zh_Hans': '稍后设置',
    },
    'mvfg7b73': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // StripeInfoPage
  {
    'cwdf8j0e': {
      'en': 'You have not completed the set up a Stripe account yet',
      'es': 'Aún no ha completado la configuración de una cuenta de Stripe',
      'vi': 'Bạn chưa hoàn thành việc thiết lập tài khoản Stripe',
      'zh_Hans': '您还没有完成 Stripe 账户的设置',
    },
    'ls3vjmhi': {
      'en':
          'To get paid from your sold snacks you will have to complete your Stripe account. Click the button below to get started.',
      'es':
          'Para recibir el pago de sus refrigerios vendidos, deberá completar su cuenta de Stripe. Presiona el botón de abajo para iniciar.',
      'vi':
          'Để được trả tiền từ đồ ăn nhẹ đã bán, bạn sẽ phải hoàn thành tài khoản Stripe của mình. Nhấn vào nút bên dưới để bắt đầu.',
      'zh_Hans': '要从您出售的零食中获得报酬，您必须完成您的 Stripe 帐户。单击下面的按钮开始。',
    },
    'z7d1no7q': {
      'en': 'Setup',
      'es': 'Configuración',
      'vi': 'Cài đặt',
      'zh_Hans': '设置',
    },
    'qy40ichx': {
      'en': 'See your stripe account',
      'es': 'Ver tu cuenta de stripe',
      'vi': 'Xem tài khoản sọc của bạn',
      'zh_Hans': '查看您的条纹帐户',
    },
    '6fv3ouj6': {
      'en': 'Check your payout data via your Stripe dashboard',
      'es': 'Verifique sus datos de pago a través de su panel de Stripe',
      'vi':
          'Kiểm tra dữ liệu thanh toán của bạn thông qua bảng điều khiển Stripe của bạn',
      'zh_Hans': '通过您的 Stripe 控制面板检查您的支付数据',
    },
    'udayofk3': {
      'en': 'Dashboard',
      'es': 'Tablero',
      'vi': 'bảng điều khiển',
      'zh_Hans': '仪表板',
    },
    'xocgpzjp': {
      'en': 'Stripe Account',
      'es': 'Cuenta de banda',
      'vi': 'Tài khoản sọc',
      'zh_Hans': '条纹帐户',
    },
  },
  // AfterPurchaseInstructionView
  {
    'tn1b6d21': {
      'en': 'How to collect your snack',
      'es': 'Cómo recoger tu merienda',
      'vi': 'Làm thế nào để thu thập đồ ăn nhẹ của bạn',
      'zh_Hans': '如何收集你的零食',
    },
    'h7434cjr': {
      'en': 'Step 1: Go to the restuarant',
      'es': 'Paso 1: Ir al restaurante',
      'vi': 'Bước 1: Vào nhà hàng',
      'zh_Hans': '第一步：去餐厅',
    },
    'nvykbujh': {
      'en':
          'Go to the resturant from which you purchased your snack at the timeframe specified in the order.\nYou can check your orders under Account -> Your Orders.',
      'es':
          'Diríjase al restaurante donde compró su refrigerio en el horario especificado en el pedido.\nPuede consultar sus pedidos en Cuenta -> Sus pedidos.',
      'vi':
          'Đi đến nhà hàng mà bạn đã mua đồ ăn nhẹ của mình vào khung thời gian được chỉ định trong đơn đặt hàng.\nBạn có thể kiểm tra các đơn đặt hàng của mình trong Tài khoản -> Đơn đặt hàng của bạn.',
      'zh_Hans': '在订单中指定的时间段前往您购买小吃的餐厅。\n您可以在“帐户”->“您的订单”下查看您的订单。',
    },
    '4ya4nmy3': {
      'en': 'Step 2: Show your order confirmation to a restaurant employee',
      'es':
          'Paso 2: muestra la confirmación de tu pedido a un empleado del restaurante',
      'vi':
          'Bước 2: Xuất trình xác nhận đơn hàng của bạn cho nhân viên nhà hàng',
      'zh_Hans': '第 2 步：向餐厅员工出示您的订单确认信息',
    },
    'dwwlth29': {
      'en':
          'At the restaurant show your order confirmation to pick up your snack',
      'es':
          'En el restaurante muestra la confirmación de tu pedido para recoger tu snack',
      'vi':
          'Tại nhà hàng xuất trình xác nhận đặt hàng của bạn để lấy đồ ăn nhẹ của bạn',
      'zh_Hans': '在餐厅出示您的订单确认以领取您的小吃',
    },
    'w1kmgl4w': {
      'en': 'Step 3: Enjoy your snack!',
      'es': 'Paso 3: ¡Disfruta de tu merienda!',
      'vi': 'Bước 3: Thưởng thức bữa ăn nhẹ của bạn!',
      'zh_Hans': '第 3 步：享用您的零食！',
    },
    'lhd8hn0t': {
      'en':
          'You just helped reduce food waste and supported local restaurants!\nEnjoy your well deserved snack! ',
      'es':
          '¡Acabas de ayudar a reducir el desperdicio de alimentos y apoyaste a los restaurantes locales!\n¡Disfruta de tu merecido snack!',
      'vi':
          'Bạn vừa giúp giảm lãng phí thực phẩm và hỗ trợ các nhà hàng địa phương!\nThưởng thức bữa ăn nhẹ xứng đáng của bạn!',
      'zh_Hans': '您刚刚帮助减少了食物浪费并支持了当地餐馆！\n享受你当之无愧的小吃！',
    },
    'ypk9rtp1': {
      'en': 'Got it!',
      'es': '¡Entendido!',
      'vi': 'Hiểu rồi!',
      'zh_Hans': '知道了！',
    },
    'woagmtrp': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // CreateAListingInstructionView
  {
    'fpgny7gj': {
      'en': 'Got it!',
      'es': '¡Entendido!',
      'vi': 'Hiểu rồi!',
      'zh_Hans': '知道了！',
    },
    '5pflvnv1': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
  },
  // UpdateListingView
  {
    '2pok23c0': {
      'en': 'Update your listing',
      'es': 'Actualiza tu listado',
      'vi': 'Cập nhật danh sách của bạn',
      'zh_Hans': '更新您的清单',
    },
    'nnwhz5ph': {
      'en': 'Title',
      'es': 'Título',
      'vi': 'Chức vụ',
      'zh_Hans': '标题',
    },
    'kp5aneab': {
      'en': 'Give your listing a title...',
      'es': 'Ponle un título a tu anuncio...',
      'vi': 'Đặt tiêu đề cho danh sách của bạn...',
      'zh_Hans': '给你的列表一个标题...',
    },
    '2lmeqq57': {
      'en': 'Description',
      'es': 'Descripción',
      'vi': 'Sự miêu tả',
      'zh_Hans': '描述',
    },
    '8hvmemkv': {
      'en':
          'Enter a short description here of what customers can find in your food bag...',
      'es':
          'Ingrese una breve descripción aquí de lo que los clientes pueden encontrar en su bolsa de alimentos...',
      'vi':
          'Nhập một mô tả ngắn ở đây về những gì khách hàng có thể tìm thấy trong túi thực phẩm của bạn...',
      'zh_Hans': '在此处输入简短说明，说明客户可以在您的食品袋中找到什么……',
    },
    'wxehg9em': {
      'en': 'Select how many you want to sell',
      'es': 'Selecciona cuantos quieres vender',
      'vi': 'Chọn số lượng bạn muốn bán',
      'zh_Hans': '选择你想卖多少',
    },
    '249w1v6t': {
      'en': 'Price',
      'es': 'Precio',
      'vi': 'Giá bán',
      'zh_Hans': '价格',
    },
    'hzq4v5po': {
      'en': 'How much should each bag cost?',
      'es': '¿Cuánto debe costar cada bolsa?',
      'vi': 'Mỗi túi nên có giá bao nhiêu?',
      'zh_Hans': '每个袋子应该多少钱？',
    },
    'vumq313y': {
      'en': 'Valued at',
      'es': 'Valorado en',
      'vi': 'Giá trị tại',
      'zh_Hans': '估价于',
    },
    '2l0q22s7': {
      'en': 'What is the original price of the snack?',
      'es': '¿Cuál es el precio original de la merienda?',
      'vi': 'Giá gốc của món ăn vặt là bao nhiêu?',
      'zh_Hans': '零食原价是多少？',
    },
    'oh6umut7': {
      'en': 'Bakery',
      'es': 'Panadería',
      'vi': 'Cửa hàng bánh mì',
      'zh_Hans': '面包店',
    },
    '3epwno5f': {
      'en': 'Restaurant',
      'es': 'Restaurante',
      'vi': 'Quán ăn',
      'zh_Hans': '餐厅',
    },
    'x290hgsa': {
      'en': 'Cafe',
      'es': 'Cafetería',
      'vi': 'quán cà phê',
      'zh_Hans': '咖啡店',
    },
    'br9tir02': {
      'en': 'Please select a category',
      'es': 'Porfavor seleccione una categoría',
      'vi': 'Hãy chọn một danh mục',
      'zh_Hans': '请选择类别',
    },
    'mnvxafi4': {
      'en': 'Upload photo',
      'es': 'Subir foto',
      'vi': 'Tải ảnh lên',
      'zh_Hans': '上传图片',
    },
    '8etd8pjo': {
      'en':
          'Please upload a photo of the food you will be selling. If you don\'t upload a photo the following photo will be displayed for your listing:',
      'es':
          'Sube una foto de la comida que venderás. Si no carga una foto, se mostrará la siguiente foto para su listado:',
      'vi':
          'Vui lòng tải lên một bức ảnh về thực phẩm bạn sẽ bán. Nếu bạn không tải ảnh lên, ảnh sau sẽ được hiển thị cho danh sách của bạn:',
      'zh_Hans': '请上传一张您将要出售的食物的照片。如果您不上传照片，您的列表将显示以下照片：',
    },
    '1dyx1tmo': {
      'en': 'Update Listing',
      'es': 'Actualizar listado',
      'vi': 'Cập nhật danh sách',
      'zh_Hans': '更新清单',
    },
    'p7k1ebby': {
      'en': 'Listing updated!',
      'es': 'Listado actualizado!',
      'vi': 'Danh sách được cập nhật!',
      'zh_Hans': '清单已更新！',
    },
    '7bqm8mo1': {
      'en':
          'You just started regaining revenue! You can see your sold listings in Account -> Your Sold Orders',
      'es':
          '¡Acabas de empezar a recuperar ingresos! Puede ver sus anuncios vendidos en Cuenta -> Sus pedidos vendidos',
      'vi':
          'Bạn vừa mới bắt đầu lấy lại doanh thu! Bạn có thể xem danh sách đã bán của mình trong Tài khoản -> Đơn hàng đã bán của bạn',
      'zh_Hans': '您刚刚开始恢复收入！您可以在帐户 -> 您的已售订单中查看已售出的商品',
    },
    'hh4uuvd8': {
      'en': 'You need a title for your listing',
      'es': 'Necesitas un título para tu anuncio',
      'vi': 'Bạn cần một tiêu đề cho danh sách của bạn',
      'zh_Hans': '您的列表需要一个标题',
    },
    '4d0fbgei': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'h57qbs2m': {
      'en': 'Put a description of the snack',
      'es': 'Pon una descripción de la merienda',
      'vi': 'Đặt một mô tả của bữa ăn nhẹ',
      'zh_Hans': '写下小吃的描述',
    },
    'vu9o71in': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    '349fnbqt': {
      'en': 'You need to put a price for the listing',
      'es': 'Necesitas poner un precio para el listado.',
      'vi': 'Bạn cần đặt một mức giá cho danh sách',
      'zh_Hans': '您需要为清单定价',
    },
    'd6jh5d2n': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'v2fll4pd': {
      'en': 'Add',
      'es': 'Agregar',
      'vi': 'Thêm vào',
      'zh_Hans': '添加',
    },
  },
  // ReCreateListingView
  {
    'gioisvj3': {
      'en': 'Create listing',
      'es': 'Crear listado',
      'vi': 'Tạo danh sách',
      'zh_Hans': '创建列表',
    },
    'p7umeuhs': {
      'en': 'Title',
      'es': 'Título',
      'vi': 'Chức vụ',
      'zh_Hans': '标题',
    },
    'kvjujeyq': {
      'en': 'Give your listing a title...',
      'es': 'Ponle un título a tu anuncio...',
      'vi': 'Đặt tiêu đề cho danh sách của bạn...',
      'zh_Hans': '给你的列表一个标题...',
    },
    'jhj7d940': {
      'en': 'Description',
      'es': 'Descripción',
      'vi': 'Sự miêu tả',
      'zh_Hans': '描述',
    },
    '4u5xo6n1': {
      'en':
          'Enter a short description here of what customers can find in your food bag...',
      'es':
          'Ingrese una breve descripción aquí de lo que los clientes pueden encontrar en su bolsa de alimentos...',
      'vi':
          'Nhập một mô tả ngắn ở đây về những gì khách hàng có thể tìm thấy trong túi thực phẩm của bạn...',
      'zh_Hans': '在此处输入简短说明，说明客户可以在您的食品袋中找到什么……',
    },
    'x8ims07d': {
      'en': 'Select how many you want to sell',
      'es': 'Selecciona cuantos quieres vender',
      'vi': 'Chọn số lượng bạn muốn bán',
      'zh_Hans': '选择你想卖多少',
    },
    '2f1wgm0b': {
      'en': 'Price',
      'es': 'Precio',
      'vi': 'Giá bán',
      'zh_Hans': '价格',
    },
    '1kof77rn': {
      'en': 'How much should each bag cost?',
      'es': '¿Cuánto debe costar cada bolsa?',
      'vi': 'Mỗi túi nên có giá bao nhiêu?',
      'zh_Hans': '每个袋子应该多少钱？',
    },
    's5p9dzek': {
      'en': 'Valued at',
      'es': 'Valorado en',
      'vi': 'Giá trị tại',
      'zh_Hans': '估价于',
    },
    '17a2z6q0': {
      'en': 'What is the original price of the snack?',
      'es': '¿Cuál es el precio original de la merienda?',
      'vi': 'Giá gốc của món ăn vặt là bao nhiêu?',
      'zh_Hans': '零食原价是多少？',
    },
    'yv49fx0l': {
      'en': 'Bakery',
      'es': 'Panadería',
      'vi': 'Cửa hàng bánh mì',
      'zh_Hans': '面包店',
    },
    'wvqw9vs2': {
      'en': 'Restaurant',
      'es': 'Restaurante',
      'vi': 'Quán ăn',
      'zh_Hans': '餐厅',
    },
    'inj1wpw1': {
      'en': 'Cafe',
      'es': 'Cafetería',
      'vi': 'quán cà phê',
      'zh_Hans': '咖啡店',
    },
    'eztfpkwg': {
      'en': 'Please select a category',
      'es': 'Porfavor seleccione una categoría',
      'vi': 'Hãy chọn một danh mục',
      'zh_Hans': '请选择类别',
    },
    'xjd24l3h': {
      'en': 'Upload photo',
      'es': 'Subir foto',
      'vi': 'Tải ảnh lên',
      'zh_Hans': '上传图片',
    },
    '08rnu6eq': {
      'en':
          'Please upload a photo of the food you will be selling. If you don\'t upload a photo the following photo will be displayed for your listing:',
      'es':
          'Sube una foto de la comida que venderás. Si no carga una foto, se mostrará la siguiente foto para su listado:',
      'vi':
          'Vui lòng tải lên một bức ảnh về thực phẩm bạn sẽ bán. Nếu bạn không tải ảnh lên, ảnh sau sẽ được hiển thị cho danh sách của bạn:',
      'zh_Hans': '请上传一张您将要出售的食物的照片。如果您不上传照片，您的列表将显示以下照片：',
    },
    'f3wq4ybv': {
      'en': 'Create Listing',
      'es': 'Crear listado',
      'vi': 'Tạo danh sách',
      'zh_Hans': '创建列表',
    },
    '23u53cg3': {
      'en': 'You need a title for your listing',
      'es': 'Necesitas un título para tu anuncio',
      'vi': 'Bạn cần một tiêu đề cho danh sách của bạn',
      'zh_Hans': '您的列表需要一个标题',
    },
    '6cfoadlo': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'j451nq3n': {
      'en': 'Put a description of the snack',
      'es': 'Pon una descripción de la merienda',
      'vi': 'Đặt một mô tả của bữa ăn nhẹ',
      'zh_Hans': '写下小吃的描述',
    },
    'otrth7sw': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'fkw8clq5': {
      'en': 'You need to put a price for the listing',
      'es': 'Necesitas poner un precio para el listado.',
      'vi': 'Bạn cần đặt một mức giá cho danh sách',
      'zh_Hans': '您需要为清单定价',
    },
    'pzcl29c2': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable',
      'vi': 'Vui lòng chọn một tùy chọn từ danh sách thả xuống',
      'zh_Hans': '请从下拉列表中选择一个选项',
    },
    'd0b0qsgv': {
      'en': 'Add',
      'es': 'Agregar',
      'vi': 'Thêm vào',
      'zh_Hans': '添加',
    },
  },
  // SearchAndFilter
  {
    'ijlitlsa': {
      'en': 'Bakeries',
      'es': 'panaderías',
      'vi': 'tiệm bánh',
      'zh_Hans': '面包店',
    },
    'l44n4iiv': {
      'en': 'Restaurants',
      'es': 'Restaurantes',
      'vi': 'nhà hàng',
      'zh_Hans': '餐馆',
    },
    '3ccotmf5': {
      'en': 'Cafe',
      'es': 'Cafetería',
      'vi': 'quán cà phê',
      'zh_Hans': '咖啡店',
    },
    '61jtqecw': {
      'en': 'What would you like to save?',
      'es': '¿Qué te gustaría guardar?',
      'vi': 'Bạn muốn lưu gì?',
      'zh_Hans': '你想保存什么？',
    },
  },
  // OpenMaps
  {
    'dmrmmxlx': {
      'en': 'Select app for directions',
      'es': 'Seleccione la aplicación para obtener instrucciones',
      'vi': 'Chọn ứng dụng để được chỉ đường',
      'zh_Hans': '选择应用程序获取路线',
    },
    'l52qb2x2': {
      'en': 'Apple Maps',
      'es': 'mapas de manzana',
      'vi': 'Bản đồ Apple',
      'zh_Hans': '苹果地图',
    },
    'f03ud69j': {
      'en': 'Google Maps',
      'es': 'mapas de Google',
      'vi': 'bản đồ Google',
      'zh_Hans': '谷歌地图',
    },
    'c540cv0p': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'vi': 'Hủy bỏ',
      'zh_Hans': '取消',
    },
  },
  // PayBottomSheet
  {
    'aqxfl21a': {
      'en': 'Select Quantity',
      'es': 'Selecciona la cantidad',
      'vi': 'Chọn số lượng',
      'zh_Hans': '选择数量',
    },
    'x7znbwup': {
      'en': 'Total',
      'es': 'Total',
      'vi': 'Tổng cộng',
      'zh_Hans': '全部的',
    },
    '3zxgi802': {
      'en': 'Pay with Stripe',
      'es': 'Paga con Stripe',
      'vi': 'Thanh toán bằng Sọc',
      'zh_Hans': '用条纹支付',
    },
  },
  // EmailVerification
  {
    't04ccifr': {
      'en': 'Please verify your email',
      'es': 'Por favor verifica tu correo electrónico',
      'vi': 'Vui lòng xác minh email của bạn',
      'zh_Hans': '请验证您的电子邮件',
    },
    'if77fzlf': {
      'en':
          'An email has been sent to your inbox with a link to verify your account. Please follow the steps in this email to verify your account.',
      'es':
          'Se ha enviado un correo electrónico a su bandeja de entrada con un enlace para verificar su cuenta. Siga los pasos de este correo electrónico para verificar su cuenta.',
      'vi':
          'Một email đã được gửi đến hộp thư đến của bạn với một liên kết để xác minh tài khoản của bạn. Vui lòng làm theo các bước trong email này để xác minh tài khoản của bạn.',
      'zh_Hans': '一封电子邮件已发送到您的收件箱，其中包含用于验证您的帐户的链接。请按照此电子邮件中的步骤验证您的帐户。',
    },
  },
  // NavBarFloting
  {
    'vjibmk3j': {
      'en': 'Home',
      'es': 'Casa',
      'vi': 'Nhà',
      'zh_Hans': '家',
    },
    'n11xsokt': {
      'en': 'Map',
      'es': 'Mapa',
      'vi': 'Bản đồ',
      'zh_Hans': '地图',
    },
    '6rujgma5': {
      'en': 'Add',
      'es': 'Agregar',
      'vi': 'Thêm vào',
      'zh_Hans': '添加',
    },
    'oc7wbgi4': {
      'en': 'Favourites',
      'es': 'Favoritos',
      'vi': 'yêu thích',
      'zh_Hans': '收藏夹',
    },
    '7eee64dn': {
      'en': 'Account',
      'es': 'Cuenta',
      'vi': 'Tài khoản',
      'zh_Hans': '帐户',
    },
  },
  // NoDataFound
  {
    'xhpjhiqh': {
      'en': 'Click here to learn how to create a listing',
      'es': 'Haga clic aquí para aprender cómo crear una lista',
      'vi': 'Nhấn vào đây để tìm hiểu làm thế nào để tạo ra một danh sách',
      'zh_Hans': '单击此处了解如何创建列表',
    },
    '70z829mf': {
      'en':
          'Don\'t have an account yet? Click here to sign up and start saving snacks!',
      'es':
          '¿Aún no tienes una cuenta? ¡Haz clic aquí para registrarte y comenzar a ahorrar bocadillos!',
      'vi':
          'Vẫn chưa có tài khoản? Nhấn vào đây để đăng ký và bắt đầu tiết kiệm đồ ăn nhẹ!',
      'zh_Hans': '还没有帐户？单击此处注册并开始节省零食！',
    },
    'u1rmukv2': {
      'en': 'Sign up here',
      'es': 'Registrate aquí',
      'vi': 'Đăng ký tại đây',
      'zh_Hans': '在此注册',
    },
    'zo266iy7': {
      'en':
          'A you a food business owner? Join SnackSavers and  regain revenue while saving the planet',
      'es':
          '¿Eres dueño de un negocio de comida? Únase a SnackSavers y recupere ingresos mientras salva el planeta',
      'vi':
          'Bạn là chủ doanh nghiệp kinh doanh thực phẩm? Tham gia SnackSavers và lấy lại doanh thu trong khi cứu hành tinh',
      'zh_Hans': '您是食品企业主吗？加入 SnackSavers 并在拯救地球的同时重获收入',
    },
    'vhlia1t3': {
      'en': 'Sign up here',
      'es': 'Registrate aquí',
      'vi': 'Đăng ký tại đây',
      'zh_Hans': '在此注册',
    },
  },
  // DeleteListingVerification
  {
    'oef7u2g6': {
      'en':
          'Are you sure you want to delete this listing?\nWARNING: This action cannot be undone',
      'es':
          '¿Está seguro de que desea eliminar este anuncio?\nADVERTENCIA: Esta acción no se puede deshacer',
      'vi':
          'Bạn có chắc chắn muốn xóa danh sách này?\nCẢNH BÁO: Không thể hoàn tác hành động này',
      'zh_Hans': '您确定要删除此列表吗？\n警告：此操作无法撤消',
    },
    '6qz22frb': {
      'en': 'Yes delete the listing',
      'es': 'Sí eliminar el listado',
      'vi': 'Có xóa danh sách',
      'zh_Hans': '是 删除列表',
    },
    'uawczgea': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'vi': 'Hủy bỏ',
      'zh_Hans': '取消',
    },
  },
  // DeleteAccountVerification
  {
    'a1gz6hg2': {
      'en':
          'Are you sure you want to delete your account?\nWARNING: This action cannot be undone and will take immediate effect',
      'es':
          '¿Está seguro de que desea eliminar su cuenta?\nADVERTENCIA: Esta acción no se puede deshacer y tendrá efecto inmediato',
      'vi':
          'Bạn có chắc rằng bạn muốn xóa tài khoản của bạn?\nCẢNH BÁO: Không thể hoàn tác hành động này và sẽ có hiệu lực ngay lập tức',
      'zh_Hans': '您确定要删除您的帐户吗？\n警告：此操作无法撤消并将立即生效',
    },
    'lguylfna': {
      'en': 'Yes delete my account',
      'es': 'si borrar mi cuenta',
      'vi': 'Có xóa tài khoản của tôi',
      'zh_Hans': '是的，删除我的帐户',
    },
    'jxmujrc7': {
      'en': 'Cancel',
      'es': 'Cancelar',
      'vi': 'Hủy bỏ',
      'zh_Hans': '取消',
    },
  },
  // SimilarListingsExist
  {
    'mkt519h0': {
      'en': 'You already have previous listings in the database',
      'es': 'Ya tienes listados anteriores en la base de datos',
      'vi': 'Bạn đã có danh sách trước đó trong cơ sở dữ liệu',
      'zh_Hans': '您的数据库中已有以前的列表',
    },
    'ajmhgvz0': {
      'en':
          'If you would like to reuse the data from any of them click on the desired listing below',
      'es':
          'Si desea reutilizar los datos de cualquiera de ellos, haga clic en la lista deseada a continuación',
      'vi':
          'Nếu bạn muốn sử dụng lại dữ liệu từ bất kỳ danh sách nào, hãy nhấp vào danh sách mong muốn bên dưới',
      'zh_Hans': '如果您想重复使用其中任何一个的数据，请单击下面所需的列表',
    },
  },
  // Miscellaneous
  {
    'gie1hrjc': {
      'en':
          'SnackSavers needs your location to display snacks to be saved near you.',
      'es':
          'SnackSavers necesita su ubicación para mostrar bocadillos que se guardarán cerca de usted.',
      'vi':
          'SnackSavers cần vị trí của bạn để hiển thị đồ ăn nhẹ được lưu gần bạn.',
      'zh_Hans': 'SnackSavers 需要您的位置来显示要保存在您附近的零食。',
    },
    'g72py39x': {
      'en':
          'SnackSavers needs access to your camera so you can take pictures of your beautiful snacks.',
      'es':
          'SnackSavers necesita acceso a su cámara para que pueda tomar fotografías de sus hermosos bocadillos.',
      'vi':
          'SnackSavers cần quyền truy cập vào máy ảnh của bạn để bạn có thể chụp ảnh những món ăn nhẹ tuyệt đẹp của mình.',
      'zh_Hans': 'SnackSavers 需要使用您的相机，以便您可以拍摄精美的零食照片。',
    },
    'q2uumb69': {
      'en':
          'In order to upload images of the delicious snacks you want to sell, SnackSavers needs access to the photo library on your device. These images can be attached to your listings. The images can also be used for the profile picture of your account.',
      'es':
          'Para cargar imágenes de los deliciosos bocadillos que desea vender, SnackSavers necesita acceso a la biblioteca de fotos en su dispositivo. Estas imágenes se pueden adjuntar a sus listados. Las imágenes también se pueden utilizar para la imagen de perfil de su cuenta.',
      'vi':
          'Để tải lên hình ảnh về những món ăn vặt ngon mà bạn muốn bán, SnackSavers cần quyền truy cập vào thư viện ảnh trên thiết bị của bạn. Những hình ảnh này có thể được đính kèm vào danh sách của bạn. Các hình ảnh cũng có thể được sử dụng cho ảnh hồ sơ của tài khoản của bạn.',
      'zh_Hans':
          '为了上传您想出售的美味小吃的图片，SnackSavers 需要访问您设备上的照片库。这些图像可以附加到您的列表中。这些图像也可用于您帐户的个人资料图片。',
    },
    'tc856scn': {
      'en':
          'SnackSavers needs your location to display snacks to be saved near you.',
      'es':
          'SnackSavers necesita su ubicación para mostrar bocadillos que se guardarán cerca de usted.',
      'vi':
          'SnackSavers cần vị trí của bạn để hiển thị đồ ăn nhẹ được lưu gần bạn.',
      'zh_Hans': 'SnackSavers 需要您的位置来显示要保存在您附近的零食。',
    },
    'ggmfyjw1': {
      'en':
          'Enable permissions to get informed as soon as snacks are made available.',
      'es':
          'Habilite los permisos para recibir información tan pronto como los refrigerios estén disponibles.',
      'vi': 'Cho phép quyền nhận thông báo ngay khi đồ ăn nhẹ được cung cấp.',
      'zh_Hans': '启用权限，以便在零食可用时立即获得通知。',
    },
    '3k74nfid': {
      'en': 'Error: [error]',
      'es': 'Error: [error]',
      'vi': 'Lỗi: [lỗi]',
      'zh_Hans': '错误：[错误]',
    },
    'x54hee3k': {
      'en': 'Password reset email sent!',
      'es': 'Correo electrónico de restablecimiento de contraseña enviado!',
      'vi': 'Đã gửi email đặt lại mật khẩu!',
      'zh_Hans': '密码重置邮件已发送！',
    },
    'qzny3091': {
      'en': 'Email required!',
      'es': '¡Correo electronico (requerido!',
      'vi': 'Email (bắt buộc!',
      'zh_Hans': '需要邮箱！',
    },
    'zmwe5h2a': {
      'en': 'Phone number required and has to start with +.',
      'es': 'El número de teléfono es obligatorio y debe comenzar con +.',
      'vi': 'Số điện thoại bắt buộc và phải bắt đầu bằng +.',
      'zh_Hans': '电话号码必须以 + 开头。',
    },
    'ev7a7usa': {
      'en': 'Passwords don\'t match',
      'es': 'Las contraseñas no coinciden',
      'vi': 'Mật khẩu không khớp',
      'zh_Hans': '密码不匹配',
    },
    'erv5xkwb': {
      'en': 'Enter SMS verification code',
      'es': 'Ingrese el código de verificación de SMS',
      'vi': 'Nhập mã xác minh SMS',
      'zh_Hans': '输入短信验证码',
    },
    'c2i0vzzn': {
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account',
      'es':
          'Demasiado tiempo desde el último inicio de sesión. Vuelva a iniciar sesión antes de eliminar su cuenta',
      'vi':
          'Quá lâu kể từ lần đăng nhập gần đây nhất. Đăng nhập lại trước khi xóa tài khoản của bạn',
      'zh_Hans': '自上次登录以来太久了。请在删除您的帐户之前重新登录',
    },
    'stw8aloz': {
      'en': 'Invalid file format',
      'es': 'Formato de archivo inválido',
      'vi': 'Định dạng tập tin không hợp lệ',
      'zh_Hans': '文件格式无效',
    },
    'f8ivf1wi': {
      'en': 'Uploading file...',
      'es': 'Cargando archivo...',
      'vi': 'Đang tải tệp lên...',
      'zh_Hans': '上传文件...',
    },
    'owmbr330': {
      'en': 'Success!',
      'es': '¡Éxito!',
      'vi': 'Sự thành công!',
      'zh_Hans': '成功！',
    },
    'kr0wi6mc': {
      'en': 'Failed to upload media',
      'es': 'Error al cargar medios',
      'vi': 'Không thể tải phương tiện lên',
      'zh_Hans': '无法上传媒体',
    },
    'wvt4l0hh': {
      'en': '',
      'es': '',
      'vi': '',
      'zh_Hans': '',
    },
    'qaa0iaai': {
      'en': 'Choose Source',
      'es': 'Elige la fuente',
      'vi': 'Chọn nguồn',
      'zh_Hans': '选择来源',
    },
    '68hr6wf9': {
      'en': 'Gallery',
      'es': 'Galería',
      'vi': 'Bộ sưu tập',
      'zh_Hans': '画廊',
    },
    'jvefh8oa': {
      'en': 'Gallery (Photo)',
      'es': 'Galería (Foto)',
      'vi': 'Phòng trưng bày (Ảnh)',
      'zh_Hans': '画廊（照片）',
    },
    'y6rw9ig2': {
      'en': 'Gallery (Video)',
      'es': 'Galería (Vídeo)',
      'vi': 'Thư viện (Video)',
      'zh_Hans': '图库（视频）',
    },
    'dw6z85xc': {
      'en': 'Camera',
      'es': 'Cámara',
      'vi': 'Máy ảnh',
      'zh_Hans': '相机',
    },
    's122iaxj': {
      'en': '',
      'es': '',
      'vi': '',
      'zh_Hans': '',
    },
    'p5a2gxid': {
      'en': '',
      'es': '',
      'vi': '',
      'zh_Hans': '',
    },
    'zxzvm4wg': {
      'en': 'Error: [error]',
      'es': 'Error: [error]',
      'vi': 'Lỗi: [lỗi]',
      'zh_Hans': '错误：[错误]',
    },
  },
].reduce((a, b) => a..addAll(b));
