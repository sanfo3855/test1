include "../dependencies.ol"
include "../dep1Out.depservice"
include "../dep2Out.depservice"


main {
  run( request )( response ){

    grq.request_message = JDEP_gianni;
    grq.name = "/mainIn/stampa";
    goal@GoalManager( grq )( res1 );
    expectedResult = void;
    if( res1 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + "Found: " + res1;
      fault.faultname = "Failed printing";
      throw( ExecutionFault, fault)
    };

    grq.request_message = void;
    grq.name = "/mainIn/randomNum";
    goal@GoalManager( grq )( res2 );
    if( !(res2 instanceof double) ){
      fault.message = "Expecting: " + "double num" + "Found: " + res2;
      fault.faultname = "Failed random";
      throw( ExecutionFault, fault)
    };

    grq.request_message = JDEP_gianni;
    grq.name = "/mainIn/toUp";
    goal@GoalManager( grq )( res3 );
    expectedResult = "MUCIACCIA";
    if( res3 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + "Found: " + res3;
      fault.faultname = "Failed upper case";
      throw( ExecutionFault, fault)
    };

    grq.request_message = JDEP_a;
    grq.name = "/mainIn/incNum";
    { goal@GoalManager( grq )( res4 ) | inc( request )( response ){ response = request+1} };
    expectedResult = JDEP_a+1;
    if( res4 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + "Found: " + res4;
      fault.faultname = "Failed increment";
      throw( ExecutionFault, fault)
    };

    grq.request_message = JDEP_a;
    grq.name = "/mainIn/twiceNum";
    { goal@GoalManager( grq )( res5 ) | twice( request )( response ){ response = 8} };
    expectedResult = JDEP_a * 2;
    if( res5 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + "Found: " + res5;
      fault.faultname = "Failed twice";
      throw( ExecutionFault, fault)
    }

  }
}
