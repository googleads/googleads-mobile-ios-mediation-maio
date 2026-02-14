// swift-tools-version:5.3

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "MaioAdapter",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "MaioAdapterTarget",
      targets: ["MaioAdapterTarget", "MaioSDK"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "12.0.0"
    )
  ],
  targets: [
    .target(
      name: "MaioAdapterTarget",
      dependencies: [
        .target(name: "MaioAdapter"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "MaioAdapterTarget"
    ),
    .binaryTarget(
      name: "MaioAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/maio/MaioAdapter-2.2.0.0.zip",
      checksum: "60e646231272f0c61508da1d1b45a3b4cb28bea520be50c06f999717158b72d5"
    ),
    .binaryTarget(
      name: "MaioSDK",
      url:
        "https://github.com/imobile/MaioSDK-v2-iOS/releases/download/v2.2.0/Maio.xcframework.zip",
      checksum: "75d70d45b58ab08019f1412a51f336aec20213eb490f04e8c5e9c312d5fa7917"
    ),
  ]
)
