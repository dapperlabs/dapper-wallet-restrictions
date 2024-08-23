import DapperWalletRestrictions from "DapperWalletRestrictions"

transaction(typeIdentifier: String, flags: {String:Bool}) {
    prepare(acct: auth(BorrowValue) &Account) {
        let ref = acct.storage.borrow<&DapperWalletRestrictions.Admin>(from: DapperWalletRestrictions.StoragePath)
            ?? panic("admin not found")

        let conf = DapperWalletRestrictions.TypeConfig()
        for k in flags.keys {
            conf.setFlag(k, flags[k]!)
        }
        let t = CompositeType(typeIdentifier)!
        ref.updateType(t, conf: conf)
    }
}
