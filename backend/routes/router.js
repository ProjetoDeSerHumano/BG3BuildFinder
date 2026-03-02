const express = require("express");
const routerApp = express.Router();

const appBuilds = require("../apps/controller/ctlBuilds.js");

routerApp.use((req, res, next) => {
  next();
});

routerApp.get("/", (req, res) => {
  res.send("API do Sistema BG3 Build Finder (Backend) está online.");
});

routerApp.get("/getAllBuilds", appBuilds.getAllBuilds);


module.exports = routerApp;