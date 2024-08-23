//
//  NetworkManager.swift

import Foundation
import ObjectMapper
import Alamofire
import AlamofireObjectMapper
import SVProgressHUD

enum HUDFlag: Int {
    case show = 1
    case hide = 0
}

class NetworkManager: Session {
    
    static let shared = NetworkManager()
    
    //----------------------------------------------------------------
    // MARK: Get Request Method
    //----------------------------------------------------------------
    
    func getResponse<T: Mappable>(_ url: String, parameter: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, header: HTTPHeaders? = nil, showHUD: HUDFlag = .show, mappingType: T.Type, completion: @escaping (Mappable?, APIError?) -> Void) {
        
        self.objectRequest(url, method: .get, parameter: parameter, encoding: encoding, header: header, mappingType: mappingType) { (mappableResponse) in
            
            switch mappableResponse.result {
                
            case .success(let data):
                completion(data, nil)
                break
                
            case .failure(let error):
                completion(nil, .errorMessage(error.localizedDescription))
                break
            }
        }
    }
    
    //--------------------------------------------------
    
    func getArray<T: Mappable>(_ url: String, parameter: Parameters? = nil, encoding: ParameterEncoding = URLEncoding.default, header: HTTPHeaders? = nil, showHUD: HUDFlag = .show, mappingType: [T].Type, completion: @escaping ([Mappable]?, APIError?) -> Void) {
        
        self.arrayRequest(url, method: .get, parameter: parameter, encoding: encoding, header: header, mappingType: mappingType) { (mappableArray) in
            
            switch mappableArray.result {
            
            case .success(let data):
                completion(data, nil)
                break
                
            case .failure(let error):
                completion(nil, .errorMessage(error.localizedDescription))
                break
            }
        }
    }
    
    
    // ----------------------------------------------------------------
    // MARK: Post Request Method
    // ----------------------------------------------------------------
    
    func postResponse<T: Mappable>(_ url: String, parameter: Parameters? = nil, encoding: ParameterEncoding = JSONEncoding.default, header: HTTPHeaders? = nil, showHUD: HUDFlag = .show, mappingType: T.Type, completion: @escaping (Mappable?, APIError?) -> Void) {
        
        self.objectRequest(url, method: .post, parameter: parameter, encoding: encoding, header: header, mappingType: mappingType) { (mappableResponse) in
            
            switch mappableResponse.result {
                
            case .success(let data):
                completion(data, nil)
                break
                
            case .failure(let error):
                completion(nil, .errorMessage(error.localizedDescription))
                break
            }
        }
    }
    
    
    // ----------------------------------------------------------------
    // MARK: Object Request Method
    // ----------------------------------------------------------------
    
    func objectRequest<T: BaseMappable>(_ url: String, method: Alamofire.HTTPMethod, parameter: Parameters? = nil, encoding: ParameterEncoding, header: HTTPHeaders? = nil, mappingType: T.Type, completionHandler: @escaping (DataResponse<T, AFError>) -> Void) -> Void {
        
        SVProgressHUD.show()
        
        self.request(url, method: method, parameters: parameter, encoding: encoding, headers: header).responseObject { (response: DataResponse<T, AFError>) in
            
            SVProgressHUD.dismiss()
            
            completionHandler(response as DataResponse<T, AFError>)
        }
    }
    
    //--------------------------------------------------
    
    func arrayRequest<T: BaseMappable>(_ url: String, method: Alamofire.HTTPMethod, parameter: Parameters? = nil, encoding: ParameterEncoding, header: HTTPHeaders? = nil, mappingType: [T].Type, completionHandler: @escaping (DataResponse<[T], AFError>) -> Void) -> Void {
        
        SVProgressHUD.show()
        
        self.request(url, method: method, parameters: parameter, encoding: encoding, headers: header).responseArray { (response: DataResponse<[T], AFError>) in
            
            SVProgressHUD.dismiss()
            
            completionHandler(response as DataResponse<[T], AFError>)
        }
    }
}
