# Docker-Python-AioHTTPServer-App
This app receives http requests to capture the product_id in the URL.

## Pulling images from Docker Hub:

1. Pull the image from Docker Hub to your local machine and run it in independently using:

`$ docker pull armoz13/python-aiohttp-server-app:latest`

2. In Linux, all pulled Image will be stored in 

`Docker Root Dir: /var/lib/docker`

Use `$ docker info` to get this location
Leave the pulled image there, do not move it elsewhere.

3. Find the image id of the pulled image:

`$ docker images`

4. Run the image using:

`$ docker run -p 5858:5858 <your_image_id>`

5858 is the port number the app is designed to run on- See files: aiohttp_server.py, docker-compose.yml
Without port number in `docker run` command, this app container will run but it cannot serve to the browser.

5. Once the image is running visit http://localhost:5858/ to see the application. 
 

 