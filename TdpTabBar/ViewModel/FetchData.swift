//
//  FetchData.swift
//  TdpTabBar
//
//  Created by Thidar Phyo on 10/28/20.
//

import SwiftUI

class FetchData: ObservableObject {
   
   @Published  var conversionData : [Currency] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        let url = "https://api.exchangeratesapi.io/latest?base=USD"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { (data, _, _) in
            guard let JSONData = data else {return}
            
            do {
                let conversion = try JSONDecoder().decode(Conversion.self, from: JSONData)
                print(conversion)
                
                DispatchQueue.main.async {
                    self.conversionData = conversion.rates.compactMap({ (key,value) -> Currency? in
                        return Currency(currencyName: key, currencyValue: value)
                    })
                }
            }
            catch {
                print(error.localizedDescription)
            }
             
        }
        .resume()
    }
}


