// Interface for interacting with a token contract

interface IToken {
    function transfer(address recipient, uint256 amount) external;
    function balanceOf(address account) external view returns (uint256);
}
contract MyTokenUser {
    function transferTokens(
        address tokenAddress,
        address recipient,
        uint256 amount
    ) public {
        IToken(tokenAddress).transfer(recipient, amount);
    }
    function getBalance(
        address tokenAddress,
        address account
    ) public view returns (uint256) {
        return IToken(tokenAddress).balanceOf(account);
    }
}
