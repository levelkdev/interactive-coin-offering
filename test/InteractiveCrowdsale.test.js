/* global describe test expect beforeEach */

import moment from 'moment'
import { InteractiveCrowdsale } from 'helpers/contracts'
import lkTestHelpers from 'lk-test-helpers'
import { web3 } from 'helpers/w3'

const { latestTime } = lkTestHelpers(web3)

describe('InteractiveCrowdsale', () => {
  let ics

  beforeEach(async () => {
    ics = await newInteractiveCrowdsale()
  })

  describe('when initialized', () => {
    test('should set withdrawLockThreshold', async () => {
      const expected = moment(await getLatestTime()).add(24 * 30 + 1, 'hours').unix()
      const actual = (await ics.withdrawLockThreshold.call()).toNumber()
      expect(actual).toBe(expected)
    })
  })
})

async function newInteractiveCrowdsale () {
  const withdrawLockThreshold = await defaultWithdrawLockThreshold()
  const ics = await tryAsync(InteractiveCrowdsale.new(
    withdrawLockThreshold.unix()
  ))
  return ics
}

let _latestTime // a moment() object

async function defaultWithdrawLockThreshold () {
  const blockTime = await getLatestTime()
  return moment(blockTime).add(24 * 30 + 1, 'hours')
}

async function getLatestTime () {
  if (!_latestTime) {
    _latestTime = await latestTime()
  }
  return _latestTime
}

async function tryAsync (asyncFn) {
  try {
    return await asyncFn
  } catch (err) {
    console.error(err)
  }
}
