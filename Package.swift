// swift-tools-version:5.6

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
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "MaioAdapterTarget",
      targets: ["MaioAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      url: "https://github.com/imobile/MaioSDK-v2-iOS.git",
      exact: "2.2.1"
    ),
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      from: "13.0.0"
    )
  ],
  targets: [
    .target(
      name: "MaioAdapterTarget",
      dependencies: [
        .target(name: "MaioAdapter"),
        .product(name: "MaioSDK", package: "MaioSDK-v2-iOS"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
      ],
      path: "MaioAdapterTarget"
    ),
    .binaryTarget(
      name: "MaioAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/maio/MaioAdapter-2.2.1.0.zip",
      checksum: "45cae8f56ffefee0d1adbf08b16f9ed6a5144765a0da3076e705336cb63d3d9c"
    ),
  ]
)
