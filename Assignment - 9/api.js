const http = require("http");
const querystring = require("querystring");

const USER = {
    username: "pooja",
    password: "pooja@0000"
};

http.createServer((req, res) => {

    if (req.method === "GET" && req.url === "/") {
        res.writeHead(200, { "Content-Type": "text/html" });
        res.end(`
            <h2>Login Form</h2>
            <form method="POST" action="/login">
                Username: <input name="username"><br><br>
                Password: <input type="password" name="password"><br><br>
                <button type="submit">Login</button>
            </form>
        `);
    }

    else if (req.method === "POST" && req.url === "/login") {

        let body = "";

        req.on("data", chunk => {
            body += chunk.toString();
        });

        req.on("end", () => {

            const data = querystring.parse(body);   

            if (data.username === USER.username &&
                data.password === USER.password) {

                res.writeHead(200, { "Content-Type": "text/html" });
                res.end(`<h3>Welcome ${data.username} </h3>`);  
            } 
            else {
                res.writeHead(200, { "Content-Type": "text/html" });
                res.end("<h3>Invalid Login </h3>");
            }
        });
    }

    else {
        res.writeHead(404);
        res.end("Page Not Found");
    }

}).listen(5000, () => {
    console.log("Server running at http://localhost:5000");
});