# A Python application For a Docker image
# A simple program to get the product_id from a "http get request".
# 1001 will be returned if no product_id is got from the "http get request"

from aiohttp import web
# see https://docs.aiohttp.org/en/stable/web_quickstart.html

# Definition to handle async http requests
async def handle_request(request):      
    # gets prod_id "1007" from http request as in http://127.0.0.1:5859/1007
    # default is "1001", if nothing is received as in http://127.0.0.1:5859
    prod_id = request.match_info.get('prod_id', "1001")
    text = "Received Product_ID: " + prod_id
    
    # prints in terminal
    print('Received request, replying with "{}".'.format(text))
    
    # prints in browser - the received or default prod_id at http://127.0.0.1:5859/
    return web.Response(text=text)

# Main Program using 'web' module from 'aiohttp' library
# see https://docs.aiohttp.org/en/stable/web_quickstart.html
app = web.Application()
app.router.add_get('/', handle_request) # for empty requests
app.router.add_get('/{prod_id}', handle_request) # for requests with prod_id

web.run_app(app, port=5858) # in http://127.0.0.1:5859

# dependency for aiohttp_server.py
# aiohttp==2.0.7