include "./test_suite/dependencies.ol.test"

main {
  run( request )( response ){

    grq.request_message = JDEP_gianni;
    grq.name = "/mainIn/toUp";
    goal@GoalManager( grq )( res3 );
    expectedResult = "GABIBBO";
    if( res3 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + " Found: " + res3;
      fault.faultname = "Failed upper case";
      throw( ExecutionFault, fault)
    }

  }
}
