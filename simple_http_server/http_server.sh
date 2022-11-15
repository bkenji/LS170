#!/bin/bash

function server () {
  while true
  do
    read -a message_arr
    method=${message_arr[0]}
    path=${message_arr[1]}
    if [[ $method = "GET" ]]
    then 
      if [[ -f "./www$path" ]]
      then 
        body_length=$(wc -c < "./www$path")
        echo -ne "HTTP/1.1 200 OK\r\n"
        echo -ne "Content-Type: text/html; charset=utf -8\r\n"
        echo -ne "Content-Length: $body_length\r\n\r\n";
        cat "./www$path";
        echo -e
      else
        echo -ne "HTTP/1.1 404 Not Found\r\n"
        echo -ne "Content-Length: 0\r\n\r\n"
      fi
    else
      echo -ne "HTTP/1.1 400 Bad Request\r\n"
      echo -ne "Content-Length: 0\r\n\r\n" 
    fi
  done
}

coproc SERVER_PROCESS { server; }

nc -lvk 2345 <&${SERVER_PROCESS[0]} >&${SERVER_PROCESS[1]}
