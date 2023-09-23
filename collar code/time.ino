void LocalTime(){
  struct tm timeinfo;
  
  strftime(timeHour,3, "%H", &timeinfo);
  strftime(timeMinuto,3, "%M", &timeinfo);
  strftime(timeWeekDay,10, "%A", &timeinfo);
  strftime(timeDia,3, "%d", &timeinfo);
  strftime(timeMes,10, "%B", &timeinfo);
  strftime(timeAno,5, "%Y", &timeinfo);
}