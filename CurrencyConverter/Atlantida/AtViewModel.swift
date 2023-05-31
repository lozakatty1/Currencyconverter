//
//  AtViewModel.swift
//  CurrencyConverter
//
//  Created by NTTDATA on 31/05/23.
//

import Foundation

@MainActor
class AtViewModel: ObservableObject {
    
    private let API_KEY = "6eac47b613e017775f4d251789bc86de"
    @Published var wel: Welcome?// = Welcome.empty
    @Published var date = ""
    @Published var base = ""
    @Published var rates: [String: Double] = ["": 0.00]
    var d = ["foo": 1.07, "bar": 2.2]
    @Published var result = 0.0
    @Published var symb = "Change value is: "
    @Published var dicc: [String: Any] = ["": 0.00]
    @Published var selectedNums = "Seleccione"
    @Published var numEuros = ""
    
    
    func obtWelc() async {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=\(API_KEY)")!
        
        //let url = URL(string:"http://data.fixer.io/api/latest?access_key=5bebb3e485d56d7c56b18660ec4d3f91")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try await JSONDecoder().decode(Welcome.self, from: data)
            print(dataModel)
            self.rates = dataModel.rates
            rates = Dictionary<String, Double>(uniqueKeysWithValues: rates.map{ key, value in (key.lowercased(), value.self) })
            print(rates)
            self.rates = dataModel.rates
            
           /* rates.map { (key, value) in
                if let key = [symb] {
                    print(value)
                    result = value as! Double * (Double(numEuros) ?? 0.0)
                    print("katy"
                    print(result)
                    return result
                } else {
                    return 0.0
                }
            }*/
            //self.wel = dataModel
            //self.base = dataModel.base
            
            
            //self.count = dataModel.count
        } catch {
            print(error)
        }
    }
    
    func generalGet(){
        
    }
    
    func hola(){//(symbol: String) {//}/-> [String:Any]{
        //aqui se cambia por result y se agrega la funcion a obtWelc abajo de print(rates)
       /* print(symb)
        d.map { (key, value) in
            if key == symb {
                print(value)
                result = value
                return result
            } else {
                return 0.0
            }
        }*/
        
        //esta opcion es solo si selecciona mas de 2 Euros
        self.rates.map { (key, value) in
            if key == symb && !key.isEmpty {
                print(value * (Double(numEuros) ?? 0.0))
                result = value * (Double(numEuros) ?? 0.0)
                return result
            } else {
                return 0.0
            }
        }
        
      /* let newDicc = d.mapValues { value in
           print(value)
            return value
        }*/
        
        ///Este metodo saca el listado de las llaves
      /*  rates = Dictionary<String, Any>(uniqueKeysWithValues: d.map{ key, value in (key.lowercased(), value.self) })
        print(rates.keys)
        symb = rates.keys.description
       */
        
         
    }
       
}












    

