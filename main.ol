include "console.iol"
include "string_utils.iol"
include "math.iol"
include "mainInterface.iol"

execution{ concurrent }

inputPort mainIn {
Location: "socket://localhost:13000"
Protocol: sodep
Interfaces: mainInterface
}

outputPort dep1Out {
Location: "socket://localhost:13001"
Protocol: sodep
RequestResponse: inc( int )( int )
}

outputPort dep2Out {
Location: "socket://localhost:13002"
Protocol: sodep
RequestResponse: twice( int )( int )
}

main{
  [stampa( request )( ) {
    println@Console( request )()
  }]

  [randomNum ( )( response ){
    random@Math()( response )
  }]

  [toUp( request )( response ){
    toUpperCase@StringUtils( request )( response )
  }]

  [twiceNum( request )( response ){
    twice@dep2Out( request )( response )
  }]

  [incNum( request )( response ){
    inc@dep1Out( request )( response )
  }]
}
