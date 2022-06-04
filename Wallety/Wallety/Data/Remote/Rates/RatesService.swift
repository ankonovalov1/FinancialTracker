import Foundation
import Alamofire

protocol RatesServiceProtocol {
    func get(request: RatesRequestDTO, completion: @escaping (RatesResponseDTO) -> Void)
}

final class RatesService: RatesServiceProtocol {
    
    private let urlString = "https://api.exchangerate.host/latest"
    
    func get(request: RatesRequestDTO, completion: @escaping (RatesResponseDTO) -> Void) {
        
        if var url = URLComponents(string: urlString) {
            url.queryItems = [
                URLQueryItem(name: "symbols", value: request.symbols),
                URLQueryItem(name: "base", value: request.base)
            ]
      
            AF.request(url)
                .responseData { response in
                    if
                        let code = response.response?.statusCode,
                        code >= 200 && code < 300,
                        let data = response.data,
                        let model = try? JSONDecoder().decode(RatesResponseDTO.self, from: data) {
                        completion(model)
                    }
                    else {
                        completion(RatesResponseDTO.defaultValue())
                    }
                }
        }
    }
    
}
