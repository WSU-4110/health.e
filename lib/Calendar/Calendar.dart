class Calendar {
  List<Event> events = [];
  void addEvent(Event e)
  {
    events.add(e);
  }

  void removeEvent(Event e)
  {
    events.remove(e);
  }

  void printEvents() {
    for (var event in events) {

      print('${event.title} on ${event.date}');
    }
  }
}

class Event {
  String title;
  DateTime date;

  Event({required this.title, required this.date});
}

class DailyCalendar extends Calendar {
  DateTime date;


  DailyCalendar({required this.date});

  void printEvents() {
    for (var event in events) {
      if (event.date == date) {
        print('${event.title} at ${event.date.hour}:${event.date.hour}:${event.date.minute}');
      }
    }
  }
}

class WeeklyCalendar extends Calendar {

  DateTime startDate;

  WeeklyCalendar({required this.startDate});

  void printEvents() {
    for (var event in events) {
      if (event.date.isAfter(startDate.subtract(Duration(days:1))) && event.date.isBefore(startDate.add(Duration(days: 7)))) {
        print('${event.title} at ${event.date.hour}:${event.date.hour}:${event
            .date.minute}');
      }
    }
  }
}

class MonthlyCalendar extends Calendar {

  DateTime month;

  MonthlyCalendar({required this.month});

  void printEvents() {
    for (var event in events) {
      if (event.date.month == month.month && event.date.year == month.year) {
        print('${event.title} on ${event.date.day}');
      }
    }
  }
}
