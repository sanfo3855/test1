include "./test_suite/dependencies.ol.test"
include "dep1Out.depservice"

main {
  run( request )( response ){

    grq.request_message = JDEP_a;
    grq.name = "/mainIn/incNum";
    { goal@GoalManager( grq )( res4 ) | inc( request )( response ){ response = request+1} };
    expectedResult = 6;
    if( res4 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + " Found: " + res4;
      fault.faultname = "Failed increment";
      throw( ExecutionFault, fault)
    }

  }
}
