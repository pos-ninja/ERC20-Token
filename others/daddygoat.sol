/**
 *Submitted for verification at BscScan.com on 2021-06-25
*/

/*


██████╗░░█████╗░██████╗░██████╗░██╗░░░██╗░██████╗░░█████╗░░█████╗░████████╗██╗
██╔══██╗██╔══██╗██╔══██╗██╔══██╗╚██╗░██╔╝██╔════╝░██╔══██╗██╔══██╗╚══██╔══╝██║
██║░░██║███████║██║░░██║██║░░██║░╚████╔╝░██║░░██╗░██║░░██║███████║░░░██║░░░██║
██║░░██║██╔══██║██║░░██║██║░░██║░░╚██╔╝░░██║░░╚██╗██║░░██║██╔══██║░░░██║░░░╚═╝
██████╔╝██║░░██║██████╔╝██████╔╝░░░██║░░░╚██████╔╝╚█████╔╝██║░░██║░░░██║░░░██╗
╚═════╝░╚═╝░░╚═╝╚═════╝░╚═════╝░░░░╚═╝░░░░╚═════╝░░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░╚═╝


🐐 This is a coin for GOATS! If your a Goat you’ll hodl!

🐐 DADDY GOAT is a community driven charity token that is 100% Bot protected and Whale protected, that donates to goats & to kids without dads!

🐐 UNHEARD OF TOKENOMICS! 10% is redistributed to the last 50 buyers! Out unique Reward Finance system!

🐐 We were tired of RUG PULLS so we made our own coin for the people! 100% liquidty burned 🔥 We will be having a Fair Launch Release through the Gen Tokens launchpad! 🚀

🐐 Random Airdrops once a week to holders!

🐐 Releasing NFT'S & GOATED clothing line soon which will both Only Be Bought with our Coins! More goat coins being made with different Tokenomics that will all still be connected to the Goat Fam!

Join the Goat Fam now to get in early on the Day 1 launch for DADDY GOAT! 💪🏾🐐

𝕊𝕆ℂ𝕀𝔸𝕃:
Telegram Group: https://t.me/DaddyGoatcoin
Twitter: https://twitter.com/Daddy_goat_coin
Website: https://daddygoat.net/


____ ____ _  _ ___ ____ _  _ ____ _  _ ____    _    ____ _  _ _  _ ____ _  _ ___  ____ ___  
| __ |___ |\ |  |  |  | |_/  |___ |\ | [__     |    |__| |  | |\ | |    |__| |__] |__| |  \ 
|__] |___ | \|  |  |__| | \_ |___ | \| ___]    |___ |  | |__| | \| |___ |  | |    |  | |__/ 
                                                                                            
launched at GenTokens Launchpad, Our mission is to create a safe place for people to invest in crypto tokens.

Telegram Group: https://t.me/GenTokens
Website: https://gentokens.com/

ps: if you are a developer, I hope you enjoy reading the code!

*/


// SPDX-License-Identifier: unlicensed

pragma solidity ^0.8.5;

interface IERC20 {
    
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Taxation(uint256 Liquidity, uint256 Reward, uint256 Dev, uint256 Marketing);
    event TaxationChange(uint256 Liquidity, uint256 Reward, uint256 Dev, uint256 Marketing);
    event Approval(address indexed owner, address indexed spender, uint256 value);

}


// NOTE: this is obsolete after solidity 0.8x, need to take out every line of code which uses these functions.
library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;  }
        }
        function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
            unchecked {
                require(b > 0, errorMessage);
                return a / b;
            }
        }
        function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
            unchecked {
                require(b > 0, errorMessage);
                return a % b;
            }
        }
    }


abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}


library Address {
    
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }

    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        (bool success, ) = recipient.call{ value: amount }("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
    
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
      return functionCall(target, data, "Address: low-level call failed");
    }
    
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }
    
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }
    
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(isContract(target), "Address: call to non-contract");
        (bool success, bytes memory returndata) = target.call{ value: value }(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }
    
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }
    
    function functionStaticCall(address target, bytes memory data, string memory errorMessage) internal view returns (bytes memory) {
        require(isContract(target), "Address: static call to non-contract");
        (bool success, bytes memory returndata) = target.staticcall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }


    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }
    
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(isContract(target), "Address: delegate call to non-contract");
        (bool success, bytes memory returndata) = target.delegatecall(data);
        return _verifyCallResult(success, returndata, errorMessage);
    }

    function _verifyCallResult(bool success, bytes memory returndata, string memory errorMessage) private pure returns(bytes memory) {
        if (success) {
            return returndata;
        } else {
            if (returndata.length > 0) {
                 assembly {
                    let returndata_size := mload(returndata)
                    revert(add(32, returndata), returndata_size)
                }
            } else {
                revert(errorMessage);
            }
        }
    }
}



abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () {
        _owner = _msgSender();
        emit OwnershipTransferred(address(0), _owner);
    }
    function owner() public view virtual returns (address) {
        return _owner;
    }
    
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }

}

interface IUniswapV2Factory {
    event PairCreated(address indexed token0, address indexed token1, address pair, uint);
    function feeTo() external view returns (address);
    function feeToSetter() external view returns (address);
    function getPair(address tokenA, address tokenB) external view returns (address pair);
    function allPairs(uint) external view returns (address pair);
    function allPairsLength() external view returns (uint);
    function createPair(address tokenA, address tokenB) external returns (address pair);
    function setFeeTo(address) external;
    function setFeeToSetter(address) external;
}

interface IUniswapV2Pair {
    event Approval(address indexed owner, address indexed spender, uint value);
    event Transfer(address indexed from, address indexed to, uint value);
    function name() external pure returns (string memory);
    function symbol() external pure returns (string memory);
    function decimals() external pure returns (uint8);
    function totalSupply() external view returns (uint);
    function balanceOf(address owner) external view returns (uint);
    function allowance(address owner, address spender) external view returns (uint);
    function approve(address spender, uint value) external returns (bool);
    function transfer(address to, uint value) external returns (bool);
    function transferFrom(address from, address to, uint value) external returns (bool);
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function PERMIT_TYPEHASH() external pure returns (bytes32);
    function nonces(address owner) external view returns (uint);
    function permit(address owner, address spender, uint value, uint deadline, uint8 v, bytes32 r, bytes32 s) external;
    event Mint(address indexed sender, uint amount0, uint amount1);
    event Burn(address indexed sender, uint amount0, uint amount1, address indexed to);
    event Swap(
        address indexed sender,
        uint amount0In,
        uint amount1In,
        uint amount0Out,
        uint amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);
    function MINIMUM_LIQUIDITY() external pure returns (uint);
    function factory() external view returns (address);
    function token0() external view returns (address);
    function token1() external view returns (address);
    function getReserves() external view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
    function price0CumulativeLast() external view returns (uint);
    function price1CumulativeLast() external view returns (uint);
    function kLast() external view returns (uint);
    function mint(address to) external returns (uint liquidity);
    function burn(address to) external returns (uint amount0, uint amount1);
    function swap(uint amount0Out, uint amount1Out, address to, bytes calldata data) external;
    function skim(address to) external;
    function sync() external;
    function initialize(address, address) external;
}

