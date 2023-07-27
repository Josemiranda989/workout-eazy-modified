module.exports = (sequelize, dataTypes) => {
  const alias = "Carrito";

  const cols = {
    id: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    clienteID: { type: dataTypes.INTEGER },
    date: { type: dataTypes.DATE },
    total: { type: dataTypes.INTEGER },
  };

  const config = {
    tableName: "shoppingCart",
    timestamps: false,
  };
  const Carrito = sequelize.define(alias, cols, config);

Carrito.associate = function (models) {
     Carrito.belongsTo(models.Cliente, {
       as: "cliente",
       foreignKey: "clienteID", // La clave foránea en la tabla 'Carrito' que hace referencia a 'Cliente'
     });

     Carrito.belongsToMany(models.Producto, {
       through: models.ProductsCart,
       as: "products",
       foreignKey: "carritoId", // La clave foránea en la tabla 'ProductCart' que hace referencia a 'Carrito'
     });

};

    
  return Carrito;
};
