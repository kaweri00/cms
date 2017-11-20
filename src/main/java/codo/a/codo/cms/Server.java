package codo.a.codo.cms;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Server extends spark.Spark {
    private static Server instance = null;
    int maxThreads = 8;
    int minThreads = 2;
    int timeOutMillis = 30000;
    int port = 8080;
    protected Server() {
        port(port);

        Logger log = LoggerFactory.getLogger(Server.class);

        threadPool(maxThreads, minThreads, timeOutMillis);

        before("/*", (q, a) -> log.info("Received api call for: " + q.pathInfo()));

        after((request, response) -> {
            response.header("Content-Encoding", "gzip");
        });
    }
    public static Server getInstance() {
        if(instance == null) {
            instance = new Server();
        }
        return instance;
    }
}