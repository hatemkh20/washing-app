import 'package:flutter/material.dart';

/// Extension on String to provide convenient methods for asset images
extension StringImageExtension on String {
  /// Creates an Image widget from an asset path
  ///
  /// Usage: "assets/image.png".image
  Image get imageAssets => Image.asset(this);
  Image get imageNetwork => Image.asset(this);

  /// Creates an Image widget from an asset path with custom width
  ///
  /// Usage: "assets/image.png".imageWithWidth(100)
  Image imageWithWidth(double width) => Image.asset(
    this,
    width: width,
  );

  /// Creates an Image widget from an asset path with custom height
  ///
  /// Usage: "assets/image.png".imageWithHeight(100)
  Image imageWithHeight(double height) => Image.asset(
    this,
    height: height,
  );

  /// Creates an Image widget from an asset path with custom dimensions
  ///
  /// Usage: "assets/image.png".imageWithSize(100, 150)
  Image imageWithSize(double width, double height) => Image.asset(
    this,
    width: width,
    height: height,
  );

  /// Creates an Image widget from an asset path with custom fit
  ///
  /// Usage: "assets/image.png".imageWithFit(BoxFit.cover)
  Image imageWithFit(BoxFit fit) => Image.asset(
    this,
    fit: fit,
  );

  /// Creates an Image widget from an asset path with custom parameters
  ///
  /// Usage: "assets/image.png".imageWith(width: 100, height: 150, fit: BoxFit.cover)
  Image imageWith({
    double? width,
    double? height,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Color? color,
    BlendMode? colorBlendMode,
    bool gaplessPlayback = false,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    int? cacheWidth,
    int? cacheHeight,
    FilterQuality filterQuality = FilterQuality.low,
  }) =>
      Image.asset(
        this,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        color: color,
        colorBlendMode: colorBlendMode,
        gaplessPlayback: gaplessPlayback,
        semanticLabel: semanticLabel,
        excludeFromSemantics: excludeFromSemantics,
        scale: scale,
        cacheWidth: cacheWidth,
        cacheHeight: cacheHeight,
        filterQuality: filterQuality,
      );

  /// Creates a DecorationImage from an asset path
  ///
  /// Usage: "assets/image.png".decorationImage
  DecorationImage get decorationImage => DecorationImage(
    image: AssetImage(this),
  );

  /// Creates a DecorationImage from an asset path with custom fit
  ///
  /// Usage: "assets/image.png".decorationImageWithFit(BoxFit.cover)
  DecorationImage decorationImageWithFit(BoxFit fit) => DecorationImage(
    image: AssetImage(this),
    fit: fit,
  );

  /// Creates an AssetImage from the string path
  ///
  /// Usage: "assets/image.png".assetImage
  AssetImage get assetImage => AssetImage(this);
}