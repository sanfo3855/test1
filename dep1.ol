interface dep1Interface {
RequestResponse: inc( int )( int )
}

inputPort dep1In {
Location: "socket://localhost:13001"
Protocol: sodep
Interfaces: dep1Interface
}

execution{ concurrent }

main{
  [inc( request )( response ){
    response = request + 1
  }]
}
