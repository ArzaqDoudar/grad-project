import '/core/class/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    // here we have problem
    return response;
  } else {
    return StatusRequest.success;
  }
}
