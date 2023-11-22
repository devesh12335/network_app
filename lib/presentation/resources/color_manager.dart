import 'package:flutter/material.dart';

class ColorManager{
  static Color primary = HexColor.fromHex("#7053EB");
  static Color darkGrey = HexColor.fromHex("#393D3f");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#7053EB");
  static Color background = HexColor.fromHex("#FBFBFE");
  static Color cardBackground = HexColor.fromHex("#4C6D89");
  static Color subtitle = HexColor.fromHex("#7B7B7B");
  static Color splashBack = HexColor.fromHex("#0172FB");
  static Color tabBackground = HexColor.fromHex("#F5F5F5");
  static Color orText = HexColor.fromHex("#707070");
  static Color skipBack = HexColor.fromHex("#9A9A9A");
  static Color template1 = HexColor.fromHex("#896565");
  static Color loginScrBtn = HexColor.fromHex("#616161");
  static Color splashBackColor = HexColor.fromHex("#BBADF6");
  static Color promo2buttonColor = HexColor.fromHex("#4D4472");
  static Color promo1BgColor = HexColor.fromHex("#4D4472").withOpacity(1);
  static Color selectedPackageBorderColor = HexColor.fromHex("#E8E2FF").withOpacity(1);


  //New Colors

  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#797979");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color lightBlue = HexColor.fromHex("#b7d7f7");
  static Color error = HexColor.fromHex("#e61f34"); //red color
  static Color statusbarColor = HexColor.fromHex("#001C3F"); //red color
  static Color btnBackgroundColor = HexColor.fromHex("#0172FB"); //red color
  static Color sliderActiveColor = HexColor.fromHex("#7FB8FC"); //red color
  static Color sliderInactiveColor = HexColor.fromHex("#001C3F"); //red color
  static Color sliderBoxColor = HexColor.fromHex("#697286"); //red color
  static Color statusBarColor = HexColor.fromHex("#001C3F"); //red color
  static Color proButtonColor = HexColor.fromHex("#FED680"); //red color
  static Color inputBorderColor = HexColor.fromHex("#336A74"); //red color
  static Color bottomDrawerColor = HexColor.fromHex("#586071"); //red color
  static Color sttingsAppbarColor = HexColor.fromHex("#0A263D"); //red color
  static Color nextBtnColor = HexColor.fromHex("#FEC856"); //red color

}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = "FF" +hexColorString; //Appending characters for opacity of 100% at start of HexCode
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}