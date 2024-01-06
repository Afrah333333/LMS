import 'package:online_learning_platform/src/common_widgets/teacher/schedule/schedule_model.dart';
import 'Remaining_period.dart';
import 'CurrentPeriod.dart';
import 'TodayText.dart';

List<Period> schedule_timeTable = [];
DateTime now = DateTime.now();
bool displayTimer = false;
late String today='Wednesday'; // Provide an initial value


final DateTime collegeStart =
DateTime(now.year, now.month, now.day, 0, 0, 10, 0, 0);
DateTime collegeEnd =
DateTime(now.year, now.month, now.day, 0, 0, 16, 40, 0);
late DateTime relativeEnding=DateTime(now.year, now.month, now.day, 0, 0, 60, 10, 0);

RemainingPeriodsState remainingState = RemainingPeriodsState();
CurrentState currentPeriodState = CurrentState();
TodayState todayState = TodayState();