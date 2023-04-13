//
//  ScreenRecorderManager.swift
//  ScreenRecorderSwiftUI
//
//  Created by Sergey Nestroyniy on 13.04.2023.
//

import ReplayKit

class ScreenRecorderManager {
    
    static let shared = ScreenRecorderManager()
    
    private init () {}
    
    func startScreenRecording(withMicrophone: Bool = true, completion: @escaping (Error?) -> Void ) {
        let recorder = RPScreenRecorder.shared()
        
        recorder.isMicrophoneEnabled = withMicrophone
        recorder.startRecording(handler: completion)
    }
    
    //with return video-file url
    func stopScreenRecording(withCustomURL: URL? = nil, completion: @escaping (Result<URL, Error>) -> Void) {
        let recorder = RPScreenRecorder.shared()
        var url: URL
        
        if let withCustomURL {
            url = withCustomURL
        } else {
            let fileName = UUID().uuidString + ".mov"
            url = FileManager.default.temporaryDirectory.appendingPathComponent(fileName)
        }
        
        recorder.stopRecording(withOutput: url) { error in
            if let error = error {
                print(error.localizedDescription)
                completion(.failure(error))
                return
            } else {
                print(url)
                completion(.success(url))
            }
                
        }
    }

}
