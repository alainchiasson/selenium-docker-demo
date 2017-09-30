FROM python:3

WORKDIR /usr/src/myapp

COPY requirements.txt /usr/src/myapp/requirements.txt
COPY sel.py /usr/src/myapp/sel.py

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

CMD ["sel.py"]
