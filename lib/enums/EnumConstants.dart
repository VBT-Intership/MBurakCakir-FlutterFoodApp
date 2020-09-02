enum Constants {
  imageHeight,
  imageWidth,
}

extension ConstantsExtension on Constants {
  double get size {
    switch (this) {
      case Constants.imageHeight:
        return 125;
      case Constants.imageWidth:
        return 125;
      default:
        return null;
    }
  }
}
