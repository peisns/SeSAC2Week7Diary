//
//  PersonAPIManager.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/30.
//

import Foundation

class PersonAPIManager {
    
    //헤더 있는 경우
//    let url = URL(string: "")
//    let a = URLRequest(url: url)
//    a.setValue(<#T##String?#>, forHTTPHeaderField: <#T##String#>)
    
    static func requestPerson(query: String, completion: @escaping (Person?, APIError?) -> Void) {
        
//        query.addingPercentEncoding(withAllowedCharacters: <#T##CharacterSet#>) 띄어쓰기.. 등 조정
        
//        let url = URL(string: "https://api.themoviedb.org/3/search/person?api_key=YOURKEY&language=en-US&query=\(query)&page=1&include_adult=false&region=ko-KR")!
        
        let scheme = "https"
        let host = "api.themoviedb.org"
        let path = "/3/search/person"

        let language = "ko-KR"
        let key = "a17c0993382165bd9c856541a99fa371"
        let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        
        
        var component = URLComponents()
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
            URLQueryItem(name: "api_key", value: key),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "region", value: language)
        ]
        
        URLSession.shared.dataTask(with: component.url!) { data, response, error in
            
            DispatchQueue.main.async {
                
                guard error == nil else {
                    print("Failed Request nil")
                    completion(nil, .failedRequest)
                    return
                }
                
                guard let data = data else {
                    completion(nil, .noData)
                    return
                }
                
                
                guard let response = response as? HTTPURLResponse else {
                    print("Unable Response")
                    completion(nil, .invalidResponse)
                    return
                }
                
                guard response.statusCode == 200 else {
                    print("Failed Response 200")
                    completion(nil, .failedRequest)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Person.self, from: data)
                    completion(result, nil)
                    print(result)
                } catch {
                    print(error)
                    completion(nil, .invalidData)
                }
            }
        }.resume()
    }
}
