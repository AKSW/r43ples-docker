# R43ples docker image

Build with
```
docker build -t r43ples .
```
and run with
```
docker run docker run --name r43ples -it r43ples  
```
Port 80 is exposed and can be mapped with
```
docker run docker run --name r43ples -p 8080:80 -it r43ples  
```

The store will be initalized with graph http://example.org/ under revision control.
You can change the URI with use of variable GRAPH_URI like this:
```
docker run docker run --name r43ples -e GRAPH_URI=http://other.graph.uri/ -it r43ples  
```


## Mount volumes
A conf directory containing a `r43ples.conf` can be overwritten by
```
docker run docker run --name r43ples -v /your/conf/directory:/var/r43ples/conf  -it r43ples  
```
A data directory containing a N-Triples or N-Quads files can be overwritten by
```
docker run docker run --name r43ples -v /your/data/directory:/var/r43ples/data  -it r43ples  
```

## Examples queries

### Create a graph

```
curl -d "query=CREATE GRAPH <http://example.org/>" http://localhost:8080/r43ples/sparql
```

### Insert data

The created graph will be the initial commit with REVISION = 1 on the master branch (default):
Executing the following query will result in REVISION 2:
```
curl -d "query=USER \"mgraube\" MESSAGE \"test commit\" INSERT DATA { GRAPH <http://example.org/> REVISION \"master\" { <S1> <P1> <O1> .} }" http://localhost:8080/r43ples/sparql
```
You can specifiy the REVISION number, too. The following query will lead from REVISION 2 to REVISION 3:
```
curl -d "query=USER \"mgraube\" MESSAGE \"test commit\" INSERT DATA { GRAPH <http://example.org/> REVISION \"3\" { <S2> <O2> <O2> .} }" http://localhost:8080/r43ples/sparql
```

### Query data

```
curl -d "query=SELECT * WHERE { GRAPH <http://example.org/> REVISION \"2\" {?s ?p ?o }}" http://localhost:8080/r43ples/sparql
```
returns one triple
```
S1 P1 O2 .
```
and
```
curl -d "query=SELECT * WHERE { GRAPH <http://example.org/> REVISION \"3\" {?s ?p ?o }}" http://localhost:8080/r43ples/sparql
```
returns two triples:

```
S1 P1 O2 .
S2 P2 O2 .
```

For more information on branching and merging you can visit the [r43ples repository](https://github.com/plt-tud/r43ples).
