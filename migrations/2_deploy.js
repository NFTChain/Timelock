// migrations/2_deploy.js
// SPDX-License-Identifier: MIT
const Timelock = artifacts.require("Timelock");

module.exports = async function (deployer, network, accounts) {
  await deployer.deploy(Timelock, "0xC01120c7aecA61f6cFf63aa5d3D3B180627EB625");
  await Timelock.deployed();
};