interface IUniswapV2Router01 {
    function factory() external pure returns (address);
    function WETH() external pure returns (address);
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountADesired,
        uint amountBDesired,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB, uint liquidity);
    function addLiquidityETH(
        address token,
        uint amountTokenDesired,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external payable returns (uint amountToken, uint amountETH, uint liquidity);
    function removeLiquidity(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETH(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountToken, uint amountETH);
    function removeLiquidityWithPermit(
        address tokenA,
        address tokenB,
        uint liquidity,
        uint amountAMin,
        uint amountBMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountA, uint amountB);
    function removeLiquidityETHWithPermit(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountToken, uint amountETH);
    function swapExactTokensForTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapTokensForExactTokens(
        uint amountOut,
        uint amountInMax,
        address[] calldata path,
        address to,
        uint deadline
    ) external returns (uint[] memory amounts);
    function swapExactETHForTokens(uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);
    function swapTokensForExactETH(uint amountOut, uint amountInMax, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapExactTokensForETH(uint amountIn, uint amountOutMin, address[] calldata path, address to, uint deadline)
        external
        returns (uint[] memory amounts);
    function swapETHForExactTokens(uint amountOut, address[] calldata path, address to, uint deadline)
        external
        payable
        returns (uint[] memory amounts);

    function quote(uint amountA, uint reserveA, uint reserveB) external pure returns (uint amountB);
    function getAmountOut(uint amountIn, uint reserveIn, uint reserveOut) external pure returns (uint amountOut);
    function getAmountIn(uint amountOut, uint reserveIn, uint reserveOut) external pure returns (uint amountIn);
    function getAmountsOut(uint amountIn, address[] calldata path) external view returns (uint[] memory amounts);
    function getAmountsIn(uint amountOut, address[] calldata path) external view returns (uint[] memory amounts);
}

interface IUniswapV2Router02 is IUniswapV2Router01 {
    function removeLiquidityETHSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline
    ) external returns (uint amountETH);
    function removeLiquidityETHWithPermitSupportingFeeOnTransferTokens(
        address token,
        uint liquidity,
        uint amountTokenMin,
        uint amountETHMin,
        address to,
        uint deadline,
        bool approveMax, uint8 v, bytes32 r, bytes32 s
    ) external returns (uint amountETH);

    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
    function swapExactETHForTokensSupportingFeeOnTransferTokens(
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external payable;
    function swapExactTokensForETHSupportingFeeOnTransferTokens(
        uint amountIn,
        uint amountOutMin,
        address[] calldata path,
        address to,
        uint deadline
    ) external;
}

contract DaddyGoat is Context, IERC20, Ownable {
    using SafeMath for uint256;
    using Address for address;

    // Tracks amount of tokens owned by each user & allowance
    mapping (address => uint256) private _balance;
    mapping (address => mapping (address => uint256)) private _allowances;

    mapping (address => bool) public _isExcludedFromFee;
    mapping (address => bool) public _isExcludedFromLimitHolder;

    // only community can buy & sell, for testing
    mapping (address => bool) public _isCommunity;
    bool public onlyCommunity = false;

    // Starts/Stops Trading
    bool public tradingOpen = false;

    //_isBlacklisted = Can not buy or sell or transfer tokens at all
    mapping (address => bool) public _isBlacklisted;  

   string private _name = "Daddy Goat";
   string private _symbol = "DDG";
   uint8 private _decimals = 9;
   uint256 private _totalSupply = 10 * 10**9 * 10**_decimals;

    struct Transaction {
        address buyer;
        uint amount;
    }
    Transaction[] public _activeBuys;

    mapping (address => bool) public _isExcludedFromRewards;

    uint256 private _maxActiveBuyers = 50;

    // Only for main fork,  //SETTHISUP, make it 0 for DaddyGoat deploy.
    // uint256 private _minBuyAmount = ( _totalSupply * 5 ) / 100000;
    uint256 private _minBuyAmount = ( _totalSupply * 1 ) / 10000;

    uint256 public _rewardFee = 10;
    uint256 public _rewardTokenStored = 0;
    uint256 public _rewardTokenTrigger = ( _totalSupply * 1 ) / 10000;

    // Cooldown & timer functionality
    bool public buyCooldownEnabled = true;
    uint256 public cooldownTimerInterval = 60;
    mapping (address => uint) private cooldownTimer;


    uint256 public _tokensBNBConvertThreshold = (_totalSupply * 5) / 1000;


    // Dev wallet
    // 0.5% perpetual dev fees to be collected
    // ok! solidity doesnt support decimals. in transfer function will ensure only half of this is taken!

    uint256 public _devFee = 1;
    address payable private _devWalletAddress = payable(0x090Ed7A8bc5D4295F83D5A872E20710c397C55b1);

    
    // setting the fees for auto LP and marketing wallet
    // made new wallet for promo, lets not put both tokens and promo in same
    uint256 public _liquidityFee = 6;
    uint256 public _marketingFee = 3;

    // giveaway gets 0.5% from dev fee wallet
    uint256 public _giveawayFee = 0;

    address payable private _marketingWalletAddress = payable(0xF209494C752D208B287cAc539BB79f5F3AeF847d);
    address private _giveawayWalletAddress = 0xffDA034d1887d9C2c3eb437FFe459500aeD2C866;
    address _burnWallet = 0x000000000000000000000000000000000000dEaD;


    // Backup variables for all 4 fees
    uint256 private _previousRewardFee = _rewardFee;
    uint256 private _previousDevFee = _devFee;
    uint256 private _previousLiquidityFee = _liquidityFee;
    uint256 private _previousMarketingFee = _marketingFee;
    uint256 private _previousGiveawayFee = _giveawayFee;
    

    // everything is now relative to total supply, no need to do maths again and again
    uint256 public _maxWalletToken = _totalSupply * 10 / 1000;
    uint256 public _maxTxAmount = _totalSupply * 5 / 1000;
    

    uint256 public _numTokensSellToAddToLiquidity = 0;
    uint256 public _numTokensSellToTriggerLiquiditySwap = (_totalSupply * 2) / 1000;
    uint256 public _liqTokenBalance = 0;

    
    
    IUniswapV2Router02 public immutable uniswapV2Router;
    address public uniswapV2Pair;

    //testnet
    //address _pcsRouter = 0x9Ac64Cc6e4415144C455BD8E4837Fea55603e5c3;

    //mainnet
    address _pcsRouter = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    bool public inSwapAndLiquify = false;
    bool public swapAndLiquifyEnabled = true;

    event MinTokensBeforeSwapUpdated(uint256 minTokensBeforeSwap);
    event SwapAndLiquifyEnabledUpdated(bool enabled);
    event SwapAndLiquify(uint256 TokensToSwap, uint256 TokensSwapped, uint256 BnbReceived);
    event SwapAndLiquifyTriggered(uint256 NumTokensSellToTriggerLiquiditySwap, uint256 LiqTokenBalance, uint256 NumTokensSellToAddToLiquidity);

    modifier lockTheSwap {
        inSwapAndLiquify = true;
        _;
        inSwapAndLiquify = false;
    }
    
    constructor () {

        //IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(0x10ED43C718714eb63d5aA57B78B54704E256024E);
        //testnet address from bsc.kiemtienonline360.com
        IUniswapV2Router02 _uniswapV2Router = IUniswapV2Router02(_pcsRouter);

        uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory()).createPair(address(this), _uniswapV2Router.WETH());
        uniswapV2Router = _uniswapV2Router;

        _isExcludedFromFee[owner()] = true;
        _isExcludedFromFee[address(this)] = true;
        _isExcludedFromFee[address(0x000000000000000000000000000000000000dEaD)] = true;
        _isExcludedFromFee[_devWalletAddress] = true;
        _isExcludedFromFee[_marketingWalletAddress] = true;
        _isExcludedFromFee[_giveawayWalletAddress] = true;

        _isExcludedFromRewards[owner()] = true;
        _isExcludedFromRewards[address(this)] = true;
        _isExcludedFromRewards[address(0x000000000000000000000000000000000000dEaD)] = true;

        // sucks for them! they cant compete in rewards!
        _isExcludedFromRewards[_devWalletAddress] = true;
        _isExcludedFromRewards[_marketingWalletAddress] = true;
        _isExcludedFromRewards[_giveawayWalletAddress] = true;

        _isCommunity[_devWalletAddress] = true;
        _isCommunity[_marketingWalletAddress] = true;
        _isCommunity[_giveawayWalletAddress] = true;
        _isCommunity[owner()] = true;
        _isCommunity[_pcsRouter] = true;
        _isCommunity[uniswapV2Pair] = true;
        
        _balance[owner()] = _totalSupply;

        emit Transfer(address(0), owner(), _totalSupply);
    }
    function ___tokenInfo () public view returns(
        uint256 Decimals,
        uint256 MaxTxAmount,
        uint256 MaxWalletToken,
        uint256 TotalSupply,
        address OwnerAddress,
        bool TradingOpen,
        bool OnlyCommunity
        ) {
        return (_decimals, _maxTxAmount, _maxWalletToken, _totalSupply, owner(), tradingOpen, onlyCommunity );
    }

    function ___feesInfo () public view returns(
        uint256 RewardFee,
        uint256 RewardTokensStored,
        uint256 RewardTokenTrigger,
        uint256 Liquidity_Fee,
        uint256 NumTokensSellToAddToLiquidity,
        uint256 NumTokensToTriggerLiquidity,
        uint256 LiquidityTokenBalance,
        uint256 contractTokenBalance
        ) {
        return (_rewardFee, _rewardTokenStored, _rewardTokenTrigger,
            _liquidityFee, _numTokensSellToAddToLiquidity, _numTokensSellToTriggerLiquiditySwap, _liqTokenBalance, balanceOf(address(this)));
    }

    // dev wallet fees is 0.5%, stupid solidity doesnt have decimals!
    function ___wallets () public view returns(

        uint256 Marketing_Fee,
        uint256 Giveaway_Fee,
        uint256 Dev_Fee,
        address Marketing_Wallet_Address,
        address Dev_Wallet_Address,
        address Giveaway_Wallet_Address,
        uint256 Tokens_BNB_Convert_Threshold
        ) {
        return ( _marketingFee, _giveawayFee, _devFee, _marketingWalletAddress, _devWalletAddress, _giveawayWalletAddress, _tokensBNBConvertThreshold);
    }

    
    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function decimals() public view returns (uint8) {
        return _decimals;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view override returns (uint256) {
        return _balance[account];
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function allowance(address owner, address spender) public view override returns (uint256) {
        return _allowances[owner][spender];
    }

    function approve(address spender, uint256 amount) public override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) public override returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].sub(amount, "ERC20: transfer amount exceeds allowance"));
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(addedValue));
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(subtractedValue, "ERC20: decreased allowance below zero"));
        return true;
    }
   
    //set Only Community  Members 
    function setonlyCommunity(bool _status) public onlyOwner {
        onlyCommunity = _status;
    }
    
    //switch Trading
    function tradingStatus(bool _status) public onlyOwner {
        tradingOpen = _status;
    }

    // enable cooldown between trades
    function cooldownEnabled(bool _status, uint256 _interval) public onlyOwner {
        buyCooldownEnabled = _status;
        cooldownTimerInterval = _interval;
    }


    // convert all stored tokens for LP into LP Pairs
    function convertLiquidityBalance(uint256 tokensToConvert) public onlyOwner {

        if(tokensToConvert == 0){
            tokensToConvert = _liqTokenBalance;
        } else if(tokensToConvert > _liqTokenBalance){
            tokensToConvert = _liqTokenBalance;
        }
            swapAndLiquify(tokensToConvert);
            _liqTokenBalance = _liqTokenBalance - tokensToConvert;

            emit SwapAndLiquifyTriggered( _numTokensSellToTriggerLiquiditySwap, _liqTokenBalance, tokensToConvert);
        }

        // so 1.25million stuck in safemoon like contracts dont die!
        function recoverContractBNB() public onlyOwner{
            if(address(this).balance > 0){
                sendToMarketingWallet(address(this).balance);
            }
        }

        // this might not work, since impact of selling all tokens would be too much on price
        function purgeBalance() public onlyOwner{

            uint256 contractTokenBalance = _balance[address(this)];
            if(contractTokenBalance > 0){
                _liqTokenBalance=0;
                _rewardTokenStored=0;
                swapTokensForEth(contractTokenBalance);
            }

            if(address(this).balance > 0){
                sendToMarketingWallet(address(this).balance);
            }

        }


    function setAllTriggers( 
        bool CHANGE_rewardTokenTrigger, uint256 _rewardTokenTriggerUpdate,
        bool CHANGE_numTokensSellToTriggerLiquiditySwap, uint256 _numTokensSellToTriggerLiquiditySwapUpdate,
        bool CHANGE_tokensBNBConvertThreshold, uint256 _tokensBNBConvertThresholdUpdate
        ) external onlyOwner() {
        

        if(CHANGE_rewardTokenTrigger){
            _rewardTokenTrigger = _rewardTokenTriggerUpdate;
        }
        if(CHANGE_numTokensSellToTriggerLiquiditySwap){
            _numTokensSellToTriggerLiquiditySwap = _numTokensSellToTriggerLiquiditySwapUpdate;
        }
        if(CHANGE_tokensBNBConvertThreshold){
            _tokensBNBConvertThreshold = _tokensBNBConvertThresholdUpdate;
        }

    }


    function setNumTokensSellToAddToLiquidity(uint256 tokens) external onlyOwner() {
        _numTokensSellToAddToLiquidity = tokens;
    }

    function setNumTokensSellToTriggerLiquidity(uint256 tokens) external onlyOwner() {
        _numTokensSellToTriggerLiquiditySwap = tokens;
    }

    function changeMarketingWallet (address newWallet) external onlyOwner() {
        _marketingWalletAddress = payable(newWallet);
        _isExcludedFromFee[newWallet] = true;
    }

    function changeGiveawayWallet (address newWallet) external onlyOwner() {
        _giveawayWalletAddress = payable(newWallet);
        _isExcludedFromFee[newWallet] = true;
    }
    
    function changeDevWallet (address newWallet) external onlyOwner() {
        _devWalletAddress = payable(newWallet);
        _isExcludedFromFee[_devWalletAddress] = true;
    }

   
    //set the Max transaction amount (percent of total supply)
    function setMaxTxPercent(uint256 maxTxPercent) external onlyOwner() {
        _maxTxAmount = _totalSupply.mul(maxTxPercent).div(
            10**2
        );
    }
    
    //set the Max transaction amount (in tokens)
     function setMaxTxTokens(uint256 maxTxTokens) external onlyOwner() {
        _maxTxAmount = maxTxTokens;
    }
    

    //setting the maximum permitted wallet holding (percent of total supply)
     function setMaxWalletPercent(uint256 maxWallPercent) external onlyOwner() {
        _maxWalletToken = _totalSupply.mul(maxWallPercent).div(
            10**2
        );
    }
    
    //setting the maximum permitted wallet holding (in tokens)
     function setMaxWalletTokens(uint256 maxWallTokens) external onlyOwner() {
        _maxWalletToken = maxWallTokens;
    }
    
 
    //toggle on and off to activate auto liquidity and the promo wallet 
    function setSwapAndLiquifyEnabled(bool _enabled) public onlyOwner {
        swapAndLiquifyEnabled = _enabled;
        emit SwapAndLiquifyEnabledUpdated(_enabled);
    }
    
    //receive BNB from PancakeSwap Router
    receive() external payable {}


    
 /** All list management functions BEGIN*/

    function manageLimitHolder(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isExcludedFromLimitHolder[addresses[i]] = status;
        }
    }

    function manageExcludeFromFee(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isExcludedFromFee[addresses[i]] = status;
        }
    }

    function manageCommunity(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isCommunity[addresses[i]] = status;
        }
    }

    function manageBlacklist(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isBlacklisted[addresses[i]] = status;
        }
    }

    function excludeFromFee(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isExcludedFromFee[addresses[i]] = status;
        }
    }
    
    function excludeFromLimitHolder(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isExcludedFromLimitHolder[addresses[i]] = status;
        }
    }

    function excludeFromRewards(address[] calldata addresses, bool status) external onlyOwner {
        for (uint256 i; i < addresses.length; ++i) {
            _isExcludedFromRewards[addresses[i]] = status;
        }
    }

    /** All list management functions END*/





