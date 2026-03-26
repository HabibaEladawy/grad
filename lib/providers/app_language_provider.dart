import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier{
  ///data
  String appLanguage='ar';
  ///function
void ChangeLanguage(String newLanguage){
 if(appLanguage==newLanguage){
   return;

 }
 appLanguage=newLanguage;
 notifyListeners();
}

}