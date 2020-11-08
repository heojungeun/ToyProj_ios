//
//  CameraViewController.swift
//  InstagramFeedcam
//
// ref. https://medium.com/@anuragajwani/how-to-process-images-real-time-from-the-ios-camera-9c416c531749


import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    
    private let captureSession = AVCaptureSession()
    private lazy var previewLayer: AVCaptureVideoPreviewLayer = {
        let preview = AVCaptureVideoPreviewLayer(session: self.captureSession)
        preview.videoGravity = .resizeAspect
        return preview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.addCameraInput()
        self.addPreviewLayer()
        self.captureSession.startRunning()
    }

    private func addCameraInput(){
        let device = AVCaptureDevice.default(for: .video)!
        let cameraInput = try! AVCaptureDeviceInput(device: device)
        self.captureSession.addInput(cameraInput)
    }
    
    private func addPreviewLayer(){
        self.view.layer.addSublayer(self.previewLayer)
    }
}
