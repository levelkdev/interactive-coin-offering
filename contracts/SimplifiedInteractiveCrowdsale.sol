pragma solidity ^0.4.15;

import './MintableToken.sol';
import './BasicCrowdsale.sol';
import './Ownable.sol';

contract SimplifiedInteractiveCrowdsale is BasicCrowdsale, Ownable {

    // mapping of addresses to bids organized in a mapping of maxMarketCap to value
    mapping(address => mapping(uint256 => uint256)) bids;

    bool finalized;
    uint256 finalMarktetCap;

    modifier isFinalized() {
        require(finalized);
        _;
    }

    function bid(address beneficiary, uint256 maxMarketCap) payable public {
        require(validPurchase());
        require(maxMarketCap > 0);

        bids[beneficiary][maxMarketCap].add(msg.value);
    }

    function withdrawBid(uint256 amount, uint256 maxMarketCap) public {
        require(maxMarketCap > 0);

        bids[msg.sender][maxMarketCap].sub(amount);
        msg.sender.transfer(amount);
    }

    function finalize(uint256 _finalMarktetCap) onlyOwner public {
        require(hasEnded());

        finalized = true;
        finalMarktetCap = _finalMarktetCap;
    }

    function resolveBid(uint256 maxMarketCap) isFinalized public {
        require(maxMarketCap > 0);

        if (maxMarketCap < finalMarktetCap) {
            refundBid(maxMarketCap);
        } else {
            mintTokens(maxMarketCap);
        }
    }

    function refundBid(uint256 maxMarketCap) internal {
        uint256 bidValue = bids[msg.sender][maxMarketCap];
        require(bidValue > 0);
        bids[msg.sender][maxMarketCap] = 0;
        msg.sender.transfer(bidValue);
    }

    function mintTokens(uint256 maxMarketCap) internal {
        address beneficiary = msg.sender;
        uint256 bidValue = bids[beneficiary][maxMarketCap];
        require(bidValue > 0);
        bids[beneficiary][maxMarketCap] = 0;

        // calculate token amount to be created
        uint256 tokens = bidValue.mul(rate);

        token.mint(beneficiary, tokens);
        TokenPurchase(msg.sender, beneficiary, bidValue, tokens);
    }
}
