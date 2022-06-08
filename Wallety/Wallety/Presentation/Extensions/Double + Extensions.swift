import Foundation

extension Double {
    
    func formatWith(digit: Int = 2, locale: String = "en-US") -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: locale)
        formatter.maximumFractionDigits = digit
        
        let number = NSNumber(value: self)
        return formatter.string(from: number)
    }
    
}
