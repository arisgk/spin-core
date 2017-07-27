/* global artifacts */
const Spincoin = artifacts.require('./Spincoin.sol');
const Repository = artifacts.require('./Repository.sol');

const price = 1;

module.exports = (deployer) => {
  deployer.deploy(Spincoin, 10000).then(() =>
    deployer.deploy(Repository, Spincoin.address, price) // eslint-disable-line comma-dangle
  );
};
