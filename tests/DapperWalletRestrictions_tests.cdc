import Test
import "test_helpers.cdc"

pub let adminAccount = blockchain.createAccount()
pub let accounts: {String: Test.Account} = {}


// --------------- Test cases ---------------

pub fun testImports() {
    let res = scriptExecutor("test/test_imports.cdc", [])! as! Bool
    assert(res, message: "import test failed")
}

pub fun testGetConfig() {
    let res = scriptExecutor("test/get_non_existent_type.cdc", [])! as! Bool
    assert(res, message: "get non existent type failed")
}

pub fun testGetAllTypes() {
    let res = scriptExecutor("test/get_all_types_len.cdc", [])! as! Int
    assert(res==0, message: "should return empty dict")
}

pub fun testAddExampleNFT() {
    txExecutor("test/set_example_nft_type.cdc", [adminAccount], [], nil, nil)
    let res = scriptExecutor("test/get_all_types_len.cdc", [])! as! Int
    assert(res==1, message: "should return dict with 1 entry")
}

pub fun testGetConfigFlags() {
    let res = scriptExecutor("get_config_flags.cdc", [])! as! {String:String}
    assert(res["CAN_INIT"]! != "")
}


pub fun setup() {

    accounts["DapperWalletRestrictions"] = adminAccount


    blockchain.useConfiguration(Test.Configuration({
        "DapperWalletRestrictions": adminAccount.address,
        "NonFungibleToken": adminAccount.address,
        "FungibleToken": adminAccount.address,
        "ViewResolver": adminAccount.address,
        "MetadataViews": adminAccount.address,
        "ExampleNFT": adminAccount.address
    }))

    deploy("DapperWalletRestrictions", adminAccount, "../contracts/DapperWalletRestrictions.cdc")
    deploy("NonFungibleToken", adminAccount, "../modules/flow-nft/contracts/NonFungibleToken.cdc")
    deploy("FungibleToken", adminAccount, "../modules/flow-nft/contracts/utility/FungibleToken.cdc")
    deploy("ViewResolver", adminAccount, "../modules/flow-nft/contracts/ViewResolver.cdc")
    deploy("MetadataViews", adminAccount, "../modules/flow-nft/contracts/MetadataViews.cdc")
    deploy("ExampleNFT", adminAccount, "../modules/flow-nft/contracts/ExampleNFT.cdc")
}