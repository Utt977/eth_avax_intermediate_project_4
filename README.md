# eth_avax_intermediate_project_4
This is project 4 of eth avax intermediate course of module 4.

# eth_avax_intermediate_project_4 - DegenGamingToken
   DegenGamingToken is an ERC-20 compliant token with additional functionalities tailored for gaming purposes. The contract allows for token minting, transferring, burning, and redeeming. It also includes a transfer fee feature and a cap on the total supply.

## Getting Started

### Prerequisites
Solidity Compiler - Ensure you have a Solidity compiler installed to compile and deploy the contract.

## Features
- Minting new tokens (only the owner can mint).
- Transferring tokens with a transfer fee (if enabled).
- Redeeming tokens for in-game items.
- Checking token balance.
- Burning tokens.
- Setting the transfer fee (only the owner can set).
- Changing the fee recipient (only the owner can change).
- Minting tokens with restrictions (only the owner can mint).
- Checking if the transfer fee is enabled.
- Getting the current fee recipient address.
- Getting the total supply cap.

## Functionality
Here's a brief overview of the key functions provided by the contract:

- `mintTokens`: The contract owner can mint new tokens and send them to a specified address.
- `transferTokens`: Users can transfer tokens to another address. If a transfer fee is enabled, a portion of the tokens will be sent to the fee recipient.
- `redeemTokens`: Users can burn tokens to receive in-game items.
- `getTokenBalance`: Users can check their token balance.
- `burnTokens`: Users can burn tokens to decrease the total supply.
- `setTransferFee`: The contract owner can set a transfer fee in basis points (0.01% or less).
- `changeFeeRecipient`: The contract owner can change the fee recipient's address.
- `mintWithRestrictions`: The contract owner can mint tokens with release time and supply cap restrictions.
- `isTransferFeeEnabled`: Check if the transfer fee is enabled.
- `getFeeRecipient`: Get the current fee recipient address.
- `totalSupplyCap`: Get the total supply cap.

## How to Execute on Remix IDE

1. Open Remix IDE: Go to https://remix.ethereum.org/ to access the Remix IDE.
2. Create a New File: Click on the "+" icon in the file explorer panel on the left side to create a new file. Save the file with a .sol extension, for example, DegenGamingToken.sol.
3. Copy and Paste the Solidity Code: Copy the provided Solidity code for the DegenGamingToken contract. Paste the code into the newly created file in the Remix IDE.
4. Compile the Contract: In the Remix IDE, click on the "Solidity Compiler" tab in the left-hand sidebar. Under the "Compiler Configuration" section, ensure that the correct Solidity compiler version is selected (e.g., 0.8.0). Click on the "Compile" button to compile the contract. You should see a green notification at the bottom saying "Compilation Successful."
5. Deploy the Contract: Click on the "Deploy & Run Transactions" tab in the left-hand sidebar. Under the "Deploy & Run Transactions" section, select the DegenGamingToken contract from the dropdown menu. Click on the "Deploy" button to deploy the contract to the Remix JavaScript VM.
6. Interact with the Contract: After deploying the contract, you can interact with its functions using the Remix IDE. For example, expand the contract functions in the "Deployed Contracts" section, and you will see the available functions like mintTokens, transferTokens, redeemTokens, etc. Click on any function to interact with it. You can provide the required parameters and click the "transact" button to execute the function.
7. View Events and Logs: You can also view events and logs emitted by the contract functions. In the "Deployed Contracts" section, expand the contract and click on the "Events" tab to see the emitted events. Similarly, click on the "Logs" tab to view the logs generated during contract execution.

## Authors
Uttam Kumar

## License
This project is licensed under the MIT License - see the LICENSE file for details.
