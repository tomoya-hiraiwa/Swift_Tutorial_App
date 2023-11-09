//
//  ContentView.swift
//  janken
//
//  Created by Tomoya Hiraiwa on 2023/11/08.
//

import SwiftUI

struct ContentView: View {
@State var answernumber = 0
    var body: some View {
       
        VStack {
            Spacer()
            if answernumber == 0 {
                Text("Let's do janken")
                    .padding(.bottom)
            }
            else if answernumber == 1 {
                Image("gu")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("グー")
                    .padding(.bottom)
            }
            else if answernumber == 2 {
                Image("choki")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("チョキ")
                    .padding(.bottom)
            }
            else{
                Image("pa")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("パー")
                    .padding(.bottom)
            }
            Button {
                var newAnswer = 0
                repeat{
                    newAnswer = Int.random(in: 1...3)
                } while answernumber == newAnswer
                answernumber = newAnswer
            } label: {
                Text("Do janken")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font(.title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
