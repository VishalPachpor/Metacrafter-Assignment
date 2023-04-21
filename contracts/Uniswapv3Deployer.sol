// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This is an interface that defines the createPool function of the Uniswap V3 factory contract.
// It is used to create a new pool with the given parameters.
interface IUniswapV3Factory {
    function createPool(
        address tokenA,
        address tokenB,
        uint24 fee
    ) external returns (address pool);
}
//This is an interface that defines the deploy function of the Uniswap V3 pool deployer contract. 
//It is used to deploy a new pool with the given parameters.
interface IUniswapV3PoolDeployer {
    function deploy(
        address factory,
        address tokenA,
        address tokenB,
        uint24 fee,
        int24 tickSpacing,
        int24 tickLower,
        int24 tickUpper,
        uint256 amount0Desired,
        uint256 amount1Desired,
        uint256 amount0Min,
        uint256 amount1Min,
        address recipient,
        uint256 deadline
    ) external returns (address pool);
}

// This is the main contract definition. 
// All the functions and variables of the contract go inside the curly braces.
contract UniswapV3PoolDeployer {
  //This declares a public variable factory of type address
  // This variable will hold the address of the Uniswap V3 factory contract.  
    address public factory; 
 // This is the constructor of the UniswapV3PoolDeployer contract. 
 // It takes an address argument _factory and sets the factory variable to that address.
    constructor(address _factory) {
        factory = _factory;
    }

    // This is a public function that deploys a new Uniswap V3 pool with the given parameters. 
    // It returns the address of the new pool.
    function deploy(
        address tokenA,
        address tokenB,
        uint24 fee,
        int24 tickSpacing,
        int24 tickLower,
        int24 tickUpper,
        uint256 amount0Desired,
        uint256 amount1Desired,
        uint256 amount0Min,
        uint256 amount1Min,
        address recipient,
        uint256 deadline
    ) external returns (address pool) {
        // This line calls the deploy function of the Uniswap V3 pool deployer contract with the given parameters.
        // It stores the resulting pool address in the pool variable.
        // and will return a pool
        pool = IUniswapV3PoolDeployer(factory).deploy(
            factory,
            tokenA,
            tokenB,
            fee,
            tickSpacing,
            tickLower,
            tickUpper,
            amount0Desired,
            amount1Desired,
            amount0Min,
            amount1Min,
            recipient,
            deadline
        );
    }
}
