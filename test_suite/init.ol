include "./test_suite/dependencies.ol.test"


main {
  run( request )( response ){

    grq.name = "stampa-test";
    goal@GoalManager( grq )( res );

    grq.name = "random-test";
    goal@GoalManager( grq )( res );


    grq.name = "toup-test";
    goal@GoalManager( grq )( res );


    grq.name = "incnum-test";
    goal@GoalManager( grq )( res );


    grq.name = "twicenum-test";
    goal@GoalManager( grq )( res )


  }
}
