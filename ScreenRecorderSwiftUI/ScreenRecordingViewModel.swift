//
//  ScreenRecordingViewModel.swift
//  ScreenRecorderSwiftUI
//
//  Created by Sergey Nestroyniy on 13.04.2023.
//

import Foundation

class ScreenRecordingViewModel: ObservableObject {
    @Published var screenRecording = false
    @Published var showRecordedVideo = false
    @Published var videoURL: URL?
    
    var sharedVideo : [URL] {
        var URLs : [URL] = []
        if let videoURL {
            URLs.append(videoURL)
        }
        return URLs
    }
    
    func start() {
        ScreenRecorderManager.shared.startScreenRecording { error in
            if let error {
                print(error.localizedDescription)
            } else {
                DispatchQueue.main.async { [weak self] in
                    self?.screenRecording.toggle()
                }
            }
            
        }
    }
    
    func stop() {
        ScreenRecorderManager.shared.stopScreenRecording { result in
            DispatchQueue.main.async { [weak self] in
                switch result {
                case .success(let url):
                    print(url)
                    self?.videoURL = url
                    self?.showRecordedVideo.toggle()
                case .failure(let error):
                    print(error.localizedDescription)
                }
                self?.screenRecording.toggle()
                
            }
            
        }
        
    }
    
}
