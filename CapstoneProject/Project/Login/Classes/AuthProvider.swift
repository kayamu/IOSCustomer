// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// Muharrem Kaya
//this class acts as the authentication provider for log in
import UIKit

/// Firebase Auth supported identity providers and other methods of authentication
enum AuthProvider: String {
  case google = "google.com"
  case apple = "apple.com"
  case twitter = "twitter.com"
  case facebook = "facebook.com"
  case emailPassword = "password"
  case phoneNumber = "phone"


  /// More intuitively named getter for `rawValue`.
  var id: String { rawValue }

  /// The UI friendly name of the `AuthProvider`. Used for display.
  var name: String {
    switch self {
    case .google:
      return "Google"
    case .apple:
      return "Apple"
    case .twitter:
      return "Twitter"
    case .facebook:
      return "Facebook"
    case .emailPassword:
      return "Email & Password Login"
    case .phoneNumber:
      return "Phone Number"
    }
  }

  /// Failable initializer to create an `AuthProvider` from it's corresponding `name` value.
  /// - Parameter rawValue: String value representing `AuthProvider`'s name or type.
  init?(rawValue: String) {
    switch rawValue {
    case "Google":
      self = .google
    case "Apple":
      self = .apple
    case "Twitter":
      self = .twitter
    case "Facebook":
      self = .facebook
    case "Email & Password Login":
      self = .emailPassword
    case "Phone Number":
      self = .phoneNumber
    default: return nil
    }
  }
}

