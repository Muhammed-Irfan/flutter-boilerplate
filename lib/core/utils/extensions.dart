import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension BorderExtensions on double {
  BorderRadius get borderRadius => BorderRadius.circular(this);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  Border border({
    Color? color,
    BorderStyle? style,
  }) =>
      Border.all(
        color: color ?? Colors.white,
        width: this,
        style: style ?? BorderStyle.solid,
      );
}

extension HexColorExtensions on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension WidgetExtensions on Widget {
  Widget align({
    Alignment alignment = Alignment.center,
  }) =>
      Align(
        alignment: alignment,
        child: this,
      );

  SizedBox get expandedWidth => SizedBox(width: double.infinity, child: this);

  Padding padding({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          left: left ?? 0,
          top: top ?? 0,
          right: right ?? 0,
          bottom: bottom ?? 0,
        ),
        child: this,
      );

  Padding paddingAll(double padding) => Padding(
        padding: padding.toInsetsAll(),
        child: this,
      );

  Padding paddingSymmetric({double? vertical, double? horizontal}) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical ?? 0,
          horizontal: horizontal ?? 0,
        ),
        child: this,
      );
}

extension DoubleExtensions on double {
  EdgeInsets toInsetsAll() => EdgeInsets.all(this);

  Size get squareBox => Size(this, this);
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(E e, int i) f) {
    var i = 0;
    return map((e) => f(e, i++));
  }
}

extension DateTimeExtensions on DateTime? {
  bool isSameDay(DateTime other) {
    return this != null && this?.day == other.day && this?.month == other.month && this?.year == other.year;
  }

  bool get isToday => isSameDay(DateTime.now());

  bool get isTomorrow => isSameDay(DateTime.now().add(const Duration(days: 1)));
}

extension ImageExtensions on String {
  SizedBox toSvgAsset({
    Size? size,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) =>
      SizedBox(
        width: size?.width,
        height: size?.height,
        child: SvgPicture.asset(
          this,
          colorFilter: color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
          width: size?.width,
          height: size?.height,
          fit: fit,
        ),
      );

  Image toImageAsset({
    Size? size,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );

  CachedNetworkImage toCachedImage({
    BoxFit fit = BoxFit.contain,
    Size? size,
  }) =>
      CachedNetworkImage(
        imageUrl: this,
        // httpHeaders: {"Authorization": "Bearer ${getAuthToken()}"},
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
        errorWidget: (context, url, error) => const Center(
          child: Icon(
            Icons.error_outline,
            color: Colors.red,
          ),
        ),
        width: size?.width,
        height: size?.height,
        fit: fit,
      );

  CachedNetworkImageProvider toCachedImageProvider() => CachedNetworkImageProvider(
        this,
        // headers: {
        //   "Authorization":
        //       "Bearer ${getAuthToken()}"
        // },
      );
}
