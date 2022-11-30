const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('jobs_r_jobs', {
    jobs_r_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'jobs_r',
        key: 'id'
      }
    },
    jobs_id: {
      type: DataTypes.INTEGER.UNSIGNED,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'jobs',
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
    tableName: 'jobs_r_jobs',
    timestamps: true,
    paranoid: true,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "jobs_r_id" },
          { name: "jobs_id" },
        ]
      },
      {
        name: "fk_jobs_r_has_jobs_jobs1_idx",
        using: "BTREE",
        fields: [
          { name: "jobs_id" },
        ]
      },
      {
        name: "fk_jobs_r_has_jobs_jobs_r1_idx",
        using: "BTREE",
        fields: [
          { name: "jobs_r_id" },
        ]
      },
    ]
  });
};
