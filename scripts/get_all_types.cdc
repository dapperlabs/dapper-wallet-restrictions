import "DapperWalletRestrictions"

access(all) fun main(): {Type: DapperWalletRestrictions.TypeConfig} {
    return DapperWalletRestrictions.getTypes()
}