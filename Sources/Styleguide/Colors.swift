import SwiftUI

extension Color {
  
  public static let lump = Lump()
  
  public struct Lump {
    public let primary = Color.hex(0xFB8989)
    public let navy = Color.hex(0x000060)
    
    public let text = Text()
    
    public struct Text {
      public let primary = Color.primary
      public let secondary = Color.hex(0x000000, opacity: 0.36)
      public let tertiary = Color.hex(0xF3F4F8)
    }
  }
}

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
