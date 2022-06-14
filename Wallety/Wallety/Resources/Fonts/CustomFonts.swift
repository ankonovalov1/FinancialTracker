import Foundation
import UIKit

enum CustomFonts {
    
    case black(CGFloat)
    case blackItalic(CGFloat)
    case bold(CGFloat)
    case boldItalic(CGFloat)
    case extraBold(CGFloat)
    case extraBoldItalic(CGFloat)
    case extraLight(CGFloat)
    case extraLightItalic(CGFloat)
    case italic(CGFloat)
    case light(CGFloat)
    case lightItalic(CGFloat)
    case medium(CGFloat)
    case mediumItalic(CGFloat)
    case regular(CGFloat)
    case semiBold(CGFloat)
    case semiBoldItalic(CGFloat)
    case thin(CGFloat)
    case thinItalic(CGFloat)

    var montserrat: UIFont {
        get {
            switch self {
            case .black(let size):
                return UIFont(name: "MontserratAlternates-Black", size: size)!
            case .blackItalic(let size):
                return UIFont(name: "MontserratAlternates-BlackItalic", size: size)!
            case .bold(let size):
                return UIFont(name: "MontserratAlternates-Bold", size: size)!
            case .boldItalic(let size):
                return UIFont(name: "MontserratAlternates-BoldItalic", size: size)!
            case .extraBold(let size):
                return UIFont(name: "MontserratAlternates-ExtraBold", size: size)!
            case .extraBoldItalic(let size):
                return UIFont(name: "MontserratAlternates-ExtraBoldItalic", size: size)!
            case .extraLight(let size):
                return UIFont(name: "MontserratAlternates-ExtraLight", size: size)!
            case .extraLightItalic(let size):
                return UIFont(name: "MontserratAlternates-ExtraLightItalic", size: size)!
            case .italic(let size):
                return UIFont(name: "MontserratAlternates-Italic", size: size)!
            case .light(let size):
                return UIFont(name: "MontserratAlternates-Light", size: size)!
            case .lightItalic(let size):
                return UIFont(name: "MontserratAlternates-LightItalic", size: size)!
            case .medium(let size):
                return UIFont(name: "MontserratAlternates-Medium", size: size)!
            case .mediumItalic(let size):
                return UIFont(name: "MontserratAlternates-MediumItalic", size: size)!
            case .regular(let size):
                return UIFont(name: "MontserratAlternates-Regular", size: size)!
            case .semiBold(let size):
                return UIFont(name: "MontserratAlternates-SemiBold", size: size)!
            case .semiBoldItalic(let size):
                return UIFont(name: "MontserratAlternates-SemiBoldItalic", size: size)!
            case .thin(let size):
                return UIFont(name: "MontserratAlternates-Thin", size: size)!
            case .thinItalic(let size):
                return UIFont(name: "MontserratAlternates-ThinItalic", size: size)!
            }
        }
    }
    
    var roboto: UIFont {
        get {
            switch self {
            case .bold(let size):
                return UIFont(name: "Roboto-Bold", size: size)!
            case .light(let size):
                return UIFont(name: "Roboto-Light", size: size)!
            case .medium(let size):
                return UIFont(name: "Roboto-Medium", size: size)!
            case .regular(let size):
                return UIFont(name: "Roboto-Regular", size: size)!
            default:
                return UIFont(name: "RobotoSlab-Regular", size: 10)!
            }
        }
    }
    
}
