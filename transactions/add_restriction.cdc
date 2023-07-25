import DapperWalletRestrictions from "DapperWalletRestrictions"
import ExampleNFT from "ExampleNFT"

transaction(typeIdentifier: String, flags: {String:Bool}) {
    prepare(acct: AuthAccount) {
        let ref = acct.borrow<&DapperWalletRestrictions.Admin>(from: DapperWalletRestrictions.StoragePath)
            ?? panic("admin not found")

        let conf = DapperWalletRestrictions.TypeConfig()
        for k in flags.keys {
            conf.setFlag(k, flags[k]!)
        }
        let t = CompositeType(typeIdentifier)!
        ref.addType(t, conf: conf)
    }
}