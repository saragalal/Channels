// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {
  /// hello
  internal static let hello = L10n.tr("Localizable", "hello")

  internal enum Category {
    /// Browse by categories
    internal static let header = L10n.tr("Localizable", "category.header")
  }

  internal enum Episode {
    /// New Episodes
    internal static let header = L10n.tr("Localizable", "episode.header")
    /// episodes
    internal static let title = L10n.tr("Localizable", "episode.title")
  }

  internal enum Series {
    /// series
    internal static let title = L10n.tr("Localizable", "series.title")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