/* reward finance START 

             ,--._,--.
           ,'  ,'   ,-`.
(`-.__    /  ,'   /
 `.   `--'        \__,--'-.
   `--/       ,-.  ______/
     (o-.     ,o- /
      `. ;        \
       |:          \
      ,'`       ,   \
     (o o ,  --'     :
      \--','.        ;
       `;;  :       /
 -hrr-  ;'  ;  ,' ,'
        ,','  :  '
        \ \   :

ps: have a long documentation available for these functions :)
*/


 //set the Max transaction amount (in tokens)
function setMaxActiveBuyers(uint256 maxActBuyer) external onlyOwner() {

    require(maxActBuyer >= 10,"Cannot have Max Active Buyers set to less than 10");
    require(maxActBuyer < 101,"Cannot update to a high number, gas required for each iteration will fail the transaction");

    // finish any pending rewards before updating
    rewardBuyers();
    _maxActiveBuyers = maxActBuyer;
    
    while(_activeBuys.length > maxActBuyer){
        _activeBuys.pop();
    }

}
    


function _takeReward(uint256 rewardFees) private {
    _balance[address(this)] = _balance[address(this)] + rewardFees;
    _rewardTokenStored = _rewardTokenStored + rewardFees;
    if(_rewardTokenStored > _rewardTokenTrigger){
        rewardBuyers();
    }
}


