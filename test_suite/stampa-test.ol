include "./test_suite/dependencies.ol.test"

main {
  run( request )( response ){

    grq.request_message = JDEP_gianni;
    grq.name = "/mainIn/stampa";
    goal@GoalManager( grq )( res1 );
    expectedResult = void;
    if( res1 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + " Found: " + res1;
      fault.faultname = "Failed printing";
      throw( ExecutionFault, fault)
    }

  }
}
