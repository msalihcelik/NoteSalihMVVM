// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum ChangePassword {
    /// CHANGE PASSWORD
    public static let changePassword = L10n.tr("Localizable", "ChangePassword.changePassword")
    /// Your new passwords do not match.
    public static let differentNewPassword = L10n.tr("Localizable", "ChangePassword.differentNewPassword")
    /// Your password cannot be empty.
    public static let emptyError = L10n.tr("Localizable", "ChangePassword.emptyError")
    /// New Password
    public static let newPassword = L10n.tr("Localizable", "ChangePassword.newPassword")
    /// Password
    public static let password = L10n.tr("Localizable", "ChangePassword.password")
    /// Retype New Password
    public static let retypeNewPassword = L10n.tr("Localizable", "ChangePassword.retypeNewPassword")
    /// Your old password cannot be the same as your new password.
    public static let sameOldPassword = L10n.tr("Localizable", "ChangePassword.sameOldPassword")
    /// Save
    public static let save = L10n.tr("Localizable", "ChangePassword.save")
    /// Success
    public static let success = L10n.tr("Localizable", "ChangePassword.success")
  }

  public enum Forgot {
    /// Confirm your email and we'll send the instructions.
    public static let description = L10n.tr("Localizable", "Forgot.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Forgot.email")
    /// Your email address cannot be empty.
    public static let emptyEmail = L10n.tr("Localizable", "Forgot.emptyEmail")
    /// Reset Password
    public static let reset = L10n.tr("Localizable", "Forgot.reset")
    /// Forgot Password?
    public static let title = L10n.tr("Localizable", "Forgot.title")
  }

  public enum Login {
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Login.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Login.email")
    /// Your email address cannot be empty.
    public static let emptyEmail = L10n.tr("Localizable", "Login.emptyEmail")
    /// Your password cannot be empty.
    public static let emptyPassword = L10n.tr("Localizable", "Login.emptyPassword")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Login.forgot")
    /// New user? 
    public static let newUser = L10n.tr("Localizable", "Login.newUser")
    /// Password
    public static let password = L10n.tr("Localizable", "Login.password")
    /// Sign up now
    public static let signUp = L10n.tr("Localizable", "Login.signUp")
    /// Success Login
    public static let success = L10n.tr("Localizable", "Login.success")
    /// Login
    public static let title = L10n.tr("Localizable", "Login.title")
  }

  public enum NoteDetails {
    /// CREATE NOTE
    public static let createNote = L10n.tr("Localizable", "NoteDetails.createNote")
    /// EDIT NOTE
    public static let editNote = L10n.tr("Localizable", "NoteDetails.editNote")
    /// Save Note
    public static let saveNote = L10n.tr("Localizable", "NoteDetails.saveNote")
    /// SHOW NOTE
    public static let showNote = L10n.tr("Localizable", "NoteDetails.showNote")
  }

  public enum NoteList {
    /// Add Note
    public static let addNote = L10n.tr("Localizable", "NoteList.addNote")
    /// Cancel
    public static let cancel = L10n.tr("Localizable", "NoteList.cancel")
    /// Delete
    public static let delete = L10n.tr("Localizable", "NoteList.delete")
    /// Are you sure you want to delete this note.
    public static let deleteAlertMessage = L10n.tr("Localizable", "NoteList.deleteAlertMessage")
    /// Delete Note
    public static let deleteNote = L10n.tr("Localizable", "NoteList.deleteNote")
    /// Search...
    public static let search = L10n.tr("Localizable", "NoteList.search")
  }

  public enum Profile {
    /// Change Password
    public static let changePassword = L10n.tr("Localizable", "Profile.changePassword")
    /// Your name or email cannot be empty.
    public static let emptyError = L10n.tr("Localizable", "Profile.emptyError")
    /// PROFILE
    public static let profile = L10n.tr("Localizable", "Profile.profile")
    /// Save
    public static let save = L10n.tr("Localizable", "Profile.save")
    /// Sign Out
    public static let signOut = L10n.tr("Localizable", "Profile.signOut")
    /// Success
    public static let success = L10n.tr("Localizable", "Profile.success")
  }

  public enum Register {
    /// Already have an account? 
    public static let already = L10n.tr("Localizable", "Register.already")
    /// Login or sign up to continue using our app.
    public static let description = L10n.tr("Localizable", "Register.description")
    /// E-mail address
    public static let email = L10n.tr("Localizable", "Register.email")
    /// Your email address cannot be empty.
    public static let emptyEmail = L10n.tr("Localizable", "Register.emptyEmail")
    /// Your full name cannot be empty.
    public static let emptyName = L10n.tr("Localizable", "Register.emptyName")
    /// Your password cannot be empty.
    public static let emptyPassword = L10n.tr("Localizable", "Register.emptyPassword")
    /// Forgot Password?
    public static let forgot = L10n.tr("Localizable", "Register.forgot")
    /// Full Name
    public static let fullName = L10n.tr("Localizable", "Register.fullName")
    /// Password
    public static let password = L10n.tr("Localizable", "Register.password")
    /// Sign in now
    public static let signIn = L10n.tr("Localizable", "Register.signIn")
    /// Success Sign Up
    public static let success = L10n.tr("Localizable", "Register.success")
    /// Sign Up
    public static let title = L10n.tr("Localizable", "Register.title")
  }

  public enum ResetConfirmation {
    /// An email has been sent to %@ with further instructions.
    public static func description(_ p1: Any) -> String {
      return L10n.tr("Localizable", "ResetConfirmation.description", String(describing: p1))
    }
    /// Login
    public static let login = L10n.tr("Localizable", "ResetConfirmation.login")
    /// Password Reset Confirmation
    public static let title = L10n.tr("Localizable", "ResetConfirmation.title")
  }

  public enum Validation {
    /// Please enter a valid email address.
    public static let email = L10n.tr("Localizable", "Validation.email")
    /// Please enter a valid name.
    public static let name = L10n.tr("Localizable", "Validation.name")
    /// Password must be at least 6 characters.
    public static let password = L10n.tr("Localizable", "Validation.password")
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