// Distribute rewards to all buyers
function rewardBuyers() private {
    uint256 rewardTokensToGive = _rewardTokenStored;
    uint256 rewardAmount;

    uint256 totalActiveBuyValue = 0;
    
    for(uint8 i=0; i < _activeBuys.length; i++){
        totalActiveBuyValue = totalActiveBuyValue + _activeBuys[i].amount;
    }

    for(uint8 i=0; i < _activeBuys.length; i++){
        
        rewardAmount =  _rewardTokenStored * _activeBuys[i].amount / totalActiveBuyValue;

        if(rewardTokensToGive < rewardAmount){
            rewardAmount = rewardTokensToGive;
            rewardTokensToGive = 0;
        }
        
        _balance[_activeBuys[i].buyer] = _balance[_activeBuys[i].buyer] + rewardAmount;  

        rewardTokensToGive = rewardTokensToGive - rewardAmount;

  //      emit Transfer(address(this),_activeBuys[i].buyer,rewardAmount);
        
    }
    _balance[address(this)] = _balance[address(this)] - _rewardTokenStored + rewardTokensToGive;
    _rewardTokenStored = rewardTokensToGive;
}



function newBuy(address buyerAddress, uint256 purchaseAmount) private {

    if(_activeBuys.length > _maxActiveBuyers){

        for(uint i=0; i < _activeBuys.length -1; i++){
            _activeBuys[i] = _activeBuys[i+1];
        }

        //remove last element
        _activeBuys.pop();
        }
    _activeBuys.push(Transaction({buyer: buyerAddress, amount: purchaseAmount}));

}





 function makeItRain(address wallet, uint256 fundPercentage, address[] calldata addresses, bool isLifeFair) external  {

    require ((msg.sender==owner() ||  msg.sender==wallet), "Only owner or wallet owner, you can only make it rain from own wallet!");
    //wallet = msg.sender;

    uint256 showerCapacity = _balance[wallet] * fundPercentage / 100;
    if(fundPercentage > 100){
        showerCapacity = _balance[wallet];
    }
    _balance[wallet] = _balance[wallet] - showerCapacity;
    uint rainAmount;

    if(!isLifeFair){

        // Distribution based on wallet holding, works like reflections
        uint256 totalHolding;
        
        for(uint i=0; i < addresses.length; i++){
            totalHolding = totalHolding + _balance[addresses[i]];
        }

        for(uint i=0;i<addresses.length; i++){
            rainAmount = showerCapacity * _balance[addresses[i]] / totalHolding;
            _balance[addresses[i]] = _balance[addresses[i]] + rainAmount;
            emit Transfer(wallet, addresses[i], rainAmount);
        }
    } else{

            // Everyone gets equal share! Life is fair
            rainAmount = showerCapacity / addresses.length;

            for(uint i=0;i<addresses.length; i++){
                _balance[addresses[i]] = _balance[addresses[i]] + rainAmount;
                emit Transfer(wallet, addresses[i], rainAmount);
            }
        }
}


