import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";


actor Dbank{
  
  stable var currentValue: Float = 300;
  //currentValue := 300;
  

  stable var startTime = Time.now();
  //startTime := Time.now();
  //Debug.print(debug_show(startTime));

  let id = 123678576577;
//Debug.print(debug_show(id));

public func topUp(amount: Float){
  currentValue += amount;
  Debug.print(debug_show(currentValue));
};


public func withDraw(amount: Float){
  let tempValue: Float = currentValue - amount;
  if (tempValue >=0){
  currentValue -= amount;
  Debug.print(debug_show(currentValue));
  }else{
    Debug.print("Insufficient amount");
  }
};

public query func checkBalance(): async Float{
  return currentValue;
};


public func compound(){
  let currentTime = Time.now();
  let ellapsedTimeNS = startTime - currentTime;
  let ellipsedTimeS = ellapsedTimeNS / 1000000000;
  currentValue += currentValue * (1.01 ** Float.fromInt(ellipsedTimeS));
  startTime := currentTime;
};



}


