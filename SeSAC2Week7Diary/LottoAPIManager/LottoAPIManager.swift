//
//  LottoAPIManager.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/30.
//

import Foundation


//shared - 단순하고 커스컴하지 않는, 응답 클로저. 프로세스 확인 불가능. 백그라운드 전송 불가능.
//default configuration - 커스텀하고 싶을때 사용, shared와 유사하지만 커스텀이 가능함. 응답은 클로저로도 할 수 있고 deleagate로도 할 수 있음. 커스텀 예: 와이파이, 셀룰러 여부, 타임아웃 간격

enum APIError: Error {
    case invalidResponse
    case noData
    case failedRequest
    case invalidData
}

class LottoAPIManager {
    
    static func requestLotto(drwNo: Int, completion: @escaping (Lotto?, APIError?) -> Void) {
        
        let url = URL(string: "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(drwNo)")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
//            print(data)
//            print(String(data: data!, encoding: .utf8))
//            print(response)
//            print(error)
            DispatchQueue.main.async {
                
                guard error == nil else {
                    print("Failed Request")
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
                    print("Failed Response")
                    completion(nil, .failedRequest)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Lotto.self, from: data) // data를 해당 타입에 decode해서 넣겠다
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
