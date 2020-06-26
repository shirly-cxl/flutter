library total;

export 'package:total/common/check.dart';
export 'package:total/data/data.dart';
export 'package:total/http/base_request.dart';
export 'package:total/http/http.dart';
export 'package:total/widget_common/data/loading_view.dart';
export 'package:total/widget_common/data/no_data_view.dart';
export 'package:total/common/win_media.dart';
export 'package:total/common/ui.dart';
export 'package:total/common/global_variable.dart';
export 'package:total/widget_common/bar/navigation_bar.dart';
export 'package:total/widget_common/view/show_toast.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:total/widget_common/button/small_button.dart';
export 'package:total/widget_common/data/data_view.dart';
export 'package:total/widget_common/dialog/confirm_alert.dart';
export 'package:total/widget_common/tile/label_tile.dart';
export 'package:total/widget_common/view/field_view.dart';
export 'package:total/widget_common/view/main_input.dart';
export 'package:total/widget_common/theme_colors.dart';
export 'package:total/http/base_view_model.dart';
export 'package:total/widget_common/dialog/theme_dialog.dart';
export 'package:total/common/inputFor.dart';

export 'package:nav_router/nav_router.dart';

/// 回调
typedef Callback(data);
typedef VoidCallbackConfirm = void Function(bool isOk);

/// 服务器地址
const serviceUrl = 'http://112.74.200.88:21808';
