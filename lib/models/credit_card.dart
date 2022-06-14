import 'package:apollo/shared/utils/image_utils.dart';

class CreditCard {
  String? id;
  String lastNumbers;
  CreditCardFlag flag;

  CreditCard({this.id, required this.lastNumbers, required this.flag});
  String getFlagName() {
    switch (flag) {
      case CreditCardFlag.AMEX:
        return ("American Express");
      case CreditCardFlag.VISA:
        return ("Visa");
      case CreditCardFlag.MASTER:
        return ("MasterCard");
      case CreditCardFlag.ELO:
        return ("ELO");
      case CreditCardFlag.HIPER:
        return ("HiperCard");
    }
  }

  ImageUtils getFlagImage() {
    return _getFlagImageByName(flag.toString().split('.').last.toLowerCase());
  }

  ImageUtils _getFlagImageByName(String name) {
    return ImageUtils(
        path: 'assets/images/flags/$name.png', size: 24, type: ImageType.Asset);
  }
}

enum CreditCardFlag { VISA, MASTER, ELO, AMEX, HIPER }
