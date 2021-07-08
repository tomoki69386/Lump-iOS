import SwiftUI

extension Color {
  public static func hex(_ hex: UInt, opacity: Double = 1) -> Self {
    Self(
      red: Double((hex & 0xff0000) >> 16) / 255,
      green: Double((hex & 0x00ff00) >> 8) / 255,
      blue: Double(hex & 0x0000ff) / 255,
      opacity: opacity
    )
  }
}
