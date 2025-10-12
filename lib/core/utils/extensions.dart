import 'package:flutter/material.dart';


extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension CenterWidget on Widget {
  Widget get center => Center(
        child: this,
      );
}

extension Sized on num {
  Widget get ph => SizedBox(
        height: toDouble(),
      );
  Widget get pw => SizedBox(
        width: toDouble(),
      );
}

extension NavigationExtensions on BuildContext {
  void pushAndRemoveUntil(Widget widget) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) {
        return widget;
      }),
      (route) => false,
    );
  }

  void push(Widget widget) {
    Navigator.of(this).push(
      MaterialPageRoute(builder: (context) {
        return widget;
      }),
    );
  }

  void pop() {
    Navigator.of(this).pop();
  }
}

// extension CheckInternetStatus on BuildContext {
//   dynamic checkInternet(BuildContext context, VoidCallback type) {
//     if (Provider.of<InternetConnectionStatus>(context, listen: false) ==
//         InternetConnectionStatus.disconnected) {
//       return toastWarning(message: "قم بالتحقق من اتصالك بالإنترنت");
//     } else {
//       type();
//     }
//   }
// }
