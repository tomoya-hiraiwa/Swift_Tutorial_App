//
//  ContentView.swift
//  MyCamera
//
//  Created by Tomoya Hiraiwa on 2023/11/09.
//

import SwiftUI

struct ContentView: View {
    @State var captureImage: UIImage? = nil
    @State var isShowSheet = false
    var body: some View {
        VStack {
        Spacer()
            if let captureImage{
                Image(uiImage: captureImage)
                    .resizable()
                    .scaledToFit()
            }
            
       Spacer()
            
            Button{
                if UIImagePickerController.isSourceTypeAvailable(.camera){
                    print("Camera is OK")
                    isShowSheet.toggle()
                } else{
                    print("Can't use Camera")
                }
            
            } label: {
                Text("start Camera")
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .multilineTextAlignment(.center)
                    .background(Color.blue)
                    .foregroundColor(Color.white)
            }
            .padding()
            .sheet(isPresented: $isShowSheet){
                ImagePickerView(isShowSheet: $isShowSheet, captureImage: $captureImage)
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
