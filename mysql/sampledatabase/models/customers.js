/* jshint indent: 2 */

module.exports = function(sequelize, DataTypes) {
  return sequelize.define('customers', {
    customerNumber: {
      type: DataTypes.INTEGER(11),
      allowNull: false,
      primaryKey: true
    },
    customerName: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    contactLastName: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    contactFirstName: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    phone: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    addressLine1: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    addressLine2: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    city: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    state: {
      type: DataTypes.STRING(50),
      allowNull: true
    },
    postalCode: {
      type: DataTypes.STRING(15),
      allowNull: true
    },
    country: {
      type: DataTypes.STRING(50),
      allowNull: false
    },
    salesRepEmployeeNumber: {
      type: DataTypes.INTEGER(11),
      allowNull: true,
      references: {
        model: 'employees',
        key: 'employeeNumber'
      }
    },
    creditLimit: {
      type: DataTypes.DECIMAL,
      allowNull: true
    }
  }, {
    tableName: 'customers'
  });
};
