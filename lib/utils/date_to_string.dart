import 'package:intl/intl.dart';

String DateToString(DateTime date_time, bool if_american)
{
  String string_date = '';

  if(if_american)
  {
    string_date = DateFormat('MM/dd/yyyy').format(date_time);
  }
  else
  {
    string_date = DateFormat('dd/MM/yyyy').format(date_time);
  }
  return string_date;
}

String DateToFullMonthString(DateTime date_time)
{
  return DateFormat('MMMM d, yyyy').format(date_time);
}
