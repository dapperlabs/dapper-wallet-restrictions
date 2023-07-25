import "DapperWalletRestrictions"

pub fun main(): {String: String} {
    return DapperWalletRestrictions.GetConfigFlags()
}