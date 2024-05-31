const db = require("../db");

module.exports.getCars = async () => {
  const [rows] = await db.query("SELECT * FROM cars");
  return rows;
};

module.exports.getCarById = async (id) => {
  const [rows] = await db.query("SELECT * FROM cars WHERE id = ?", [id]);
  return rows;
};

module.exports.addOrEditCar = async (obj, id = 0) => {
  const [[[{ affectedRows }]]] = await db.query(
    "CALL usp_car_add_or_edit(?, ?, ?, ?, ?, ?, ?, ?, ?)",
    [
      id,
      obj.name,
      obj.price_daily,
      obj.price_monthly,
      obj.engine,
      obj.transmission,
      obj.capacity,
      obj.fuel,
      obj.img_uri,
    ]
  );
  return affectedRows;
};
