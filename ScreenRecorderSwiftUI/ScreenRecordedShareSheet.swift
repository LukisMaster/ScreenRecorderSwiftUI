//
//  ScreenRecordedShareSheet.swift
//  ScreenRecorderSwiftUI
//
//  Created by Sergey Nestroyniy on 13.04.2023.
//

import SwiftUI

//for video file share sheet if needed
struct ScreenRecordedShareSheet: UIViewControllerRepresentable {
    
    var items: [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
         
    }
}
