var SimpleStorage = artifacts.require("./SimpleStorage.sol");
var Identities = artifacts.require("./Identities.sol");
var Documents = artifacts.require("./Documents.sol");
var Reputation = artifacts.require("./Reputation.sol");
var Collaboration = artifacts.require("./Collaboration.sol");

module.exports = function(deployer) {
  deployer.deploy(SimpleStorage);
  deployer.deploy(Identities);
  deployer.deploy(Documents);
  deployer.deploy(Reputation);
  deployer.deploy(Collaboration);
};
