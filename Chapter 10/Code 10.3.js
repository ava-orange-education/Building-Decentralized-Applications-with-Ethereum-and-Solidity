// Writing unit tests for the SimpleStorage contract using ethers.js in hardhat

const { expect } = require("chai");

describe("SimpleStorage", function () {
    let SimpleStorage;
    let simpleStorage;
    let owner;
    beforeEach(async function () {
        [owner] = await ethers.getSigners();
        SimpleStorage = await ethers.getContractFactory("SimpleStorage");
        await ethers.getContractFactory("SimpleStorage");
        simpleStorage = await SimpleStorage.deploy();
        await simpleStorage.deployed();
    });
    it("Should return the default value of 0", async function () {
        expect(await simpleStorage.getValue()).to.equal(0);
    });

    it("Should update the stored value", async function () {
        await simpleStorage.setValue(42);
        expect(await simpleStorage.getValue()).to.equal(42);
    });
});
