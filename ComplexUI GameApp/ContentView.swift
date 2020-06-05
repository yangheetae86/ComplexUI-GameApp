//
//  ContentView.swift
//  ComplexUI GameApp
//
//  Created by HEE TAE YANG on 2020/06/04.
//  Copyright © 2020 yht. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct Home: View {
    
    var body: some View{
        
        VStack {
            
            HStack {
                
                Text("Your chairs")
                    .font(.title)
                    .fontWeight(.bold)
//                    .foregroundColor(.white)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image(systemName: "line.horizontal.3.decrease")
                    
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            Card(data: data[0])
            
            Spacer()
        }
        .background(LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}

struct Card: View {
    
    var data: chairs
    
    var body: some View{
        
        HStack{
            
            Image(self.data.image)
            .resizable()
            .frame(width: UIScreen.main.bounds.width / 1.8)
            
            Spacer()
            
            VStack(spacing: 20){
                
                Spacer(minLength: 0)
                
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                .padding()
                .background(
                    ZStack{
                        self.data.color
                        Circle()
                            .stroke(Color.black.opacity(0.1), lineWidth: 5)
                        Circle()
                            .trim(from: 0, to: self.data.prices[0])
                            .stroke(Color.white, lineWidth: 5)
                    }
                )
                .clipShape(Circle())
                
                Image(systemName: "hammer.fill")
                    .foregroundColor(.white)
                .padding()
                .background(
                    ZStack{
                        self.data.color
                        Circle()
                            .stroke(Color.black.opacity(0.1), lineWidth: 5)
                        Circle()
                            .trim(from: 0, to: self.data.prices[1])
                            .stroke(Color.white, lineWidth: 5)
                    }
                    .rotationEffect(.init(degrees: -90))
                )
                .clipShape(Circle())
                
                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.white)
                .padding()
                .background(
                    ZStack{
                        self.data.color
                        Circle()
                            .stroke(Color.black.opacity(0.1), lineWidth: 5)
                        Circle()
                            .trim(from: 0, to: self.data.prices[2])
                            .stroke(Color.white, lineWidth: 5)
                    }
                    .rotationEffect(.init(degrees: -90))

                )
                .clipShape(Circle())
                
                Spacer(minLength: 0)
            }
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.2)
            .cornerRadius(25)
            // going to rate view in 3d angle...
            .rotation3DEffect(.init(degrees: 20), axis: (x: 0, y: -1, z: 0))
            // going to trim view..
            .padding(.vertical, 35)
            .padding(.vertical, 25)
        )
            .padding(.horizontal)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//sample data...

struct chairs: Identifiable {
    
    var id : Int
    var prices : [CGFloat]
    var image : String
    var name : String
    var color : Color
}

var data = [
    
    chairs(id: 0, prices: [0.5,0.4,0.2], image: "chair1", name: "no1", color: Color("Color")),
    chairs(id: 1, prices: [0.5,0.4,0.2], image: "chair2", name: "no2", color: Color("Color1")),
    chairs(id: 2, prices: [0.5,0.4,0.1], image: "chair3", name: "no3", color: Color("Color2"))
    
]

