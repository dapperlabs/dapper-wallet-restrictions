import "DapperWalletRestrictions"
import "ExampleNFT"

pub fun main(): Int {
    let c = DapperWalletRestrictions.getTypes()
    return c.keys.length
}