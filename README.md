# SnowballSwiftKit

Lots to do!! SwiftUI Component Kit supporting iOS 15.0+.

Packages: 
- `SnowballSwiftKit`: SwiftUI Component Kit (for now very basic but soon flows like login etc)
- `SnowballAssetKit`: Common crypto assets (as png and sf symbols)

## Getting Started

- Easiest way to open -- `SnowballAssetKit` Package, `SnowballSwiftKit` Package and `SnowballSwiftExample` App -- is via the bash script `start` or open `SnowballSwiftExample/SnowballSwiftExample.xcodeproj`
- [swiftlint](https://github.com/realm/SwiftLint)
    - [apple package manager plugins](https://github.com/apple/swift-package-manager/blob/main/Documentation/Plugins.md)
    - fix all? `swiftlint --fix`
- Config.xcconfig
    - For now, until an app wide `SnowballSettings` is arch, edit `Config.xcconfig` with API Keys to test out some of the custom views such as `SnowballNFTGridView` and `SnowballNFTListView`. 
    - Read more on [Config / Dev Mode](https://nshipster.com/xcconfig/)
- [Fastlane](https://fastlane.tools)
    - generate screenshots + automate deployment
    - [setup](https://docs.fastlane.tools/getting-started/ios/setup/)

## Soon 
(send me a telegram @vivianphung if u want anything sooner)
- `SnowballSettings` for app wide configs
- Login with wallet / email flow
- [Custom SF Symbols Collection](https://www.david-smith.org/blog/2023/01/23/design-notes-18/)
- Snowball Kit documentation site
- `SnowballKotlinKit` (for [Jetpack](https://developer.android.com/jetpack))

## `SnowballAssetKit` Documentation

Creating the `SF Symbols` version of assets is currently pretty manual ([guide](https://www.david-smith.org/blog/2023/01/23/design-notes-18/)). Looking into automating using a figma extension (worst case python since its an svg)

- What's ready? `sol`, `btc`
- In works: `eth`, `avax`, `bnb`, `matic`, `atom`, `dot`, `ada`, `algo`, `ftt`, `msol`, `ltc`, `xrp`, `yifi`, `eos`, `ar`, `sec`, `fil`, `trx`, `xtz`, `sushi`, `ape`, `near`, `doge`, `srm`, `gmt`, `crv`, `yfi`, `ftm`, `jewel`, `usdc` and external wallets `metamask`, `phantom`, `walletconnect`, `brave`, `ledger`, `cbWallet`, `trezor`, `trust`, `argent`
}

use symbols via 

```
// SwiftUI
SnowballImage("SOL") 
SnowballImage(.sol) 

// UIKit
SnowballUIImage("SOL")
SnowballUIImage(.sol)
```

## `SnowballSwiftKit` Documentation

V0 (rough rough start) are ready! 

- `SnowballAvatar`
- `SnowballAvatarStack`
- `SnowballButton`
- `SnowballNFTGridView`
- `SnowballNFTListView`
- `SnowballSearchBar`
- `SnowballSwitchLabel`
- `SnowballTextInput`
- `SnowballToastView`
    - `SnowballToastType`: `error`, `warning`, `neutral`, `positive`
