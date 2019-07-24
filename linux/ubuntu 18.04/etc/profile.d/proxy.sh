#!/bin/bash
PROXY="http://172.19.10.1:3128/"
export {http,https,ftp,rsync,socks,all}_proxy=$PROXY
export {HTTP,HTTPS,FTP,RSYNC,SOCKS,ALL}_PROXY=$PROXY

