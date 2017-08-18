# R43ples docker image

Build with
```
docker build -t r43ples . 
```
and run with
```
docker run docker run --name r43ples -it r43ples  
```
Port 9998 is exposed and can be mapped with
```
docker run docker run --name r43ples -p 9998:80 -it r43ples  

```

A data directory containing a `r43ples.conf` and the graphfile can be mounted with
```
docker run docker run --name r43ples -v yourdirectory:/var/r43ples/data  -it r43ples  
```
