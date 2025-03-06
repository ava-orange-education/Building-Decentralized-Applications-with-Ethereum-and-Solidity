// Oracle Pattern

interface IPriceOracle {
    function getLatestPrice() external view returns (uint256);
}
contract PriceConsumer {
    IPriceOracle public priceOracle;
    constructor(address oracleAddress) {
        priceOracle = IPriceOracle(oracleAddress);
    }
    function getEtherPrice() public view returns (uint256) {
        return priceOracle.getLatestPrice();
    }
}
