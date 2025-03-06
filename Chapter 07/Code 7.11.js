// interacting with deployed contract using metamask

<button id="depositButton">Deposit</button>
<script src="https://cdn.jsdelivr.net/npm/ethers/dist/ethers.min.
js"></script>
<script>
const provider = new ethers.providers.Web3Provider(window. ethereum);
const signer = provider.getSigner();
const contractAddress = "YOUR_CONTRACT_ADDRESS";
const abi = [
"function deposit() public payable",
"function getBalance() public view returns (uint)"
];

const contract = new ethers.Contract(contractAddress, abi, document.getElementById('depositButton').onclick await provider.send("eth_requestAccounts", []));
const tx = await contract.deposit({ value: ethers.utils.parseEther("0.1") });
await tx.wait();
alert("Deposit successful!");

</script>