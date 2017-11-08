pragma solidity ^0.4.15;

contract InteractiveCrowdsale {

  uint256 public startBlockNumber;
  uint256 public withdrawLockBlockNumber;
  uint256 public endBlockNumber;

  enum Statuses { Active, Permanent } 

  mapping (address => uint256) balances;
  mapping (address => uint256) contributionValues;
  mapping (address => uint256) personalCaps;
  mapping (address => Statuses) statuses;

  function InteractiveCrowdsale(uint256 _startBlockNumber, uint256 _withdrawLockBlockNumber, uint256 _endBlockNumber) {
    // require startBlockNumber > blockNumber
    // require withdrawLockBlockNumber > startBlockNumber
    // require endBlockNumber > withdrawBlockNumber
    startBlockNumber = _startBlockNumber;
    withdrawLockBlockNumber = _withdrawLockBlockNumber;
    endBlockNumber = _endBlockNumber;
  }

  function placeBid(uint256 _personalCap) public payable {
    // require that msg.sender is inactive
    // require(msg.value > 0);
    // require(_personalCap > 0);
    // if withdraw block number exceeded, require personalCap > valuation

    // balances[msg.sender] = calcPurchaseAmount(msg.value);
    // contributionValues[msg.sender] = msg.value;
    // personalCaps[msg.sender] = _personalCap;
    // statuses[msg.sender] = Statuses.Active;
  }

  function cancelBid() {
    // require(block.number < withdrawLockBlockNumber);
    // require(statuses[msg.sender] == Statuses.Active);

    // uint256 s = blockIncrement();
    // uint256 t = withdrawLockIncrement();
    // uint256 refund = balances[msg.sender] * (t - s) / t

    // set b(A) = v(A) · s/t · p(s + (u − s)/3)
  }

  function calcPurchaseAmount(uint256 _amount) private returns(uint256) {
    // implement decreasing function based on blockNumber
    // i.e. 20% bonus at start, decreasing to 0% bonus at end
    // return amount + bonus amount
  }

  function blockIncrement() returns (uint256) {
    // return block.number - startBlockNumber;
  }

  function withdrawLockIncrement() returns (uint256) {
    // return withdrawLockBlockNumber - startBlockNumber;
  }

}
