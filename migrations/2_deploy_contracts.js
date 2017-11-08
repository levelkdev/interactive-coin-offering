/* global artifacts */

const moment = require('moment')

const InteractiveCrowdsale = artifacts.require('InteractiveCrowdsale')

module.exports = function (deployer) {
  const oneMonthFromNow = moment().add(1, 'month')
  const withdrawLockThreshold = oneMonthFromNow.unix()

  deployer.deploy(
    InteractiveCrowdsale,
    withdrawLockThreshold
  )
}
