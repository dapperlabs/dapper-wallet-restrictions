import DapperWalletCollections from "DapperWalletCollections"

transaction(typeIdentifier: String) {
    prepare(acct: auth(BorrowValue) &Account) {
        let ref = acct.storage.borrow<&DapperWalletCollections.Admin>(from: DapperWalletCollections.StoragePath)
            ?? panic("admin not found")

        let t = CompositeType(typeIdentifier)!
        ref.addType(t)
    }
}
