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

  /// No description provided for @relatedVideos.
  ///
  /// In en, this message translates to:
  /// **'Related Videos'**
  String get relatedVideos;

  /// No description provided for @noDescription.
  ///
  /// In en, this message translates to:
  /// **'No description available'**
  String get noDescription;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'You can find the videos you need through search'**
  String get searchHint;

  /// No description provided for @doctorConsult.
  ///
  /// In en, this message translates to:
  /// **'Doctor Consult'**
  String get doctorConsult;

  /// No description provided for @guideBooks.
  ///
  /// In en, this message translates to:
  /// **'Complete Awareness Guide'**
  String get guideBooks;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// No description provided for @responseRarely.
  ///
  /// In en, this message translates to:
  /// **'Rarely / Never'**
  String get responseRarely;

  /// No description provided for @responseSometimes.
  ///
  /// In en, this message translates to:
  /// **'Sometimes'**
  String get responseSometimes;

  /// No description provided for @responseAlways.
  ///
  /// In en, this message translates to:
  /// **'Always'**
  String get responseAlways;

  /// No description provided for @views.
  ///
  /// In en, this message translates to:
  /// **'views'**
  String get views;

  /// No description provided for @doctorSpecialty.
  ///
  /// In en, this message translates to:
  /// **'Physical Therapy Specialist'**
  String get doctorSpecialty;

  /// No description provided for @backButton.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backButton;

  /// No description provided for @writeMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message to the doctor'**
  String get writeMessage;

  /// No description provided for @endToEndEncrypted.
  ///
  /// In en, this message translates to:
  /// **'End-to-end encrypted.'**
  String get endToEndEncrypted;

  /// No description provided for @encryptionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Messages are secured with end-to-end encryption.'**
  String get encryptionSubtitle;

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfile;

  /// No description provided for @messageRead.
  ///
  /// In en, this message translates to:
  /// **'Read at'**
  String get messageRead;

  /// No description provided for @warningTitle.
  ///
  /// In en, this message translates to:
  /// **'Notice'**
  String get warningTitle;

  /// No description provided for @aiAssistantName.
  ///
  /// In en, this message translates to:
  /// **'Dana AI Assistant'**
  String get aiAssistantName;

  /// No description provided for @suggestedQuestionsHint.
  ///
  /// In en, this message translates to:
  /// **'Here are some suggested questions to help you get started...\nPick what suits you and we\'ll go from there.'**
  String get suggestedQuestionsHint;

  /// No description provided for @suggestedQ1.
  ///
  /// In en, this message translates to:
  /// **'How do I assess my child\'s condition?'**
  String get suggestedQ1;

  /// No description provided for @suggestedQ2.
  ///
  /// In en, this message translates to:
  /// **'What are the steps to start at home?'**
  String get suggestedQ2;

  /// No description provided for @suggestedQ3.
  ///
  /// In en, this message translates to:
  /// **'General health tips'**
  String get suggestedQ3;

  /// No description provided for @suggestedQ4.
  ///
  /// In en, this message translates to:
  /// **'Does this problem affect my child\'s development?'**
  String get suggestedQ4;

  /// No description provided for @suggestedQ5.
  ///
  /// In en, this message translates to:
  /// **'Prevention and safe treatment methods'**
  String get suggestedQ5;

  /// No description provided for @askAboutChild.
  ///
  /// In en, this message translates to:
  /// **'Ask me about your child\'s condition here...'**
  String get askAboutChild;

  /// No description provided for @doctorName.
  ///
  /// In en, this message translates to:
  /// **'Dr. Islam Ghoneim'**
  String get doctorName;

  /// No description provided for @doctorLocation.
  ///
  /// In en, this message translates to:
  /// **'Cairo - Heliopolis'**
  String get doctorLocation;

  /// No description provided for @sampleMessage1.
  ///
  /// In en, this message translates to:
  /// **'Doctor, I came to check on my son.'**
  String get sampleMessage1;

  /// No description provided for @sampleMessage2.
  ///
  /// In en, this message translates to:
  /// **'Thank you for sharing. Are these movements involuntary?'**
  String get sampleMessage2;

  /// No description provided for @sampleMessage3.
  ///
  /// In en, this message translates to:
  /// **'Yes doctor, they happen without him meaning to.'**
  String get sampleMessage3;

  /// No description provided for @sampleMessage4.
  ///
  /// In en, this message translates to:
  /// **'It seems like simple involuntary movements.'**
  String get sampleMessage4;

  /// No description provided for @sampleMessage5.
  ///
  /// In en, this message translates to:
  /// **'Okay doctor... does this need immediate treatment?'**
  String get sampleMessage5;

  /// No description provided for @sampleMessage6.
  ///
  /// In en, this message translates to:
  /// **'We usually start with a simple assessment.'**
  String get sampleMessage6;

  /// No description provided for @sampleMessage7.
  ///
  /// In en, this message translates to:
  /// **'Sure doctor. We will monitor and record all observations.'**
  String get sampleMessage7;

  /// No description provided for @sampleMessage8.
  ///
  /// In en, this message translates to:
  /// **'It is best to schedule a visit soon.'**
  String get sampleMessage8;

  /// No description provided for @warningDescription.
  ///
  /// In en, this message translates to:
  /// **'This assessment is a guidance tool to help you and does not replace specialized medical consultation.'**
  String get warningDescription;

  /// No description provided for @resultSpecialistTitle.
  ///
  /// In en, this message translates to:
  /// **'Consult a Specialist for Support.'**
  String get resultSpecialistTitle;

  /// No description provided for @resultSpecialistDescription.
  ///
  /// In en, this message translates to:
  /// **'The assessment shows that your child faces sensory challenges affecting their daily life. This is not a failure in your parenting, but a difference in their nervous system. Early intervention is important, so we recommend booking a consultation with a sensory integration specialist.'**
  String get resultSpecialistDescription;

  /// No description provided for @bookSpecialistConsultation.
  ///
  /// In en, this message translates to:
  /// **'Book a Specialist Consultation Now'**
  String get bookSpecialistConsultation;

  /// No description provided for @resultNormalTitle.
  ///
  /// In en, this message translates to:
  /// **'Reassuring Result: Your Child is Developing Normally'**
  String get resultNormalTitle;

  /// No description provided for @resultNormalDescription.
  ///
  /// In en, this message translates to:
  /// **'Based on your answers, your child\'s responses to sensory stimuli are normal and appropriate for their age. Any discomfort or tantrums they experience now are a very natural part of their emotional growth. Keep providing a safe and supportive environment.'**
  String get resultNormalDescription;

  /// No description provided for @browseActivities.
  ///
  /// In en, this message translates to:
  /// **'Browse Activities to Develop Their Skills'**
  String get browseActivities;

  /// No description provided for @readBook.
  ///
  /// In en, this message translates to:
  /// **'Read Book'**
  String get readBook;

  /// No description provided for @resultSensitivityTitle.
  ///
  /// In en, this message translates to:
  /// **'Needs Attention: Your Child Has Some Sensitivity'**
  String get resultSensitivityTitle;

  /// No description provided for @resultSensitivityDescription.
  ///
  /// In en, this message translates to:
  /// **'Your answers show that your child is more affected by certain sensory stimuli (such as sounds or touch) than usual, which may be causing some of their reactions. They need you to observe what bothers them and avoid it, while trying some calming sensory activities at home to help them adapt.'**
  String get resultSensitivityDescription;

  /// No description provided for @sensoryActivitiesPlan.
  ///
  /// In en, this message translates to:
  /// **'Sensory Activities Plan for Home'**
  String get sensoryActivitiesPlan;

  /// No description provided for @sectionHeaderTitle.
  ///
  /// In en, this message translates to:
  /// **'Initial Assessment of Sensory Challenges'**
  String get sectionHeaderTitle;

  /// No description provided for @sectionHeaderSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Quick questions to help us understand how your child responds to surrounding stimuli.'**
  String get sectionHeaderSubtitle;

  /// No description provided for @examinationTitle.
  ///
  /// In en, this message translates to:
  /// **'Examine Your Child'**
  String get examinationTitle;

  /// No description provided for @touchAndSoundTitle.
  ///
  /// In en, this message translates to:
  /// **'Response to Touch and Sound'**
  String get touchAndSoundTitle;

  /// No description provided for @touchAndSoundSubtitle.
  ///
  /// In en, this message translates to:
  /// **'(Sensitivity)'**
  String get touchAndSoundSubtitle;

  /// No description provided for @motorInteractionTitle.
  ///
  /// In en, this message translates to:
  /// **'Motor and Environmental Interaction'**
  String get motorInteractionTitle;

  /// No description provided for @motorInteractionSubtitle.
  ///
  /// In en, this message translates to:
  /// **'(Seeking or Avoiding Sensation)'**
  String get motorInteractionSubtitle;

  /// No description provided for @question1.
  ///
  /// In en, this message translates to:
  /// **'Does your child get severely bothered by normal sounds like a vacuum cleaner, blender, or a sudden loud noise, covering their ears?'**
  String get question1;

  /// No description provided for @question2.
  ///
  /// In en, this message translates to:
  /// **'Does your child strongly refuse to wear certain clothes due to their texture, or cry excessively about clothing tags or sock seams?'**
  String get question2;

  /// No description provided for @question3.
  ///
  /// In en, this message translates to:
  /// **'Does your child overreact when suddenly touched, or strongly avoid hugging and cuddling even from close relatives?'**
  String get question3;

  /// No description provided for @question4.
  ///
  /// In en, this message translates to:
  /// **'Does your child move constantly and excessively (as if motor-driven) and have great difficulty sitting still for a period appropriate for their age?'**
  String get question4;

  /// No description provided for @showResult.
  ///
  /// In en, this message translates to:
  /// **'Show Result'**
  String get showResult;

  /// No description provided for @publishedYear.
  ///
  /// In en, this message translates to:
  /// **'Published in'**
  String get publishedYear;

  /// No description provided for @featuredBooks.
  ///
  /// In en, this message translates to:
  /// **'Our Picks for Your Journey'**
  String get featuredBooks;

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

  /// No description provided for @priceValue.
  ///
  /// In en, this message translates to:
  /// **'250'**
  String get priceValue;

  /// No description provided for @currencyPound.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get currencyPound;

  /// No description provided for @thousand.
  ///
  /// In en, this message translates to:
  /// **'K'**
  String get thousand;

  /// No description provided for @seven.
  ///
  /// In en, this message translates to:
  /// **'7'**
  String get seven;

  /// No description provided for @fourPointFive.
  ///
  /// In en, this message translates to:
  /// **'4.5'**
  String get fourPointFive;

  /// No description provided for @threePointFive.
  ///
  /// In en, this message translates to:
  /// **'3.5'**
  String get threePointFive;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @examination.
  ///
  /// In en, this message translates to:
  /// **'Examination'**
  String get examination;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'Search Results ....'**
  String get searchResults;

  /// No description provided for @heroGrowthJourney.
  ///
  /// In en, this message translates to:
  /// **'Your Little Hero\'s Growth Journey'**
  String get heroGrowthJourney;

  /// No description provided for @searchVideos.
  ///
  /// In en, this message translates to:
  /// **'Search for the video you need...'**
  String get searchVideos;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results match your search'**
  String get noResults;

  /// No description provided for @understandSPD.
  ///
  /// In en, this message translates to:
  /// **'Understand His Sensory World (SPD)'**
  String get understandSPD;

  /// No description provided for @sensoryActivities.
  ///
  /// In en, this message translates to:
  /// **'Fun Sensory Activities at Home'**
  String get sensoryActivities;

  /// No description provided for @angerManagement.
  ///
  /// In en, this message translates to:
  /// **'Managing Sensory Anger Episodes'**
  String get angerManagement;

  /// No description provided for @sensoryDisorder.
  ///
  /// In en, this message translates to:
  /// **'What is Sensory Processing Disorder?'**
  String get sensoryDisorder;

  /// No description provided for @babyGrowth.
  ///
  /// In en, this message translates to:
  /// **'Your Baby\'s Growth Journey'**
  String get babyGrowth;

  /// No description provided for @motorDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Motor Development: From Crawling to Walking'**
  String get motorDevelopment;

  /// No description provided for @firstWords.
  ///
  /// In en, this message translates to:
  /// **'First Words: How to Encourage Speech?'**
  String get firstWords;

  /// No description provided for @healthCapsules.
  ///
  /// In en, this message translates to:
  /// **'Better Awareness Capsules'**
  String get healthCapsules;

  /// No description provided for @sleepCapsule.
  ///
  /// In en, this message translates to:
  /// **'Healthy Sleep Capsule'**
  String get sleepCapsule;

  /// No description provided for @nutritionCapsule.
  ///
  /// In en, this message translates to:
  /// **'Healthy Nutrition Capsule'**
  String get nutritionCapsule;

  /// No description provided for @noResultsDesc.
  ///
  /// In en, this message translates to:
  /// **'Please check the spelling, or try searching in the main library sections.'**
  String get noResultsDesc;

  /// No description provided for @bookSensoryIntegrationTitle.
  ///
  /// In en, this message translates to:
  /// **'Sensory Integration and the Child'**
  String get bookSensoryIntegrationTitle;

  /// No description provided for @bookSensoryIntegrationAuthor.
  ///
  /// In en, this message translates to:
  /// **'Lindsay Biel & Nancy Peske'**
  String get bookSensoryIntegrationAuthor;

  /// No description provided for @bookSensoryIntegrationDesc.
  ///
  /// In en, this message translates to:
  /// **'A specialized book on understanding children\'s sensory systems and how to handle daily challenges in a scientific and simplified way.'**
  String get bookSensoryIntegrationDesc;

  /// No description provided for @bookSensoryChapter1Title.
  ///
  /// In en, this message translates to:
  /// **'What is Sensory Integration?'**
  String get bookSensoryChapter1Title;

  /// No description provided for @bookSensoryChapter1Body.
  ///
  /// In en, this message translates to:
  /// **'Sensory integration is the process by which the brain organizes information from different senses. When this system works properly, the child can respond to the environment appropriately.'**
  String get bookSensoryChapter1Body;

  /// No description provided for @bookSensoryChapter2Title.
  ///
  /// In en, this message translates to:
  /// **'Signs of Sensory Integration Difficulties'**
  String get bookSensoryChapter2Title;

  /// No description provided for @bookSensoryChapter2Body.
  ///
  /// In en, this message translates to:
  /// **'There are many signs that may indicate sensory integration difficulties, including: refusing to wear certain clothes due to texture, extreme sensitivity to loud sounds.'**
  String get bookSensoryChapter2Body;

  /// No description provided for @bookAsyncChildTitle.
  ///
  /// In en, this message translates to:
  /// **'The Out-of-Sync Child'**
  String get bookAsyncChildTitle;

  /// No description provided for @bookAsyncChildAuthor.
  ///
  /// In en, this message translates to:
  /// **'Carol Stock Kranowitz'**
  String get bookAsyncChildAuthor;

  /// No description provided for @bookAsyncChildDesc.
  ///
  /// In en, this message translates to:
  /// **'A comprehensive guide for dealing with children who develop at a different pace than their peers and need special understanding and support.'**
  String get bookAsyncChildDesc;

  /// No description provided for @bookAsyncChapter1Title.
  ///
  /// In en, this message translates to:
  /// **'Who is the Out-of-Sync Child?'**
  String get bookAsyncChapter1Title;

  /// No description provided for @bookAsyncChapter1Body.
  ///
  /// In en, this message translates to:
  /// **'The out-of-sync child is one whose developmental levels vary significantly, being very advanced in one area like intelligence or language, while being at an earlier stage emotionally or socially.'**
  String get bookAsyncChapter1Body;

  /// No description provided for @bookAsyncChapter2Title.
  ///
  /// In en, this message translates to:
  /// **'How to Support Your Out-of-Sync Child?'**
  String get bookAsyncChapter2Title;

  /// No description provided for @bookAsyncChapter2Body.
  ///
  /// In en, this message translates to:
  /// **'Real support starts with acceptance and understanding. You must accept that your child moves at their own pace, and that this is not a flaw but a characteristic that needs different care.'**
  String get bookAsyncChapter2Body;

  /// No description provided for @bookSensorySignalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Accept Your Child\'s Sensory Signals'**
  String get bookSensorySignalsTitle;

  /// No description provided for @bookSensorySignalsAuthor.
  ///
  /// In en, this message translates to:
  /// **'Dr. Karen Sourkav'**
  String get bookSensorySignalsAuthor;

  /// No description provided for @bookSensorySignalsDesc.
  ///
  /// In en, this message translates to:
  /// **'A practical book that helps you understand and read your child\'s sensory signals and deal with them correctly and effectively.'**
  String get bookSensorySignalsDesc;

  /// No description provided for @bookSensorySignalsChapter1Title.
  ///
  /// In en, this message translates to:
  /// **'What are Sensory Signals?'**
  String get bookSensorySignalsChapter1Title;

  /// No description provided for @bookSensorySignalsChapter1Body.
  ///
  /// In en, this message translates to:
  /// **'Sensory signals are the way your child\'s body expresses its sensory needs.'**
  String get bookSensorySignalsChapter1Body;

  /// No description provided for @bookSensorySignalsChapter2Title.
  ///
  /// In en, this message translates to:
  /// **'How to Respond to Your Child\'s Signals?'**
  String get bookSensorySignalsChapter2Title;

  /// No description provided for @bookSensorySignalsChapter2Body.
  ///
  /// In en, this message translates to:
  /// **'The correct response to sensory signals depends on the type of signal and its context.'**
  String get bookSensorySignalsChapter2Body;

  /// No description provided for @bookGuide1Author.
  ///
  /// In en, this message translates to:
  /// **'Anji Qaws'**
  String get bookGuide1Author;

  /// No description provided for @bookGuide1Desc.
  ///
  /// In en, this message translates to:
  /// **'A quick reference book explaining how to understand your child\'s behaviors and how to intervene calmly to contain tantrums.'**
  String get bookGuide1Desc;

  /// No description provided for @bookGuide1Chapter1Title.
  ///
  /// In en, this message translates to:
  /// **'To Every Parent Who Feels Their Child is Hard to Handle'**
  String get bookGuide1Chapter1Title;

  /// No description provided for @bookGuide1Chapter1Body.
  ///
  /// In en, this message translates to:
  /// **'We focus on the dynamic movement that begins from the moment your child wakes up.'**
  String get bookGuide1Chapter1Body;

  /// No description provided for @bookGuide1Chapter2Title.
  ///
  /// In en, this message translates to:
  /// **'Imagine if Every Touch was Sandpaper'**
  String get bookGuide1Chapter2Title;

  /// No description provided for @bookGuide1Chapter2Body.
  ///
  /// In en, this message translates to:
  /// **'Imagine walking inside a city filled with millions of sounds.'**
  String get bookGuide1Chapter2Body;

  /// No description provided for @bookBodyLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Guide to Understanding Your Child\'s Body Language'**
  String get bookBodyLanguageTitle;

  /// No description provided for @bookBodyLanguageAuthor.
  ///
  /// In en, this message translates to:
  /// **'Mariam Al-Abdullah'**
  String get bookBodyLanguageAuthor;

  /// No description provided for @bookBodyLanguageDesc.
  ///
  /// In en, this message translates to:
  /// **'Introduces you to physical signals that help improve communication with your child and better understand their needs.'**
  String get bookBodyLanguageDesc;

  /// No description provided for @bookBodyLanguageChapter1Title.
  ///
  /// In en, this message translates to:
  /// **'Introduction - Body Language in Children'**
  String get bookBodyLanguageChapter1Title;

  /// No description provided for @bookBodyLanguageChapter1Body.
  ///
  /// In en, this message translates to:
  /// **'Children communicate in many ways before they master speech.'**
  String get bookBodyLanguageChapter1Body;

  /// No description provided for @bookAngerTitle.
  ///
  /// In en, this message translates to:
  /// **'Strategies for Dealing with Tantrums'**
  String get bookAngerTitle;

  /// No description provided for @bookAngerAuthor.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Qasim'**
  String get bookAngerAuthor;

  /// No description provided for @bookAngerDesc.
  ///
  /// In en, this message translates to:
  /// **'A collection of effective tips for understanding how to deal with tantrums in a positive and effective way.'**
  String get bookAngerDesc;

  /// No description provided for @bookAngerChapter1Title.
  ///
  /// In en, this message translates to:
  /// **'Why Does Your Child Get Angry?'**
  String get bookAngerChapter1Title;

  /// No description provided for @bookAngerChapter1Body.
  ///
  /// In en, this message translates to:
  /// **'Tantrums in children are usually not rebellion or stubbornness, but a clear message: I cannot handle what is happening now.'**
  String get bookAngerChapter1Body;

  /// No description provided for @bookEmotionsTitle.
  ///
  /// In en, this message translates to:
  /// **'How to Identify Your Child\'s Emotions'**
  String get bookEmotionsTitle;

  /// No description provided for @bookEmotionsAuthor.
  ///
  /// In en, this message translates to:
  /// **'Rana Samir'**
  String get bookEmotionsAuthor;

  /// No description provided for @bookEmotionsDesc.
  ///
  /// In en, this message translates to:
  /// **'A guide that helps you identify your child\'s emotions and guide them to express themselves in a healthy way.'**
  String get bookEmotionsDesc;

  /// No description provided for @bookEmotionsChapter1Title.
  ///
  /// In en, this message translates to:
  /// **'Emotional Intelligence Starts at Home'**
  String get bookEmotionsChapter1Title;

  /// No description provided for @bookEmotionsChapter1Body.
  ///
  /// In en, this message translates to:
  /// **'Children are not born knowing the names of their feelings, nor do they know how to deal with them. This is a skill that is taught and acquired.'**
  String get bookEmotionsChapter1Body;
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