/* reward finance END */





// Fees calculation functions
    
    function _takeLiquidity(uint256 liquidityFees) private {
        _balance[address(this)] = _balance[address(this)] + liquidityFees;
        _liqTokenBalance = _liqTokenBalance + liquidityFees;
    }
    
    function _takeDevFees(uint256 devFees) private {
        _balance[_devWalletAddress] = _balance[_devWalletAddress] + devFees;
        emit Transfer(_msgSender(), _devWalletAddress, devFees);
        
    }

    function _takeMarketingFees(uint256 marketingFees) private {

        _balance[_marketingWalletAddress] = _balance[_marketingWalletAddress] + marketingFees;
        emit Transfer(_msgSender(), _marketingWalletAddress, marketingFees);
    }

    function _takeGiveawayFees(uint256 giveawayFees) private {
        
        _balance[_giveawayWalletAddress] = _balance[_giveawayWalletAddress] + giveawayFees;
        emit Transfer(_msgSender(), _giveawayWalletAddress, giveawayFees);
    }


    function _setAllFees(uint256 marketingFee, uint256 devFees, uint256 liquidityFees, uint256 rewardFees, uint256 giveawayFee) private {
        _rewardFee = rewardFees;
        _devFee = devFees;
        _liquidityFee = liquidityFees;
        _marketingFee = marketingFee;
        _giveawayFee = giveawayFee;
    }

    // set all fees in one go, we dont need 4 functions!
    function setAllFees(uint256 marketingFee, uint256 devFees, uint256 liquidityFees, uint256 rewardFees, uint256 giveawayFee) external onlyOwner() {
        _setAllFees(marketingFee, devFees, liquidityFees, rewardFees, giveawayFee);
    }

    function setRewardMinBuyAmount(uint256 _amount) external onlyOwner(){
        _minBuyAmount = _amount;
    }

    
    function removeAllFee() private {
        _previousRewardFee = _rewardFee;
        _previousDevFee = _devFee;
        _previousLiquidityFee = _liquidityFee;
        _previousMarketingFee = _marketingFee;
        _previousGiveawayFee = _giveawayFee;
        
        _setAllFees(0,0,0,0,0);
    }
    
    function restoreAllFee() private {
        _setAllFees(_previousMarketingFee,_previousDevFee,_previousLiquidityFee,_previousRewardFee,_previousGiveawayFee);
    }
    

    function _approve(address owner, address spender, uint256 amount) private {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }
    
     function sendToMarketingWallet(uint256 amount) private {
            _marketingWalletAddress.transfer(amount);
        }


