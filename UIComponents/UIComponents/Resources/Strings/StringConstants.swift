// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Login {
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Login.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Login.email")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Login.forgot")
    /// New user? 
    public static let newUser = L10n.tr("Localizable", "Login.newUser")
    /// Password
    public static let password = L10n.tr("Localizable", "Login.password")
    /// Sign up now
    public static let signUp = L10n.tr("Localizable", "Login.signUp")
    /// Login
    public static let title = L10n.tr("Localizable", "Login.title")
  }

  public enum Register {
    /// Register
    public static let title = L10n.tr("Localizable", "Register.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
