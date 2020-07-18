//
//  GameScreen.swift
//  PointToDraw
//
//  Created by Simon Drake on 10/07/2020.
//  Copyright © 2020 Simon Drake. All rights reserved.
//

import UIKit
import SwiftUI

struct Painter: Identifiable {
    let id = UUID()
    var title: String
    var width: CGFloat
    var height: CGFloat
    var centre: CGPoint
}

struct GameScreen: View {
    @State var images = [Painter]()
    @State var title = "dog"
    @State var color = UIColor.red

    var body: some View {
        VStack {
            ZStack {
                Color(color)
                
                ForEach(self.images) { image in
                    Image(image.title)
                        .resizable()
                        .frame(width: image.width, height: image.height)
                        .position(x: image.centre.x, y: image.centre.y)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .global)
                    .onEnded({ value in
                        let centre = value.startLocation
                        
//                        let width = CGFloat(25 + (arc4random() % 50))
//                        let height = width
                        
                        self.images.append(Painter(title: self.title, width: 30, height: 30, centre: CGPoint(x: centre.x, y: centre.y)))
                    })
            )
            .edgesIgnoringSafeArea(.all)
            
            Spacer()

            HStack {
                Button(action: {
                    self.images = [Painter]()
                }) {
                    Text("clear")
                }
                
                Spacer()
                
                ForEach(["dog", "home", "horse", "road", "tree"], id: \.self) { img in
                   Button(action: {
                        self.title = img
                   }) {
                    Image(img)
                        .resizable()
                        .frame(width: 25, height: 25)
                   }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        
    }
}
    

struct GameScreen_Previews: PreviewProvider {
    static var previews: some View {
        GameScreen(color: UIColor.green)
    }
}