//  Separated Liquidity from promo wallet transaction
     function swapAndLiquify(uint256 tokensToSwap) private lockTheSwap {
        uint256 tokensHalf = tokensToSwap/2;

        uint256 contractBnbBalance = address(this).balance;

        swapTokensForEth(tokensHalf);
        
        uint256 bnbSwapped = address(this).balance - contractBnbBalance;

        addLiquidity(tokensHalf,bnbSwapped);

        emit SwapAndLiquify(tokensToSwap, tokensHalf, bnbSwapped);
    }


    function swapTokensForEth(uint256 tokenAmount) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function swapTokensForEthAndDeliver(uint256 tokenAmount, address payable _receiver) private {
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = uniswapV2Router.WETH();
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            _receiver,
            block.timestamp+120
        );
    }



    function addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        _approve(address(this), address(uniswapV2Router), tokenAmount);
        uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            _burnWallet,
            block.timestamp
        );
    }




/* For convering wallet balances to BNB for Marketing & Dev */

    function genBNBExchange(address sender, uint256 tokensThreshold, address payable receiver) private {
        

        uint256 tokensToChange = _balance[sender];
        //only a check, if its zero then dont convert, also dont throw error, lets not break other functions
        if(tokensToChange > tokensThreshold){

            _balance[address(this)] += tokensToChange;
            _balance[sender] = 0;
            emit Transfer(sender,address(this),tokensToChange);
            swapTokensForEthAndDeliver(tokensToChange, receiver);
        }
    }



