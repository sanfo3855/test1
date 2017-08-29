include "console.iol"
include "string_utils.iol"
include "math.iol"
include "public/interfaces/mainInterface.iol"
include "public/interfaces/dep1Interface.iol"
include "public/interfaces/dep2Interface.iol"

execution{ concurrent }

inputPort mainIn {
Location: "socket://localhost:13000"
Protocol: sodep
Interfaces: mainInterface
}

outputPort dep1Out {
Location: "socket://localhost:13001"
Protocol: sodep
Interfaces: dep1Interface, dep2Interface
}

outputPort dep2Out {
Location: "socket://localhost:13002"
Protocol: sodep
Interfaces: dep2Interface
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
