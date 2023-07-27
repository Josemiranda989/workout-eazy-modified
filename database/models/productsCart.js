module.exports = (sequelize, dataTypes) => {
  const alias = "ProductsCart";

  const cols = {
    quantity: {
      type: dataTypes.INTEGER,
    },
    date: {
      type: dataTypes.DATE,
      allowNull: false,
    },
  };

  const config = {
    tableName: "productsCart",
    timestamps: false,
  };

  const ProductsCart = sequelize.define(alias, cols, config);

  ProductsCart.associate = function (models) {
    ProductsCart.belongsTo(models.Carrito, {
      as: "carrito",
      foreignKey: "carritoId", // La clave foránea en la tabla 'ProductCart' que hace referencia a 'Carrito'
    });

    ProductsCart.belongsTo(models.Producto, {
      as: "producto",
      foreignKey: "productoId", // La clave foránea en la tabla 'ProductCart' que hace referencia a 'Producto'
    });
  };

  return ProductsCart;
};
