const express = require("express");
const path = require("path");
const methodOverride = require("method-override");
const session = require("express-session");
const cookies = require("cookie-parser");
// PRUEBAS
const db = require("./database/models/");
const { sequelize } = require("./database/models");

const mainRoutes = require("./routes/mainRoutes");
const productsRoutes = require("./routes/productsRoutes");
const userRoutes = require("./routes/userRoutes");

const app = express();

app.use(express.static(path.join(__dirname, "./public")));

app.use(cookies());

app.set("view engine", "ejs");
app.set("views", [
  path.join(__dirname, "./views/main"),
  path.join(__dirname, "./views/productos"),
  path.join(__dirname, "./views/user"),
]);

const userLoggedMiddleware = require("./middlewares/userLoggedMiddleware");
const userLoggedMiddlewareAliado = require("./middlewares/aliadoLoggedMiddleware");

app.use(
  session({
    secret: "Shhh",
    resave: false,
    saveUninitialized: false,
  })
);

// --- Middlewares ---
app.use(express.static("public"));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(methodOverride("_method"));

app.use(userLoggedMiddleware);
app.use(userLoggedMiddlewareAliado);

//----routes----//
// PRUEBAS
app.get("/", async (req, res) => {
  try {
    /*  const producto = await db.Producto.create({

        activityName: "actividad",
        aliadoName: 'aliadoNombre',
        category: 'categoria',
        subcategory: 'subcategoria',
        productDescription: 'descripcion',
        price: 12,
        discount: 454,
        spots: 'cupos',
        schedule: '29/12/1945',
        length: 12,
        image: 'imagen',
        difficulty: 'dificultad',
        adress: 'direccion',
        city: 'ciudad',
        age: 12,
        mode: 'modo',
      aliadoId: 1 //Asignar el aliado correspondiente al producto
     });

     res.json(producto); */
    const producto = await db.Producto.findAll({
      where: {
        aliadoId: 1 //buscar por aliado deseado.
      }
    });

    res.json(producto);
  } catch (error) {
    res.json(error);
  }
});
app.use(mainRoutes);
app.use("/product", productsRoutes);
app.use(userRoutes);

//--- ERROR 404 ---//

app.use((req, res, next) => {
  res.status(404).render("404-error");
});

app.listen(3000, () => {
  console.log("Servidor escuchando en el puerto http://localhost:3000/");

  sequelize
    .sync({ force: false })
    .then(() => {
      console.log("DB conectada");
    })
    .catch((e) => console.log(e));
});
