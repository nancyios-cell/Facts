//
//  Webservice.swift
//  Facts
//
//  Created by Nancy on 10/11/20.
//

import Foundation
let BASE_URL = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"


class WebServices
{
    static let sharedInstance : WebServices = {
        return WebServices()
    }()
    
    /*
     Check Internet status whether it is Connected or not.
     **/
    public func checkInternet() -> Bool
    {
        let status = CheckInternetStatus().connectionStatus()
        switch status {
        case .unknown, .offline:
            return false
        case .online(.wwan), .online(.wiFi):
            return true
        }
    }
    
    func getFactsList(completionHandler:@escaping (_ success:Bool, _ factResponse:FactsModel?, _ message: String?) -> Void) {
        if checkInternet() {
            var mainUrl = ""
            mainUrl = "\(BASE_URL)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            let sURL = URL(string: mainUrl)!
            let request = URLRequest(url: sURL)
            let session = URLSession(configuration: URLSessionConfiguration.default)

            let task = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
                      // print(data)
                guard let data = data, error == nil else { return }
                do {
                    let responseStrInISOLatin = String(data: data, encoding: String.Encoding.isoLatin1)
                    guard let modifiedDataInUTF8Format = responseStrInISOLatin?.data(using: String.Encoding.utf8) else {
                          print("could not convert data to UTF-8 format")
                          return
                     }

                    let json = try JSONSerialization.jsonObject(with: modifiedDataInUTF8Format, options: .allowFragments) as! [String: AnyObject]
                    let jsonDD = try JSONSerialization.data(withJSONObject: json)

                    if let httpResponse = response as? HTTPURLResponse {
                        if httpResponse.statusCode == 200 {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            
                            let decodedCountries = try decoder.decode(FactsModel.self, from: jsonDD)
                            completionHandler(true, decodedCountries, nil)
                        }
                    }
                } catch _ as NSError {
                    completionHandler(false, nil, Constants.Alert.noData)
                 }
                })
            task.resume()
        } else {
            completionHandler(false, nil, Constants.Alert.noInternet)
            print("No Internet Connection")
        }
    }
    
}
