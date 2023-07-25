import DapperWalletRestrictions from "DapperWalletRestrictions"
import ExampleNFT from "ExampleNFT"

transaction() {
    prepare(acct: AuthAccount) {
        let col <- ExampleNFT.createEmptyCollection()


        // assert that the type is now set up
        let c = DapperWalletRestrictions.getConfig(col.getType())!
        //assert(c.getFlag("CAN_INIT"), message: "type not set up")
        //assert(!c.getFlag("CAN_TRADE"), message: "type not set up")
        //assert(!c.getFlag("CAN_WITHDRAW"), message: "type not set up")
        destroy col
    }
}