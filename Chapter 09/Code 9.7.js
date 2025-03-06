// Steps to deploy a contract using hardhat on Sepolia testnet

const hre = require("hardhat");

async function main() {
    const [deployer] = await hre.ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer. address);
    const SimpleToken = await hre.ethers.getContractFactory("SimpleToken");
    const token = await SimpleToken.deploy(1000);
    await token.deployed();
    console.log("Token deployed to:", token.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
    console.error(error);
    process.exit(1);
});