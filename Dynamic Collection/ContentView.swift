//
//  ContentView.swift
//  Dynamic Collection
//
//  Created by Al Amin on 17/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var active = 0
    @State var data = [

        Type( name: "GTA 5", pic: "gta"),
       Type(name: "Resident Evil 2", pic: "re2"),
       Type( name: "Tomb Raider", pic: "tr"),
       Type(name: "Splinter Cell", pic: "sp"),
       Type( name: "GTA 5", pic: "gta")
       //Type( name: "GTA 5", pic: "gta")
    ]
    @State private var indexs:[Int] =  []
    func indexing(){
        for i in stride(from: 0, to: self.data.count, by: 2) {
            if i != self.data.count {
                self.indexs.append(i)
            }
            
        }
    }
    var body: some View {
        VStack{
            ZStack{
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("Grid").renderingMode(.original)
                        .resizable()
                        .frame(width: 25, height: 25)
                    }
                    Spacer()
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Image("User").renderingMode(.original)
                        .resizable()
                        .frame(width: 20, height: 25)
                    }
                }
                    Text("Games")
                        .font(.title)
                        .fontWeight(.bold)
            
            }
            .padding()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
//                    ForEach(indexs, id: \.self){ index in
//                        ForEach(index...index+1, id: \.self) { row in
//                            Card(data: self.$data)
//                        }
//                    }
//
//                  // Spacer()
                    ForEach(self.indexs, id: \.self){ index in
                        HStack(spacing: 15){
                            ForEach(index...index+1, id: \.self) { row in
                                VStack{
                                    
                                    if row != self.data.count{
                                        
                                        Card(data: self.$data[row])
                                    }
                                }
                            }
                            
                            if self.data.count % 2 != 0 {
                                Spacer()
                            }
                        }
                        .padding(.bottom, 25)
                    }
                    
                    
                }
                .padding(.horizontal)
                
            }
            
            Spacer()
            
            HStack{
                Button(action: {
                    self.active = 0
                }) {
                    VStack(spacing: 12) {
                        Image("Home")
                            .resizable()
                            .frame(width: 20, height: 20)
                        if active == 0 {
                             Circle()
                            .fill(Color.red)
                            .frame(width: 5, height: 5)
                        }
                    }
                }
                .foregroundColor(self.active == 0 ?.red : .black)
                Spacer()
                Button(action: {
                    self.active = 1
                }) {
                    VStack(spacing: 12) {
                        Image("Search")
                            .resizable()
                            .frame(width: 20, height: 20)
                        if active == 1 {
                             Circle()
                            .fill(Color.red)
                            .frame(width: 5, height: 5)
                        }
                    }
                }
                .foregroundColor(self.active == 1 ?.red : .black)
                
                Spacer()
                Button(action: {
                    self.active = 2
                }) {
                    VStack(spacing: 12) {
                        Image("Chat")
                            .resizable()
                            .frame(width: 20, height: 20)
                        if active == 2 {
                             Circle()
                            .fill(Color.red)
                            .frame(width: 5, height: 5)
                        }
                    }
                }
                .foregroundColor(self.active == 2 ?.red : .black)
                Spacer()
                Button(action: {
                    self.active = 3
                }) {
                    VStack(spacing: 12) {
                        Image("Filter")
                            .resizable()
                            .frame(width: 20, height: 20)
                        if active == 3 {
                             Circle()
                            .fill(Color.red)
                            .frame(width: 5, height: 5)
                        }
                    }
                }
                .foregroundColor(self.active == 3 ?.red : .black)
                
            }
            .padding(.horizontal, 35)
            .padding(.top, 12)
            .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)!)
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.07), radius: 0, x: 0, y: -6)
            .animation(.default)
        }
        .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.top))
        .onAppear {
            self.indexing()
        }
    }
    
    
}

struct Type {
    var name: String
    var pic: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




struct Card: View {
    @Binding var data:Type
    var body: some View {
        VStack(spacing: 15){
            Image(self.data.pic)
                .resizable()
                .frame(width: (UIScreen.main.bounds.width - 45) / 2, height: 280)
                .cornerRadius(15)
            Text(self.data.name)
                .fontWeight(.semibold)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Play Now")
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(width: (UIScreen.main.bounds.width - 70) / 2)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .cornerRadius(10)
                
            }
            
        }
    }
}
