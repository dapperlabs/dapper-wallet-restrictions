import "DapperWalletCollections"

access(all) fun main(typeIdentifier: String): Bool {
    let t = CompositeType(typeIdentifier)!
    return DapperWalletCollections.containsType(t)
}