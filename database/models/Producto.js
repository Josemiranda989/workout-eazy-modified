module.exports = (sequelize, dataTypes) => {
  const alias = "Producto";

  const cols = {
    id: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    activityName: {
      type: dataTypes.STRING,
    },
    aliadoName: {
      type: dataTypes.STRING,
    },
    aliadoId: {
      type: dataTypes.INTEGER,
    },
    category: {
      type: dataTypes.STRING,
    },
    subcategory: {
      type: dataTypes.STRING,
    },
    productDescription: {
      type: dataTypes.STRING,
    },
    price: {
      type: dataTypes.DOUBLE,
    },
    discount: {
      type: dataTypes.INTEGER,
    },
    spots: {
      type: dataTypes.INTEGER,
    },
    schedule: {
      type: dataTypes.DATE,
    },
    length: {
      type: dataTypes.TIME,
    },
    image: {
      type: dataTypes.STRING,
    },
    difficulty: {
      type: dataTypes.STRING,
    },
    adress: {
      type: dataTypes.STRING,
    },
    city: {
      type: dataTypes.STRING,
    },
    age: {
      type: dataTypes.STRING,
    },
    mode: {
      type: dataTypes.STRING,
    },
  };

  const config = {
    tableName: "product",
    timestamps: false,
  };
  const Producto = sequelize.define(alias, cols, config);

Producto.associate = function (models) {
  Producto.belongsTo(models.Aliado, {
    as: "aliado",
    foreignKey: "aliadoId", // La clave foránea en la tabla 'Product' que hace referencia a 'Aliado'
  });

  Producto.belongsToMany(models.Carrito, {
    through: models.ProductsCart,
    as: "carritos",
    foreignKey: "productoId", // La clave foránea en la tabla 'ProductCart' que hace referencia a 'Product'
  });
};

  return Producto;
};
