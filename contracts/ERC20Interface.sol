// pragma solidity >=0.7.0 <0.9.0;

/**
 * ERC-20 Interface
 *
 * (properties and methods should be implemented at the contract)
 */
interface IERC20 {
    // -----------------------------------
    // properties
    // -----------------------------------

    uint256 private _totalSupply; // total tokens suppply
    string private _name; // the name of the token
    string private _symbol; // the symbol of the token
    string private _decimals; // with how many decimals the token should be counted

    /**
     * hold the balances of token holders accounts
     */
    mapping(address => uint256) private _balances;

    /**
     * hold refferecne of allowed supply to spend per (owner => (spender => amount))
     */
    mapping(address => mapping(address => uint256)) private _allowances;

    // -----------------------------------
    // events
    // -----------------------------------

    /**
     * notifiy that 2 accounts transfered tokens
     */
    event Transafer(address indexed from, address indexed to, uint256 amount);

    /**
     * notifiy that account got approval to spend more tokens
     */
    event Approval(address indexed from, address indexed to, uint256 amount);

    // -----------------------------------
    // methods
    // -----------------------------------

    /**
     * set initial values once on deploy
     */
    constructor() public {
        // _symbol = "ANY";
        // _name = "Any Coin";
        // _decimals = 2;
        // _totalSupply = 100000;
        // _balances[msg.sender] = _totalSupply;
        // emit Transfer(address(0), msg.sender, _totalSupply);
    }

    /**
     * define the total tokens supply
     */
    function totalSupply() external view returns (uint256) {}

    /**
     * check balance of account single account from balances mapping
     */
    function balanceOf(address account) external view returns (uint256) {}

    /**
     * transfer tokens from the owner to the given address
     */
    function transfer(address to, uint256 amount) external returns (bool) {
        // ...
        // emit Transfer(msg.sender, to, amount);
    }

    /**
     * check the allowed supply to spend of a given owner=>spender in the
     */
    function allowance(address owner, address spender)
        external
        view
        returns (uint256)
    {}

    /**
     * approve more supply to spend for given address
     */
    function approve(address spender, uint256 amount) external returns (bool) {
        // emit Approval(msg.sender, spender, tokens);
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool) {
        // emit Transfer(sender, recipient, amount);
    }
}
