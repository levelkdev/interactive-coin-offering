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
    // require(_startBlockNumber > block.number);
    // require(_withdrawLockBlockNumber > _startBlockNumber);
    // require(_endBlockNumber > _withdrawBlockNumber);
    startBlockNumber = _startBlockNumber;
    withdrawLockBlockNumber = _withdrawLockBlockNumber;
    endBlockNumber = _endBlockNumber;
  }

  function placeBid(uint256 _personalCap) public payable {
    // require that msg.sender is inactive
    // require(msg.value > 0);
    // require(_personalCap > 0);
    // if withdraw block number exceeded, require personalCap > valuation

    // balances[msg.sender] = msg.value * purchasePower(msg.value);
    // contributionValues[msg.sender] = msg.value;
    // personalCaps[msg.sender] = _personalCap;
    // statuses[msg.sender] = Statuses.Active;
  }

  function cancelBid() public {
    // require(block.number < withdrawLockBlockNumber);
    // require(statuses[msg.sender] == Statuses.Active);

    // uint256 s = blockIncrement();
    // uint256 t = withdrawLockBlockIncrement();
    // uint256 u = endBlockIncrement();
    // uint256 v = contributionValues[msg.sender];
    // uint256 refund = balances[msg.sender] * (t - s) / t;

    // statuses[msg.sender] = Statuses.Permanent;
    // balances[msg.sender] = v * s / t * purchasePower(s + (u - 2) / 3);
    // transfer refund to msg.sender
  }

  function purchasePower(uint256 _amount) private returns(uint256) {
    // implement decreasing function based on block number
    // i.e. 1.2 at start, 1.1 at withdraw threshold, and 1 at end
    // return p
  }

  function blockIncrement() private returns (uint256) {
    return block.number - startBlockNumber;
  }

  function withdrawLockBlockIncrement() private returns (uint256) {
    return withdrawLockBlockNumber - startBlockNumber;
  }

  function endBlockIncrement() private returns (uint256) {
    return endBlockNumber - startBlockNumber;
  }

}
