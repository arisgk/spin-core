/* global artifacts */
const Gitcoin = artifacts.require('./Gitcoin.sol');
const Repository = artifacts.require('./Repository.sol');

const price = 1;

module.exports = (deployer) => {
  deployer.deploy(Gitcoin, 10000).then(() =>
    deployer.deploy(Repository, Gitcoin.address, price) // eslint-disable-line comma-dangle
  );
};
