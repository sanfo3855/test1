inputPort dep1In {
Location: "socket://localhost:13001"
Protocol: sodep
RequestResponse: inc( int )( int )
}

execution{ concurrent }

main{
  [inc( request )( response ){
    response = request + 1
  }]
}
