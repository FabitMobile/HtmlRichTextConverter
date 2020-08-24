import DTCoreText
import UIKit

public let kHRTConverterTextColor: String = "kHRTConverterTextColor"
public let kHRTConverterLinkColor: String = "kHRTConverterLinkColor"
public let kHRTConverterFont: String = "kHRTConverterFont"
public let kHRTConverterLineHeightMultiplier: String = "kHRTConverterLineHeightMultiplier"

open class HtmlRichTextConverter {
    open var defaultTextColor: UIColor
    open var defaultLinkColor: UIColor
    open var defaultFontSize: Float
    open var defaultFontName: String
    open var defaultLineHeightMultiplier: Float

    public init() {
        defaultTextColor = .black
        defaultLinkColor = .blue
        defaultFontSize = 12
        defaultFontName = "HelveticaNeue"
        defaultLineHeightMultiplier = 1.4
    }

    open func attributedStringFromHTML(html: String, withStyle style: [String: Any]) -> NSAttributedString {
        var options: [String: Any] = [:]

        options[DTDefaultTextColor] = style[kHRTConverterTextColor] ?? defaultTextColor
        options[DTDefaultLinkColor] = style[kHRTConverterLinkColor] ?? defaultLinkColor
        options[DTDefaultLineHeightMultiplier] = style[kHRTConverterLineHeightMultiplier] ?? defaultLineHeightMultiplier

        if let font = style[kHRTConverterFont] as? UIFont {
            options[DTDefaultFontName] = font.fontName
            options[DTDefaultFontSize] = font.pointSize - 3
        } else {
            options[DTDefaultFontName] = defaultFontName
            options[DTDefaultFontSize] = defaultFontSize - 3
        }
        options[DTUseiOS6Attributes] = true
        options[NSTextSizeMultiplierDocumentOption] = 1.3

        let wrappedHtml = String(format: "<html><body>%@</body></html>", html)

        // swiftint:disable:next force_unwrapping
        let result = NSAttributedString(htmlData: wrappedHtml.data(using: .utf8),
                                        options: options,
                                        documentAttributes: nil)!
        return result
    }
}
