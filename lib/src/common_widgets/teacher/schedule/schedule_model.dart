class Period {

  late String name;
  late int lengthInMinutes;

  late DateTime startsAt=DateTime.now();
  late DateTime endsAt=this.startsAt.add(Duration(minutes: lengthInMinutes));
  Period({
    required this.name ,
    required this.lengthInMinutes ,

  }) ;
}
