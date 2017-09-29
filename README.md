quick selenium test
===================

From docker https://github.com/SeleniumHQ/docker-selenium/wiki/Getting-Started-with-Docker-Compose

This is a quick - get it running insie docker. The next step (which we could do from here) is to get
test run itself to be self contained in docker.

To run :

```
docker-compose up -d
docker run -it --rm --name  test  -v $(pwd):/usr/src/myapp -w /usr/src/myapp python:3 pip install -r requirements.txt && python sel.py

```

The results should be :

```
Google
Google
```
