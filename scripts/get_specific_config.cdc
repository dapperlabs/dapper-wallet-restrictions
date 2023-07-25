import "DapperWalletRestrictions"

pub fun main(identifier: String): DapperWalletRestrictions.TypeConfig? {
    let c = CompositeType(identifier)!
    return DapperWalletRestrictions.getConfig(c)
}