quick selenium test
===================

From docker https://github.com/SeleniumHQ/docker-selenium/wiki/Getting-Started-with-Docker-Compose

This is a quick - get it running insie docker. The next step (which we could do from here) is to get
test run itself to be self contained in docker.

To run :

```
docker-compose up -d
```

You can point your browser to http://localhost:4444

As well, you may vien the logs by using `docker log -f <pod name or id>`. The included test is a simple python script and the requirements file. Instead of "poluting" my local python environment, we can fully run it inside it's own container.

```
docker run -it --rm --name  test  -v $(pwd):/usr/src/myapp -w /usr/src/myapp --network host python:3 /bin/sh -c "pip install -r requirements.txt && python sel.py"

```

Where the python:3 container image is a self contained python image with everything required to run. We could also, using a Dockerfile, build a new image that would contain the full test suite.

So build using :
```
docker build -t sel-test .

```

And run it with :
```
docker run -it --rm --network host sel-test
```

You will notice that it will no longer fetch the selecnium package because it is already included in the image `sel-test`.

This demonstrates two powerfull features of docker :

- Environment isolation down to the file system
- The Immutable container - a certainty that you will always run the identical code.
