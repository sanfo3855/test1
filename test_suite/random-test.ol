include "./test_suite/dependencies.ol.test"

main {
  run( request )( response ){

    grq.request_message = void;
    grq.name = "/mainIn/randomNum";
    goal@GoalManager( grq )( res2 );
    if( !(res2 instanceof double) ){
      fault.message = "Expecting: " + "double num" + " Found: " + res2;
      fault.faultname = "Failed random";
      throw( ExecutionFault, fault)
    }

  }
}
