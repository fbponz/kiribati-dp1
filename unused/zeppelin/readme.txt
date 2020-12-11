


docker run -p 19999:8080  -v $PWD/logs:/zeppelin/logs -v $PWD/data:/zeppelin/data --rm --name zeppelin_single apache/zeppelin:0.8.1