import 'package:dana/extensions/localization_extension.dart';
import 'package:dana/features/notification/data/models/notification_model.dart';
import 'package:flutter/material.dart';

List<AppNotification> mockNotifications(BuildContext context) {
  return [
    AppNotification(
      title: context.l10n.vaccineReminderTitle,
      body: context.l10n.vaccineReminderDesc,
      time: TimeOfDay(hour: 14, minute: 30),
      type: NotificationType.vaccine,
    ),
    AppNotification(
      title: context.l10n.consultationReminderTitle,
      body: context.l10n.consultationReminderDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.consultationReminderTitle,
      body: context.l10n.consultationReminderDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.appointmentReminderTitle,
      body: context.l10n.appointmentReminderDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.supportSessionTitle,
      body: context.l10n.supportSessionDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.feedbackSurveyTitle,
      body: context.l10n.feedbackSurveyDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.prepareDocumentsTitle,
      body: context.l10n.prepareDocumentsDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.faqTitle,
      body: context.l10n.faqDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.statusUpdatesTitle,
      body: context.l10n.statusUpdatesDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.supportProgramTitle,
      body: context.l10n.supportProgramDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.personalConsultationTitle,
      body: context.l10n.personalConsultationDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.additionalResourcesTitle,
      body: context.l10n.additionalResourcesDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.shareExperienceTitle,
      body: context.l10n.shareExperienceDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.confirmAttendanceTitle,
      body: context.l10n.confirmAttendanceDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.billingReviewTitle,
      body: context.l10n.billingReviewDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
    AppNotification(
      title: context.l10n.availableServicesTitle,
      body: context.l10n.availableServicesDesc,
      time: TimeOfDay(hour: 2, minute: 30),
      isRead: true,
      type: NotificationType.reminder,
    ),
  ];
}
