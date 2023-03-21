import 'package:sizer/sizer.dart';

export 'package:sizer/sizer.dart';

extension ResponsiveCalculation on num {
  ///
  ///Returns the percent [Height] based on the design height reference
  ///
  double get dH => (this / 812) * 100.h;

  ///
  ///Returns the percent [Width] based on the design width reference
  ///
  double get dW => (this / 375) * 100.w;

  ///
  ///Returns the percent [Font Size] based on the design width reference
  ///
  double get fS => dW;
}
