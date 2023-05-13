int calculateAge(int birthDay, int birthMonth, int birthYear) {
  int presentDay = DateTime.now().day;
  int presentMonth = DateTime.now().month;
  int presentYear = DateTime.now().year;
  // int age = 0;
  List<int> month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  // int month[] = { 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 };
  if (birthDay > presentDay) {
    presentDay = presentDay + month[birthMonth - 1];
    presentMonth = presentMonth - 1;
  }
  if (birthMonth > presentMonth) {
    presentYear = presentYear - 1;
    presentMonth = presentMonth + 12;
  }
  int finalDate = presentDay - birthDay;
  int finalMonth = presentMonth - birthMonth;
  int finalYear = presentYear - birthYear;
  if (finalDate >= 20) {
    finalMonth = finalMonth + 1;
  }
  if (finalMonth >= 9) {
    finalYear = finalYear + 1;
  }
  return finalYear;
}
