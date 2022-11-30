var DataTypes = require("sequelize").DataTypes;
var _jobs = require("./jobs");
var _jobs_r = require("./jobs_r");
var _jobs_r_jobs = require("./jobs_r_jobs");
var _jobs_users = require("./jobs_users");
var _registries = require("./registries");
var _registries_r = require("./registries_r");
var _registries_r_registries = require("./registries_r_registries");
var _services = require("./services");
var _services_r = require("./services_r");
var _services_r_services = require("./services_r_services");
var _services_users = require("./services_users");
var _users = require("./users");

function initModels(sequelize) {
  var jobs = _jobs(sequelize, DataTypes);
  var jobs_r = _jobs_r(sequelize, DataTypes);
  var jobs_r_jobs = _jobs_r_jobs(sequelize, DataTypes);
  var jobs_users = _jobs_users(sequelize, DataTypes);
  var registries = _registries(sequelize, DataTypes);
  var registries_r = _registries_r(sequelize, DataTypes);
  var registries_r_registries = _registries_r_registries(sequelize, DataTypes);
  var services = _services(sequelize, DataTypes);
  var services_r = _services_r(sequelize, DataTypes);
  var services_r_services = _services_r_services(sequelize, DataTypes);
  var services_users = _services_users(sequelize, DataTypes);
  var users = _users(sequelize, DataTypes);

  jobs.belongsToMany(jobs_r, { as: 'jobs_r_id_jobs_rs', through: jobs_r_jobs, foreignKey: "jobs_id", otherKey: "jobs_r_id" });
  jobs.belongsToMany(users, { as: 'users_id_users', through: jobs_users, foreignKey: "jobs_id", otherKey: "users_id" });
  jobs_r.belongsToMany(jobs, { as: 'jobs_id_jobs', through: jobs_r_jobs, foreignKey: "jobs_r_id", otherKey: "jobs_id" });
  registries.belongsToMany(registries_r, { as: 'registries_r_id_registries_rs', through: registries_r_registries, foreignKey: "registries_id", otherKey: "registries_r_id" });
  registries_r.belongsToMany(registries, { as: 'registries_id_registries', through: registries_r_registries, foreignKey: "registries_r_id", otherKey: "registries_id" });
  services.belongsToMany(services_r, { as: 'services_r_id_services_rs', through: services_r_services, foreignKey: "services_id", otherKey: "services_r_id" });
  services.belongsToMany(users, { as: 'users_id_users_services_users', through: services_users, foreignKey: "services_id", otherKey: "users_id" });
  services_r.belongsToMany(services, { as: 'services_id_services', through: services_r_services, foreignKey: "services_r_id", otherKey: "services_id" });
  users.belongsToMany(jobs, { as: 'jobs_id_jobs_jobs_users', through: jobs_users, foreignKey: "users_id", otherKey: "jobs_id" });
  users.belongsToMany(services, { as: 'services_id_services_services_users', through: services_users, foreignKey: "users_id", otherKey: "services_id" });
  jobs_r_jobs.belongsTo(jobs, { as: "job", foreignKey: "jobs_id"});
  jobs.hasMany(jobs_r_jobs, { as: "jobs_r_jobs", foreignKey: "jobs_id"});
  jobs_users.belongsTo(jobs, { as: "job", foreignKey: "jobs_id"});
  jobs.hasMany(jobs_users, { as: "jobs_users", foreignKey: "jobs_id"});
  services.belongsTo(jobs, { as: "job", foreignKey: "jobs_id"});
  jobs.hasMany(services, { as: "services", foreignKey: "jobs_id"});
  jobs_r_jobs.belongsTo(jobs_r, { as: "jobs_r", foreignKey: "jobs_r_id"});
  jobs_r.hasMany(jobs_r_jobs, { as: "jobs_r_jobs", foreignKey: "jobs_r_id"});
  registries_r_registries.belongsTo(registries, { as: "registry", foreignKey: "registries_id"});
  registries.hasMany(registries_r_registries, { as: "registries_r_registries", foreignKey: "registries_id"});
  registries_r_registries.belongsTo(registries_r, { as: "registries_r", foreignKey: "registries_r_id"});
  registries_r.hasMany(registries_r_registries, { as: "registries_r_registries", foreignKey: "registries_r_id"});
  services_r_services.belongsTo(services, { as: "service", foreignKey: "services_id"});
  services.hasMany(services_r_services, { as: "services_r_services", foreignKey: "services_id"});
  services_users.belongsTo(services, { as: "service", foreignKey: "services_id"});
  services.hasMany(services_users, { as: "services_users", foreignKey: "services_id"});
  services_r_services.belongsTo(services_r, { as: "services_r", foreignKey: "services_r_id"});
  services_r.hasMany(services_r_services, { as: "services_r_services", foreignKey: "services_r_id"});
  jobs_users.belongsTo(users, { as: "user", foreignKey: "users_id"});
  users.hasMany(jobs_users, { as: "jobs_users", foreignKey: "users_id"});
  registries.belongsTo(users, { as: "user", foreignKey: "users_id"});
  users.hasOne(registries, { as: "registry", foreignKey: "users_id"});
  services_users.belongsTo(users, { as: "user", foreignKey: "users_id"});
  users.hasMany(services_users, { as: "services_users", foreignKey: "users_id"});
  services_users.belongsTo(users, { as: "operator", foreignKey: "operator_id"});
  users.hasMany(services_users, { as: "operator_services_users", foreignKey: "operator_id"});

  return {
    jobs,
    jobs_r,
    jobs_r_jobs,
    jobs_users,
    registries,
    registries_r,
    registries_r_registries,
    services,
    services_r,
    services_r_services,
    services_users,
    users,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
