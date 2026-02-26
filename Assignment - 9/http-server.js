const http = require("http");

const server = http.createServer((req, res) => {
    res.writeHead(200, { "Content-Type": "text/html" });

    res.write(`
        <h1>Welcome to My Node.js Website</h1>
        <p>This is a simple HTTP Server Page.</p>
        <p>Created by Pooja</p>
    `);

    res.end();
});

server.listen(3000, () => {
    console.log("Server running at http://localhost:3000");
});