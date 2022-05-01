//
//  SpinnerView.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import SwiftUI

struct SpinnerView: View {
    
    @State var isSpinning: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.2), lineWidth: Constants.lineWidth)
            
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.weldonBlue, style: StrokeStyle(lineWidth: Constants.lineWidth, lineCap: .round))
                .rotationEffect(Angle(degrees: isSpinning ? Constants.maxAngle : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isSpinning)
                .onAppear() {
                    DispatchQueue.main.async {
                        self.isSpinning = true
                    }
                }
            
        }.frame(width: Constants.size, height: Constants.size)
    }
    
    private enum Constants {
        static let maxAngle: Double = 360
        static let size: CGFloat = 96
        static let lineWidth: CGFloat = 6
    }
}

struct SpinnerView_Previews: PreviewProvider {
    static var previews: some View {
        SpinnerView()
    }
}
