const express = require("express");
const app = express();
const path = require("path");
const bodyParser = require("body-parser");
require("express-async-errors");
const db = require("./db");
carRoutes = require("./controllers/cars.controller");

//middleware
app.use(express.static("public"));
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "index.html"));
});
app.get("/admin/listing", (req, res) => {
  res.sendFile(path.join(__dirname, "admin.html"));
});

app.use("/api/cars", carRoutes);
app.use((err, req, res, next) => {
  console.error(err);
  res.status(err.status || 500).send("Something went wrong");
});

const PORT = process.env.PORT || 3000;

db.query("SELECT 1")
  .then(() => {
    console.log("Connected to MySQL");
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  })
  .catch((err) => console.error(err));
