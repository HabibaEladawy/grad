import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @dana.
  ///
  /// In en, this message translates to:
  /// **'Dana'**
  String get dana;

  /// No description provided for @myBabyHealth.
  ///
  /// In en, this message translates to:
  /// **'My Baby Health'**
  String get myBabyHealth;

  /// No description provided for @babyHealthRecord.
  ///
  /// In en, this message translates to:
  /// **'Baby Health Record'**
  String get babyHealthRecord;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @doctorConsult.
  ///
  /// In en, this message translates to:
  /// **'Doctor Consult'**
  String get doctorConsult;

  /// No description provided for @childDoctorOptions.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Child\'s Doctor'**
  String get childDoctorOptions;

  /// No description provided for @smartAssistant.
  ///
  /// In en, this message translates to:
  /// **'Smart Assistant'**
  String get smartAssistant;

  /// No description provided for @smartSymptomCheck.
  ///
  /// In en, this message translates to:
  /// **'Step-by-step Symptom Check'**
  String get smartSymptomCheck;

  /// No description provided for @onboarding1Title.
  ///
  /// In en, this message translates to:
  /// **'All Your Kids\' Health in One Place!'**
  String get onboarding1Title;

  /// No description provided for @onboarding1Desc.
  ///
  /// In en, this message translates to:
  /// **'Forget the paperwork. Keep track of all your child\'s health details safely from the first vaccinations to growth tracking and development updates, all from your phone.'**
  String get onboarding1Desc;

  /// No description provided for @onboarding2Title.
  ///
  /// In en, this message translates to:
  /// **'Doctor Consultation Made Easier & Faster!'**
  String get onboarding2Title;

  /// No description provided for @onboarding2Desc.
  ///
  /// In en, this message translates to:
  /// **'Select a specialist for your child anytime. Book appointments online or at the clinic and consult the doctor securely from your home.'**
  String get onboarding2Desc;

  /// No description provided for @onboarding3Title.
  ///
  /// In en, this message translates to:
  /// **'Your Personal Assistant, Step by Step'**
  String get onboarding3Title;

  /// No description provided for @onboarding3Desc.
  ///
  /// In en, this message translates to:
  /// **'Have a smart assistant that helps you track your child\'s symptoms, gives guidance, and provides tips in real-time.'**
  String get onboarding3Desc;

  /// No description provided for @personalInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get to Know You'**
  String get personalInfoTitle;

  /// No description provided for @personalInfoDesc.
  ///
  /// In en, this message translates to:
  /// **'Fill in your basic information so we can personalize your experience and help you easily track your child\'s health.'**
  String get personalInfoDesc;

  /// No description provided for @fullNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullNameLabel;

  /// No description provided for @fullNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get fullNameHint;

  /// No description provided for @governorateLabel.
  ///
  /// In en, this message translates to:
  /// **'Governorate'**
  String get governorateLabel;

  /// No description provided for @governorateHint.
  ///
  /// In en, this message translates to:
  /// **'Select your governorate'**
  String get governorateHint;

  /// No description provided for @addressLabel.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get addressLabel;

  /// No description provided for @addressHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full address'**
  String get addressHint;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @registerWith.
  ///
  /// In en, this message translates to:
  /// **'Register the Way You Prefer'**
  String get registerWith;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @addChildTitle.
  ///
  /// In en, this message translates to:
  /// **'Add Your Children and Start Your Journey with Them'**
  String get addChildTitle;

  /// No description provided for @addChildDesc.
  ///
  /// In en, this message translates to:
  /// **'Start now and keep everything about your child always close to you.'**
  String get addChildDesc;

  /// No description provided for @childNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Child Name'**
  String get childNameLabel;

  /// No description provided for @childNameHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your child\'s name'**
  String get childNameHint;

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get birthDateLabel;

  /// No description provided for @birthDateHint.
  ///
  /// In en, this message translates to:
  /// **'Select the date of birth'**
  String get birthDateHint;

  /// No description provided for @childGenderLabel.
  ///
  /// In en, this message translates to:
  /// **'Child Gender'**
  String get childGenderLabel;

  /// No description provided for @childGenderBoy.
  ///
  /// In en, this message translates to:
  /// **'Boy'**
  String get childGenderBoy;

  /// No description provided for @childGenderGirl.
  ///
  /// In en, this message translates to:
  /// **'Girl'**
  String get childGenderGirl;

  /// No description provided for @bloodTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Blood Type'**
  String get bloodTypeLabel;

  /// No description provided for @bloodTypeHint.
  ///
  /// In en, this message translates to:
  /// **'Select the blood type'**
  String get bloodTypeHint;

  /// No description provided for @addAnotherChild.
  ///
  /// In en, this message translates to:
  /// **'Want to add another child?'**
  String get addAnotherChild;

  /// No description provided for @nextButton.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextButton;

  /// No description provided for @childGender.
  ///
  /// In en, this message translates to:
  /// **'Child Gender'**
  String get childGender;

  /// No description provided for @boy.
  ///
  /// In en, this message translates to:
  /// **'Boy'**
  String get boy;

  /// No description provided for @girl.
  ///
  /// In en, this message translates to:
  /// **'Girl'**
  String get girl;

  /// No description provided for @howCanWeReachYou.
  ///
  /// In en, this message translates to:
  /// **'How can we reach you?'**
  String get howCanWeReachYou;

  /// No description provided for @howCanWeReachYouHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number and email so we can send you updates and important notifications as soon as possible.'**
  String get howCanWeReachYouHint;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @getVerificationCode.
  ///
  /// In en, this message translates to:
  /// **'Get Verification Code'**
  String get getVerificationCode;

  /// No description provided for @verificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the verification code sent to you'**
  String get verificationTitle;

  /// No description provided for @verificationDescLine1.
  ///
  /// In en, this message translates to:
  /// **'We sent you a 6-digit code to your number +{phoneNumber}'**
  String verificationDescLine1(String phoneNumber);

  /// No description provided for @verificationDescLine2.
  ///
  /// In en, this message translates to:
  /// **'Enter the code here to confirm your number is correct.'**
  String get verificationDescLine2;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @timer.
  ///
  /// In en, this message translates to:
  /// **'00:20'**
  String get timer;

  /// No description provided for @choosePasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a password to protect your account'**
  String get choosePasswordTitle;

  /// No description provided for @choosePasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Make it easy for you and hard for others, so you can log in safely anytime.'**
  String get choosePasswordDesc;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @passwordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a strong password'**
  String get passwordHint;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordHint;

  /// No description provided for @createAccountButton.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccountButton;

  /// No description provided for @welcomeBackTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBackTitle;

  /// No description provided for @loginDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your details to continue managing your baby\'s health easily and securely.'**
  String get loginDesc;

  /// No description provided for @phoneNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumberLabel;

  /// No description provided for @phoneNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get phoneNumberHint;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @loginButton.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get loginButton;

  /// No description provided for @loginWith.
  ///
  /// In en, this message translates to:
  /// **'Login with email'**
  String get loginWith;

  /// No description provided for @noAccount.
  ///
  /// In en, this message translates to:
  /// **'New here?'**
  String get noAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number so we can verify that the account is yours, then you can choose a new password.'**
  String get forgotPasswordDesc;

  /// No description provided for @newPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a new password'**
  String get newPasswordTitle;

  /// No description provided for @newPasswordDesc.
  ///
  /// In en, this message translates to:
  /// **'Make it easy for you and hard for others, but strong enough to keep your account safe.'**
  String get newPasswordDesc;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPasswordLabel;

  /// No description provided for @newPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Enter a strong password'**
  String get newPasswordHint;

  /// No description provided for @confirmPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPasswordButton;

  /// No description provided for @choosDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get choosDate;

  /// No description provided for @availableTime.
  ///
  /// In en, this message translates to:
  /// **'Available Time'**
  String get availableTime;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @doctorName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Islam Ghoneim'**
  String get doctorName;

  /// No description provided for @doctorSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Physical Therapy Specialist'**
  String get doctorSpecialty;

  /// No description provided for @doctorLocation.
  ///
  /// In en, this message translates to:
  /// **'Cairo - Heliopolis'**
  String get doctorLocation;

  /// No description provided for @yearsExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get yearsExperience;

  /// No description provided for @patients.
  ///
  /// In en, this message translates to:
  /// **'Patients'**
  String get patients;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews;

  /// No description provided for @years.
  ///
  /// In en, this message translates to:
  /// **'Years'**
  String get years;

  /// No description provided for @reviewBookingTitle.
  ///
  /// In en, this message translates to:
  /// **'Review Booking'**
  String get reviewBookingTitle;

  /// No description provided for @reviewBookingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Check the details before completing the booking.'**
  String get reviewBookingSubtitle;

  /// No description provided for @confirmBooking.
  ///
  /// In en, this message translates to:
  /// **'Confirm Booking'**
  String get confirmBooking;

  /// No description provided for @continueToPayment.
  ///
  /// In en, this message translates to:
  /// **'Continue to Payment'**
  String get continueToPayment;

  /// No description provided for @bookingConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Booking Confirmed!'**
  String get bookingConfirmed;

  /// No description provided for @bookingConfirmedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We will contact you soon to confirm the appointment.'**
  String get bookingConfirmedSubtitle;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @time.
  ///
  /// In en, this message translates to:
  /// **'Time'**
  String get time;

  /// No description provided for @bookingNumber.
  ///
  /// In en, this message translates to:
  /// **'Booking Number'**
  String get bookingNumber;

  /// No description provided for @serviceCost.
  ///
  /// In en, this message translates to:
  /// **'Service Cost'**
  String get serviceCost;

  /// No description provided for @tax.
  ///
  /// In en, this message translates to:
  /// **'Tax'**
  String get tax;

  /// No description provided for @totalCost.
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get totalCost;

  /// No description provided for @electronicPayment.
  ///
  /// In en, this message translates to:
  /// **'Electronic Payment'**
  String get electronicPayment;

  /// No description provided for @paymentAtVisit.
  ///
  /// In en, this message translates to:
  /// **'Pay at Visit'**
  String get paymentAtVisit;

  /// No description provided for @bookVisit.
  ///
  /// In en, this message translates to:
  /// **'Book Your Visit'**
  String get bookVisit;

  /// No description provided for @lastStep.
  ///
  /// In en, this message translates to:
  /// **'Last Step... To Make Sure Your Child is Safe'**
  String get lastStep;

  /// No description provided for @lastStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose the patient and payment method... and confirm the booking.'**
  String get lastStepSubtitle;

  /// No description provided for @choosePaymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Choose Payment Method'**
  String get choosePaymentMethod;

  /// No description provided for @payByVisa.
  ///
  /// In en, this message translates to:
  /// **'Pay by Visa'**
  String get payByVisa;

  /// No description provided for @checkup.
  ///
  /// In en, this message translates to:
  /// **'Checkup'**
  String get checkup;

  /// No description provided for @revisit.
  ///
  /// In en, this message translates to:
  /// **'Revisit'**
  String get revisit;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
