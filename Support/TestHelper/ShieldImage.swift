import XCTest

public extension CGSize {
    static let iPhone5      : CGSize    = CGSize(width: 320, height: 568)
    static let iPhone6Plus  : CGSize    = CGSize(width: 414, height: 736)
    static let iPhoneX      : CGSize    = CGSize(width: 375, height: 812)
}

public struct ShieldImage {
    /// PNG at 3×
    public let image: UIImage
    public let baseURL: URL
}

extension ShieldImage {
    public static let i280 = ShieldImage(image: UIImage(named: "i-280", in: Bundle.module, compatibleWith: nil)!,
                                  baseURL: URL(string: "https://s3.amazonaws.com/mapbox/shields/v3/i-280")!)
    public static let us101 = ShieldImage(image: UIImage(named: "us-101", in: Bundle.module, compatibleWith: nil)!,
                                   baseURL: URL(string: "https://s3.amazonaws.com/mapbox/shields/v3/us-101")!)
}

