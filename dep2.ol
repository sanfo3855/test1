inputPort dep2In {
Location: "socket://localhost:13002"
Protocol: sodep
RequestResponse: twice( int )( int )
}

execution{ concurrent }

main{
  [twice( request )( response ){
    response = request * 2
  }]
}
