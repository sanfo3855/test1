include "console.iol"

interface mainInterface {
RequestResponse:
  stampa ( string )( void ),
  randomNum( void )( double ),
  toUp( string )( string ),
  twiceNum( int )( int),
  incNum( int )( int )
}

outputPort mainOut {
Location: "socket://localhost:13000"
Protocol: sodep
Interfaces: mainInterface
}

main
{
  stampa@mainOut( "Stampa" )( );

  randomNum@mainOut( )( response );
  println@Console( response )( );

  toUp@mainOut( "touppercase" )( response );
  println@Console( response )();

  twiceNum@mainOut( 3 )( response );
  println@Console( response )();
  
  incNum@mainOut( 3 )( response );
  println@Console( response )()
}
