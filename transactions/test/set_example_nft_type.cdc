import DapperWalletRestrictions from "DapperWalletRestrictions"
import ExampleNFT from "ExampleNFT"

transaction() {
    prepare(acct: AuthAccount) {
        let ref = acct.borrow<&DapperWalletRestrictions.Admin>(from: DapperWalletRestrictions.StoragePath)
            ?? panic("admin not found")

        let conf = DapperWalletRestrictions.TypeConfig()
        conf.setFlag("CAN_INIT", true)
        conf.setFlag("CAN_WITHDRAW", false)
        ref.addType(Type<@ExampleNFT.NFT>(), conf: conf)

        // assert that the type is now set up
        let c = DapperWalletRestrictions.getConfig(Type<@ExampleNFT.NFT>())!
        assert(c.getFlag("CAN_INIT"), message: "type not set up")
        assert(!c.getFlag("CAN_TRADE"), message: "type not set up")
        assert(!c.getFlag("CAN_WITHDRAW"), message: "type not set up")
    }
}