//
//  ContentView.swift
//  MyTimer
//
//  Created by Tomoya Hiraiwa on 2023/11/08.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count = 0
    @State var showAlert = false
    @AppStorage("timer_value") var timerValue = 10
    var body: some View {
        NavigationStack{
            ZStack{
                Image("backgroundTimer")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFill()
                
                VStack(spacing: 30.0){
                    Text("\(timerValue - count)seconds to go")
                        .font(.largeTitle)
                    
                    HStack{
                        Button{
                            startTimer()
                        } label: {
                            Text("Start")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140,height: 140)
                                .background(Color("startColor"))
                                .clipShape(Circle())
                        }
                        Button{
                            if let unwrapedTimerHandler = timerHandler{
                                if unwrapedTimerHandler.isValid == true{
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        } label: {
                            Text("Stop")
                                .font(.title)
                                .foregroundColor(Color.white)
                                .frame(width: 140,height: 140)
                                .background(Color("stopColor"))
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .onAppear{
                count = 0
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink{
                        SettingView()
                    } label: {
                        Text("Set seconds")
                        
                    }
                }
            }
            .alert("End",isPresented: $showAlert){
                Button("OK"){
                    
                }
            } message: {
                Text("It's time for the timer to end")
            }
        }
    }
    
    func countDownTimer(){
        count += 1
    
        if timerValue - count <= 0{
            timerHandler?.invalidate()
            showAlert =  true
        }
    }
    
    func startTimer(){
        if let unwrapedTimerHandler = timerHandler{
            if unwrapedTimerHandler.isValid == true{
                return
            }
        }
            
            if timerValue - count <= 0{
                count = 0
            }
            
            timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true ){_ in
                countDownTimer()
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
