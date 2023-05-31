//
//  NuevaView.swift
//  CurrencyConverter
//
//  Created by NTTDATA on 31/05/23.
//

import SwiftUI

struct NuevaView: View {
    @StateObject var mv = AtViewModel()
    @State var mysymbols = ""
    
    @State var selectedNumsss = "Select an option to convert: "
    @State var isExpandedsss = false
    
    var body: some View {
        VStack{
            Text("Concurrency Converter")
                .font(.title)
                .padding()
            HStack{
                Text("EUR")
                TextField("enter num of euros", text: $mv.numEuros)
                    .frame(width: 250)
            }
                .padding()
            DisclosureGroup("\(selectedNumsss)", isExpanded: $isExpandedsss){
                ScrollView {
                    VStack{
                        ForEach(mv.rates.sorted(by: >), id: \.key) { key, value in
                            HStack{
                                Text("\(key):")
                                    .font(.system(size: 15))
                                Text("\(value)")
                                    .font(.system(size: 15))
                            }
                                .onTapGesture {
                                    if !mv.numEuros.isEmpty || mv.numEuros != nil{
                                        selectedNumsss = key
                                        mv.symb = selectedNumsss
                                        mv.hola()
                                        withAnimation {
                                        self.isExpandedsss.toggle()
                                    }
                                } else {
                                    print("debe seleccionar el numero de Euros")
                                }
                                }
                            Divider()
                        }
                    }
                }.frame(width: 300, height: 200)
            }.padding(50)
            HStack {
                Text(mv.symb)
                Text(String(mv.result))
            }
                .padding()
                .task {
                    await mv.obtWelc()
                    await mv.hola()
                }
        }
        Spacer()
    }
}

struct NuevaView_Previews: PreviewProvider {
    static var previews: some View {
        NuevaView()
    }
}
