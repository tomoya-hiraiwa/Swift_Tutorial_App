//
//  ContentView.swift
//  MyMap
//
//  Created by Tomoya Hiraiwa on 2023/11/08.
//

import SwiftUI

struct ContentView: View {
    @State var inputText: String = ""
    @State var displaySearchKey: String = ""
    @State var displayMapType: MapType = .stadard
    var body: some View {
        VStack{
            TextField("keyWord",text: $inputText,prompt: Text("Enter keyWord"))
                .onSubmit {
                    displaySearchKey = inputText
                }
                .padding()
        
            ZStack(alignment: .bottomTrailing) {
                MapView(searchKey: displaySearchKey,mapType: displayMapType)
                
                Button{
                    if displayMapType == .stadard{
                        displayMapType = .satellite
                    }
                    else if displayMapType == .satellite{
                        displayMapType = .hybrid
                    }
                    else{
                        displayMapType = .stadard
                    }
                } label: {
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0,height: 35.0)
                }
                .padding(.trailing,20.0)
                .padding(.bottom,30.0)
            
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
