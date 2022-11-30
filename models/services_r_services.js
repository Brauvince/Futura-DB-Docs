const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('services_r_services', {
    services_r_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'services_r',
        key: 'id'
      }
    },
    services_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'services',
        key: 'id'
      }
    },
    value_str: {
      type: DataTypes.STRING(255),
      allowNull: true
    },
    value_int: {
      type: DataTypes.INTEGER,
      allowNull: true
    },
    value_bool: {
      type: DataTypes.TINYINT,
      allowNull: true
    },
    value_date: {
      type: DataTypes.DATE,
      allowNull: true
    },
    value_txt: {
      type: DataTypes.TEXT,
      allowNull: true
    }
  }, {
    sequelize,
    tableName: 'services_r_services',
    timestamps: true,
    paranoid: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "services_r_id" },
          { name: "services_id" },
        ]
      },
      {
        name: "fk_services_r_has_services_services1_idx",
        using: "BTREE",
        fields: [
          { name: "services_id" },
        ]
      },
      {
        name: "fk_services_r_has_services_services_r1_idx",
        using: "BTREE",
        fields: [
          { name: "services_r_id" },
        ]
      },
    ]
  });
};
