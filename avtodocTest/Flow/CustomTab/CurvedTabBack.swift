//
//  CurvedTabBack.swift
//  avtodocTest
//
//  Created by Maksim Ponomarev on 13/07/2022.
//

import SwiftUI

struct CurvedTabBack: View {
    
    var body: some View {
    
        Path {
            path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 0))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.width, y: 55))
            path.addArc(center: CGPoint(x: UIScreen.main.bounds.width/2, y: 55), radius: 30, startAngle: .zero, endAngle: .init(degrees: 180), clockwise: true)
            path.addLine(to: CGPoint(x: 0, y: 55))
        }.fill(Color.white)
            .rotationEffect(.init(degrees: 180))
            
    }
}

struct CurvedTabBack_Previews: PreviewProvider {
    static var previews: some View {
        CurvedTabBack()
    }
}
