//
//  ReadData.swift
//  RickAndMortiCharacters
//
//  Created by Александр on 15.04.2022.
//

import Foundation
import Alamofire

protocol ReadDataProtocol {
    func readDataOk(data: Response?)
}

class ReadData {
    
    static let shared: ReadData = ReadData()
    
    let dataURL = "https://rickandmortyapi.com/api/character"
    
    var characters: Response?
    var delegateData: ReadDataProtocol?
    
    func readData(){
        
        AF.request(self.dataURL).responseDecodable(of: Response.self) { [self] response in
            
            characters = response.value
            self.delegateData?.readDataOk(data: characters)
        }
        
    }


}
