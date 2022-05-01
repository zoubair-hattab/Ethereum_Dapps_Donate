const VolunteerContract = artifacts.require("VolunteerContract");

module.exports = function (deployer) {
  deployer.deploy(VolunteerContract);
};
