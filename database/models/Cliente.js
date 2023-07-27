module.exports = (sequelize, dataTypes) => {
  const alias = "Cliente";

  const cols = {
    id: {
      type: dataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    firstName: {
      type: dataTypes.STRING,
      allowNull: false,
    },
    lastName: {
      type: dataTypes.STRING,
      allowNull: false,
    },
    genre: {
      type: dataTypes.STRING,
    },
    birthDate: {
      type: dataTypes.DATE,
    },
    city: {
      type: dataTypes.STRING,
    },
    contactNumber: {
      type: dataTypes.INTEGER,
    },
    email: {
      type: dataTypes.STRING,
      allowNull: false,
    },
    avatar: {
      type: dataTypes.STRING,
    },    
    password: {
      type: dataTypes.STRING,
      allowNull: false,
    },
    condiciones: {
      type: dataTypes.STRING,
    },
    privacidad: {
      type: dataTypes.STRING,
    },
  };

  const config = {
    tableName: "cliente",
    timestamps: false,
  };

  const Cliente = sequelize.define(alias, cols, config);

  Cliente.associate = function (models) {
  // aca va la asociacion
     Cliente.hasMany(models.Carrito, {
       as: "carritos",
       foreignKey: "clienteID", // La clave foránea en la tabla 'Carrito' que hace referencia a 'Cliente'
     });
  };

  return Cliente;
};
