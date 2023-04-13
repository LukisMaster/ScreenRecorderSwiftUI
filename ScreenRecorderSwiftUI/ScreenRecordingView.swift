//
//  ScreenRecordingView.swift
//  ScreenRecorderSwiftUI
//
//  Created by Sergey Nestroyniy on 13.04.2023.
//

import SwiftUI

struct ScreenRecordingView: View {
    @StateObject var screenRecordingVM = ScreenRecordingViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                AnimatedImageView()
                Text("Hello, world!")
            }
            
            Button {
                if screenRecordingVM.screenRecording {
                    screenRecordingVM.stop()
                } else {
                    screenRecordingVM.start()
                }
                

                
            } label: {
                Image(systemName: "dot.circle.viewfinder")
                    .font(.largeTitle)
                    .foregroundColor(screenRecordingVM.screenRecording ? .gray : .red)
            }
            
        }
        .font(.largeTitle)
        .padding()
        .sheet(isPresented: $screenRecordingVM.showRecordedVideo) {
            ScreenRecordedShareSheet(items: screenRecordingVM.sharedVideo)
        }
    }
}


struct AnimatedImageView: View {
    @State private var isAnimating = false
    
    var body: some View {
        Image(systemName: "star.fill")
            .foregroundColor(.yellow)
            .scaleEffect(isAnimating ? 1.5 : 1.0)
            .onAppear() { isAnimating = true }
            .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: isAnimating)
    }
}

struct ScreenRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenRecordingView()
    }
}
