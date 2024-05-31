const express = require("express");
const router = express.Router();
const service = require("../services/cars.services");
const multer = require("multer");
const upload = multer({ dest: "public/cars" });
const fs = require("fs");

//localhost:3000/api/cars
router.get("/", async (req, res) => {
  const cars = await service.getCars();
  res.json(cars);
});
router.get("/:id", async (req, res) => {
  const id = req.params.id;
  const car = await service.getCarById(id);
  res.json(car);
});

router.post("/", async (req, res) => {
  await service.addOrEditCar(req.body);
  console.log(req.file);
  res.status(201).send("Added Successfully");
});

module.exports = router;
