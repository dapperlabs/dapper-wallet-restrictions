import "DapperWalletRestrictions"

pub fun main(): Bool {
    let c = DapperWalletRestrictions.getConfig("hello".getType())
    return c == nil
}