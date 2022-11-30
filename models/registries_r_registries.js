const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('registries_r_registries', {
    registries_r_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      comment: "PRIMARY KEY (anagrafiche_r_id, users_id));",
      references: {
        model: 'registries_r',
        key: 'id'
      }
    },
    registries_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'registries',
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
    tableName: 'registries_r_registries',
    timestamps: true,
    paranoid: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "registries_r_id" },
          { name: "registries_id" },
        ]
      },
      {
        name: "fk_registries_r_registries_registries_r1_idx",
        using: "BTREE",
        fields: [
          { name: "registries_r_id" },
        ]
      },
      {
        name: "fk_registries_r_registries_registries1_idx",
        using: "BTREE",
        fields: [
          { name: "registries_id" },
        ]
      },
    ]
  });
};
