# ---- 1. Base python ----
# Use Python 3 image as launching point
# Old 3.6 version python is needed for error-free aiohttp requests
# -slim reduces docker image size from 330MB to 50MB in Docker Hub.
FROM python:3.6-slim


# ---- 2. Copy Files/Build ----
# Set the working directory to /code - KEEP THIS STEP. USEFUL FOR OTHER THINGS.
# This folder is INSIDE the container, not in your computer.
# Use "$ docker exec -it 2_python_server_app_web_1 bash" to access container's CLI,
# then "ls, cd .., ls, cd /code" to find and edit files inside the container(2_python_server_app_web_1).
# This way you don't have to rebuild image everytime. 
# DON'T KNOW HOW OTHERS EDIT THESE FILES INSIDE CONTAINER YET. 
# INSTALLING NANO INSIDE CONTAINER TO EDIT FILES - IS BAD IDEA FOR DEVELOPMENT.
# SOME INSTALLS NANO AND EDIT FILES INSIDE CONTAINER, THOUGH.
# NEED TO FIGURE-OUT HOW/WHY TO EDIT/DEBUG .PY FILES INSIDE CONTAINER.
WORKDIR /code

# Copy the python script and txt file containing it's dependency from Python projects folder
# COPY aiohttp_server.py /
# COPY requirements.txt /

# COPY requirements.txt requirements.txt

# Copy the current directory "." in the project to the workdir "/code" in the image
# requirements.txt file will also gets copied inside the /code folder.
COPY . /code


# ---- 3. Install app dependencies ----
# Install dependency: aiohttp library v2.0.7 using pip inside docker image
# from the requirements.txt file
# The RUN command is executed when the image is built
RUN pip install -r requirements.txt


# ---- 4. Run app ----
# CMD command is executed when the docker image is actually run,
# i.e. a running container is actually created
CMD [ "python", "-u", "aiohttp_server.py" ]
# The '-u' parameter will instruct the Python interpreter to not buffer the output to console. 
# Without this, the Python output does not seem to be forwarded to the docker host