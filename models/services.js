const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('services', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true
    },
    label: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: "label_UNIQUE"
    },
    price: {
      type: DataTypes.FLOAT,
      allowNull: true
    },
    jobs_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      references: {
        model: 'jobs',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'services',
    timestamps: true,
    paranoid: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "label_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "label" },
        ]
      },
      {
        name: "id_UNIQUE",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "fk_services_jobs1_idx",
        using: "BTREE",
        fields: [
          { name: "jobs_id" },
        ]
      },
    ]
  });
};
