import 'dart:math';
import 'package:observe/observe.dart';

// create observe design pattern class

class Observe extends Object with Observable{

//use package implemented

//dafault observed field
	Observe();
	@observable String observedField = "No notification";
	toString() => observedField.toString();
	
//set system time to compare changes in the notification system
	DateTime datetime = DateTime.now();
	String now = datetime.toString();
}
public class Notification {
		
  //determine if the notification system is turned on or not
	var _random = new random();
	var NotificationId= _random.nextInt(1);
	
	void Notification();
	
	var update(){
	return NotificationId;
	}	
	
 }
main() {

  var obj = new Observe();
  Observe obs = new Observe();
  
  //make system time available in the main
  String current_time = obs.now;
  
  //print current Notification system status with current time
    print('$current_time Notification system now is $obj');
	
   Notification notify = new notification();
   var systemId = notify.update();
   
  //if the system is on then 
	if (systemId = 1){
	obj.observedField = "Notification is allowed";
	}
	
  //if the system is turned off then
	else if (systemId = 0){
	obj.observedField = "No notification";
	}
	
	else{
	obj.observedField = "notification system error";
	}


  //check current notification system status with default setting
  Observable.dirtyCheck();

  //return the current notification system status with current time
  print('$current_time Notification system status changes to $obj');
}
