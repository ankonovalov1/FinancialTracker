import Foundation

struct ContentLoader {
    
    func loadFrom(bundle: Bundle = .main, name: String, exten: String) -> String? {
        guard
            let url = bundle.url(forResource: name, withExtension: exten),
            let data = try? Data(contentsOf: url)
        else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
}


