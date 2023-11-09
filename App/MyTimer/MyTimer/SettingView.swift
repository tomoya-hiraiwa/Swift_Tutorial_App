//
//  SettingView.swift
//  MyTimer
//
//  Created by Tomoya Hiraiwa on 2023/11/08.
//

import SwiftUI

struct SettingView: View {
    @AppStorage("timer_value") var timeValue = 10
    var body: some View {
        ZStack{
            Color("backgroundSetting")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Text("\(timeValue)minutes")
                    .font(.largeTitle)
                Spacer()
                Picker(selection: $timeValue){
                    Text("10")
                        .tag(10)
                    Text("20")
                        .tag(20)
                    Text("30")
                        .tag(30)
                    Text("40")
                        .tag(40)
                    Text("50")
                        .tag(50)
                    Text("60")
                        .tag(60)
                } label: {
                    Text("Choice")
                }
                .pickerStyle(.wheel)
                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
