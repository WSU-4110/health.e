import 'Calendar.dart';
abstract class CalendarFactory {
  Calendar createCalendar();
}

class DailyCalendarFactory implements CalendarFactory
{
  @override
  Calendar createCalendar() {
    // TODO: implement createCalendar
    return DailyCalendar(date: DateTime(2020,1,1));
  }
}

class WeeklyCalendarFactory implements CalendarFactory
{
  @override
  Calendar createCalendar() {
    // TODO: implement createCalendar
    return WeeklyCalendar(startDate: DateTime(2020,1,1));
  }
}
class MonthlyCalendarFactory implements CalendarFactory
{
  @override
  Calendar createCalendar() {
    // TODO: implement createCalendar
    return MonthlyCalendar(month: DateTime(2020,1,1));
  }
}


