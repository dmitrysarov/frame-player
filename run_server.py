# run_server.py
from http.server import SimpleHTTPRequestHandler, HTTPServer

server_address = ('', 3000)
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
httpd.serve_forever()
