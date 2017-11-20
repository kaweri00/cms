package codo.a.codo.cms;

public class Main {
    public static void main(String[] args) {
        Server server = Server.getInstance();
        server.get("/", (req, res) -> "Hello World");
    }
}