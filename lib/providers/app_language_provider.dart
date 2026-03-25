import 'package:flutter/widgets.dart';

class AppLanguageProvider extends ChangeNotifier{
  ///data
  String appLanguage='en';
  ///function
void ChangeLanguage(String newLanguage){
 if(appLanguage==newLanguage){
   return;

 }
 appLanguage=newLanguage;
 notifyListeners();
}

}