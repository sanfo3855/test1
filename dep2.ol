interface dep2Interface {
RequestResponse: twice( int )( int )
}

inputPort dep2In {
Location: "socket://localhost:13002"
Protocol: sodep
Interfaces: dep2Interface
}

execution{ concurrent }

main{
  [twice( request )( response ){
    response = request * 2
  }]
}
