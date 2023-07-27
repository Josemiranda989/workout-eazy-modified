module.exports = (sequelize, dataTypes) => {
    const alias = 'Aliado'

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
        aliadoProfile: {
            type: dataTypes.STRING,
            allowNull: false,
        },
        entityName: {
            type: dataTypes.STRING,
            allowNull: true,
        },
        genre: {
            type: dataTypes.STRING,
        },
        services: {
            type: dataTypes.STRING,
            allowNull: false
        },
        document: {
            type: dataTypes.STRING,
            allowNull: false
        },
        documentNumber: {
            type: dataTypes.INTEGER,
            allowNull: false
        },
        birthDate: {
            type: dataTypes.DATE,
        },
        servicesCity: {
            type: dataTypes.STRING,
            allowNull: false
        },
        contactNumber: {
            type: dataTypes.INTEGER,
            allowNull: false
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
        rol: {
            type: dataTypes.STRING,
        },
    };

    const config = {
        tableName: "aliado",
        timestamps: false,
    };

    const Aliado = sequelize.define(alias, cols, config);

    Aliado.associate = function (models) { 
        // Aquí va la asociación
          Aliado.hasMany(models.Producto, {
            as: 'products',
            foreignKey: 'aliadoId', // La clave foránea en la tabla 'Product' que hace referencia a 'Aliado'
          });
        };
    

    return Aliado;
};