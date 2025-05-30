import 'package:flutter/material.dart';
import 'package:morphe/utils/constants.dart';

enum HabitType {
  PHYSICAL,
  GENERAL,
  MENTAL;

  Color getColor() {
    switch (this) {
      case HabitType.PHYSICAL:
        return kPhysicalColor;
      case HabitType.MENTAL:
        return kMentalColor;
      case HabitType.GENERAL:
        return kGeneralColor;
    }
  }

  static HabitType getTypeFromString(String type) {
    switch (type) {
      case "physical":
        return HabitType.PHYSICAL;
      case "mental":
        return HabitType.MENTAL;
      case "general":
        return HabitType.GENERAL;
      default:
        throw Exception('Invalid habit type provided');
    }
  }

  String format() {
    return name[0] + name.substring(1, name.length).toLowerCase();
  }
}

enum Day {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY;

  static Day getDayFromString(String type) {
    switch (type) {
      case "monday":
        return Day.MONDAY;
      case "tuesday":
        return Day.TUESDAY;
      case "wednesday":
        return Day.WEDNESDAY;
      case "thursday":
        return Day.THURSDAY;
      case "friday":
        return Day.FRIDAY;
      case "saturday":
        return Day.SATURDAY;
      case "sunday":
        return Day.SUNDAY;
      case "":
        final weekday =
            [
              'monday',
              'tuesday',
              'wednesday',
              'thursday',
              'friday',
              'saturday',
              'sunday',
            ][DateTime.now().weekday - 1];
        return getDayFromString(weekday);
      default:
        throw Exception('Invalid day type provided');
    }
  }

  DateTime toDateTime({DateTime? date}) {
    final fromDate = date ?? DateTime.now();
    final todayWeekday = fromDate.weekday; // 1 (Mon) - 7 (Sun)
    final targetWeekday = index + 1; // Because MONDAY.index = 0 => 1 (Mon)

    int daysDifference = (targetWeekday - todayWeekday) % 7;
    if (daysDifference < 0) daysDifference += 7;

    return fromDate.add(Duration(days: daysDifference));
  }

  String format() {
    return name[0] + name.substring(1, name.length).toLowerCase();
  }
}

enum Frequency {
  DAILY,
  WEEKLY,
  BYWEEKLY,
  MONTHLY;

  static Frequency getFrequencyFromString(String type) {
    switch (type) {
      case "daily":
        return Frequency.DAILY;
      case "weekly":
        return Frequency.WEEKLY;
      case "byweekly":
        return Frequency.BYWEEKLY;
      case "monthly":
        return Frequency.MONTHLY;
      default:
        throw Exception('Invalid frequency type provided');
    }
  }

  String format() {
    return name[0] + name.substring(1, name.length).toLowerCase();
  }
}

enum AppLoadState { notInitialized, loading, ready, error }
