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

## Documentation

for `SnowballSwiftKit`, 

### `SnowballAvatar` (in progress)
### `SnowballAvatarStack` (in progress)
### `SnowballButton` (in progress)
### `SnowballNFTGridView` (in progress)
### `SnowballNFTListView` (in progress)
### `SnowballSearchBar` (in progress)
### `SnowballSwitchLabel` (in progress)
### `SnowballTextInput` (in progress)
### `SnowballToastView` (in progress)
- `SnowballToastType`: `error`, `warning`, `neutral`, `positive`

for `SnowballAssetKit`,

use symbols via 

```
// SwiftUI
SnowballImage("SOL") 
SnowballImage(.sol) 

// UIKit
SnowballUIImage("SOL")
SnowballUIImage(.sol)

```
