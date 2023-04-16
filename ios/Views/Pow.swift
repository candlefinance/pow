//
//  PowExample.swift
//  test-swiftui
//
//  Created by Gary Tokman on 4/13/23.
//

import SwiftUI
import Pow
import Combine

struct PowUIView: View {
    
    @ObservedObject var props: Props
    
    @State var localValue = ""
    @State var localSize = CGSize.zero
    
    func animationView(lessThanZero: Bool) -> some View {
        Text(localValue)
            .foregroundColor(lessThanZero ? Color.red : Color.green)
            .shadow(color: (lessThanZero ? Color.red : Color.green).opacity(0.4), radius: 0.5, y: 0.5)
    }
    
    var body: some View {
        ZStack {
            let lessThanZero = localValue.contains("-")
            let pick = SoundEffect(
                lessThanZero ? "drip.falling" : "drip.rising"
            )
            Label {
                Text(localValue)
                    .monospacedDigit()
                    .changeEffect(
                        props.type == .rise
                        ? .rise { animationView(lessThanZero: lessThanZero) }
                        : .spray { animationView(lessThanZero: lessThanZero) },
                        value: localValue
                    )
                    .changeEffect(props.noSound ?
                        .feedback(hapticImpact: .medium) :
                            .feedback(pick), value: localValue)
                    .font(.system(size: 18, design: .rounded))
            } icon: {
                Image(systemName: "arrow.up.forward")
                    .foregroundStyle(lessThanZero ? Color.red : Color.green)
                    .rotationEffect(.degrees(lessThanZero ? -180 : 0))
            }
            .background(
                Color.gray.opacity(0.0001)
                    .frame(width: localSize.width, height: localSize.height)
            )
        }
        .onTapGesture {
            props.toggle.toggle()
        }
        .onReceive(props.$size) { value in
            withAnimation(.movingParts.overshoot(duration: 0.4)) {
                localSize = value
            }
        }
        .onReceive(props.$value) { value in
            withAnimation(.movingParts.overshoot(duration: 0.4)) {
                localValue = value
            }
        }
    }
}
