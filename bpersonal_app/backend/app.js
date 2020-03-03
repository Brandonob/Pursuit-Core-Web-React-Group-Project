const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

const usersRouter = require("./routes/users");

app.use("/users", usersRouter);

app.get("/", (req, res) => {
  res.json({
    random: "this is a GET"
  });
});

app.post("/", (req, res) => {
  res.json({
    random: "this is a POST"
  });
});

app.listen(port, () => {
  console.log("App is listening on port", port);
});