include "./test_suite/dependencies.ol.test"
include "dep2Out.depservice"

main {
  run( request )( response ){

    grq.request_message = JDEP_a;
    grq.name = "/mainIn/twiceNum";
    { goal@GoalManager( grq )( res5 ) | twice( request )( response ){ response = request*2} };
    expectedResult = 10;
    if( res5 != expectedResult ){
      fault.message = "Expecting: " + expectedResult + " Found: " + res5;
      fault.faultname = "Failed twice";
      throw( ExecutionFault, fault)
    }

  }
}
