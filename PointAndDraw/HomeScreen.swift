//
//  HomeScreen.swift
//  PointToDraw
//
//  Created by Simon Drake on 10/07/2020.
//  Copyright © 2020 Simon Drake. All rights reserved.
//

import SwiftUI
import ColorPicker

struct ImageOverlay: View {
    var body: some View {
        ZStack (alignment: .center) {
            Text("Play")
                .font(.callout)
                .foregroundColor(.white)
                .padding(.trailing)
        }
    }
}

struct HomeScreen: View {
    @State var color = UIColor.red
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center) {
                  Text("Choose your background color").foregroundColor(Color(self.color))

                ColorPicker(color: $color, strokeWidth: 30)
                .frame(width: 300, height: 300, alignment: .center)
                
                NavigationLink(destination: GameScreen(color: color)){
                    ZStack {
                        Image("play")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .overlay(ImageOverlay(), alignment: .center)
                        }
                    }
                }.buttonStyle(PlainButtonStyle())

                Spacer()
        }
        // Don't show detailed view on iPad
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
            HomeScreen()
    }
}
