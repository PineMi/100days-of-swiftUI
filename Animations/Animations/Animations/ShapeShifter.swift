//
//  ShapeShifter.swift
//  Animations
//
//  Created by Miguel Piñeiro on 30/10/25.
//

import SwiftUI

struct Burst: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        let outerRadius = min(rect.width, rect.height) / 2
        let innerRadius = outerRadius * 0.5
        
        let points = 8
        let angleIncrement = .pi * 2 / Double(points * 2)
        
        for i in 0..<(points * 2) {
            let angle = Double(i) * angleIncrement - (.pi / 2)
            
            let radius = (i % 2 == 0) ? outerRadius : innerRadius
            
            let x = center.x + cos(angle) * radius
            let y = center.y + sin(angle) * radius
            
            let point = CGPoint(x: x, y: y)
            
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        path.closeSubpath()
        return path
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()

        return path
    }
}

struct Diamond: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        path.closeSubpath()
        
        return path
    }
}

struct ShapeShifter: View {
    @State private var colorIndex = 0
    let colorList: [Color] = [.red, .blue, .yellow, .green, .orange, .black, .indigo, .pink, .cyan, .mint, .purple]
    
    @State private var shapeIndex = 0
    let shapeList: [AnyShape] = [
        AnyShape(Circle()),
        AnyShape(Capsule()),
        AnyShape(Rectangle()),
        AnyShape(Ellipse()),
        AnyShape(Triangle()),
        AnyShape(Diamond()),
        AnyShape(Burst())
    ]
    
    var body: some View {
        Button("Tap Me") {
            // Change Color
            if colorIndex < colorList.count - 1 {
                colorIndex += 1
            } else {
                colorIndex = 0
            }
            
            // Change Shape
            if shapeIndex < shapeList.count - 1 {
                shapeIndex += 1
            } else {
                shapeIndex = 0
            }
        }
        .padding(50)
        .background(colorList[colorIndex])
        .animation(.default, value: colorIndex)
        .foregroundStyle(.white)
        .clipShape(shapeList[shapeIndex])
        
    }
}

#Preview {
    ShapeShifter()
}