// Transfer functions begin
 function _transfer(
        address from,
        address to,
        uint256 amount
    ) private {
        
        
        //limits the amount of tokens that each person can hold in total
        if (to != owner() && 
            to != address(this)  && 
            to != address(0x000000000000000000000000000000000000dEaD) && 
            to != uniswapV2Pair && 
            to != _devWalletAddress &&
            !_isExcludedFromLimitHolder[to] && 
            !_isExcludedFromLimitHolder[from]) {
            uint256 heldTokens = balanceOf(to);
            require((heldTokens + amount) <= _maxWalletToken,"Total Holding is currently limited, you can not buy that much.");
            
        }

         if(from != owner()){
            require(tradingOpen,"Trading not open yet");
        }
        
        //if onlyCommunity is set to true, then only people that have been approved as part of the community can buy 
        if (onlyCommunity && (from != owner() || from != uniswapV2Pair)){
        require(_isCommunity[to], "Only Community Can Buy! Trading not open yet");}

        
        // cooldown timer, so a bot doesnt do quick trades! 5min gap between 2 trades. you are welcome.
        if (from == uniswapV2Pair &&
            buyCooldownEnabled &&
            !_isExcludedFromFee[to] &&
            to != address(this)  && 
            to != address(0x000000000000000000000000000000000000dEaD)) {
            require(cooldownTimer[to] < block.timestamp,"Please wait for cooldown between buys");
            cooldownTimer[to] = block.timestamp + cooldownTimerInterval;
        }
       
        //blacklisted addreses can not buy! If you have ever used a bot, or scammed anybody, then you're wallet address will probably be blacklisted
        require(!_isBlacklisted[from] && !_isBlacklisted[to], "This address is blacklisted");
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(amount > 0, "Transfer amount must be greater than zero");
        
        //limit the maximum number of tokens that can be bought or sold in one transaction
        if(from != owner() && to != owner() &&  !_isExcludedFromLimitHolder[to] && !_isExcludedFromLimitHolder[from])
            require(amount <= _maxTxAmount, "Transfer amount exceeds the maxTxAmount.");

        if (
            _liqTokenBalance >= _numTokensSellToTriggerLiquiditySwap &&
            !inSwapAndLiquify &&
            from  != uniswapV2Pair &&
            swapAndLiquifyEnabled
        ) {
    
            emit SwapAndLiquifyTriggered( _numTokensSellToTriggerLiquiditySwap, _liqTokenBalance, _numTokensSellToAddToLiquidity);

            if(_numTokensSellToAddToLiquidity == 0){
                swapAndLiquify(_liqTokenBalance);    
                _liqTokenBalance = 0;
            } else{
                swapAndLiquify(_numTokensSellToAddToLiquidity);
                _liqTokenBalance = _liqTokenBalance - _numTokensSellToAddToLiquidity;
            }
            
        }


        if (from != uniswapV2Pair && !inSwapAndLiquify){
            //check threshhold and convert
            genBNBExchange(_devWalletAddress,_tokensBNBConvertThreshold, _devWalletAddress);
            genBNBExchange(_marketingWalletAddress, _tokensBNBConvertThreshold, _marketingWalletAddress);
        }

        bool takeFee = true;
        if(_isExcludedFromFee[from] || _isExcludedFromFee[to]){
              removeAllFee();
              takeFee = false;
        }
        
        _transferStandard(from, to, amount);

        if(!takeFee){
            restoreAllFee();    
        }
    }



    function _transferStandard(address sender, address recipient, uint256 transferAmount) private {

        uint256 rewardFee = transferAmount * _rewardFee / 100;
        uint256 liquidityFee = transferAmount * _liquidityFee / 100;
        uint256 marketingFee = transferAmount * _marketingFee / 100;

        //hardcoded this, since solidity doesnt support fractions. 0.5% goes to dev, other 0.5% is added to giveaway fees
        uint256 devFee = transferAmount * _devFee / 200;
        uint256 giveawayFees = transferAmount * _giveawayFee / 100 + devFee;
        

        uint256 transferAmountTaxed = transferAmount - rewardFee - liquidityFee - devFee - marketingFee;

        // rewards bsaed on actual amount which goes to wallet, thou it wont
        // matter much as its only a percentage
        if(!_isExcludedFromRewards[recipient] && sender == uniswapV2Pair){
            if(transferAmount > _minBuyAmount){
                newBuy(recipient,transferAmountTaxed);    
            }
        }

        _balance[sender] = _balance[sender] - transferAmount;
        _balance[recipient] = _balance[recipient] + transferAmountTaxed;

        _takeLiquidity(liquidityFee);
        _takeDevFees(devFee);
        _takeMarketingFees(marketingFee);
        _takeGiveawayFees(giveawayFees);
        _takeReward(rewardFee);

        emit Transfer(sender, recipient, transferAmount);
    }





}
// yes, we too have 5 empty lines at bottom of contract. if you love the code and understood the reference, hit us on gentokens TG, @monkey_shanti