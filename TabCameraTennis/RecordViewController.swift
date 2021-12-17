//
//  RecordViewController.swift
//  TabCameraTennis
//
//  Created by Amit Gupta on 12/14/21.
//

import UIKit
import MobileCoreServices

class RecordViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Just loaded Record screen")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func record(_ sender: AnyObject) {
        print("Just hit Record")
      VideoHelper.startMediaBrowser(delegate: self, sourceType: .camera)
    }
    
    @objc func video(
      _ videoPath: String,
      didFinishSavingWithError error: Error?,
      contextInfo info: AnyObject
    ) {
      let title = (error == nil) ? "Success" : "Error"
      let message = (error == nil) ? "Video was saved" : "Video failed to save"

      let alert = UIAlertController(
        title: title,
        message: message,
        preferredStyle: .alert)
      alert.addAction(UIAlertAction(
        title: "OK",
        style: UIAlertAction.Style.cancel,
        handler: nil))
      present(alert, animated: true, completion: nil)
    }
    

}


// MARK: - UIImagePickerControllerDelegate
extension RecordViewController: UIImagePickerControllerDelegate {
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
  ) {
    dismiss(animated: true, completion: nil)
    
    guard
      let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String,
      mediaType == (kUTTypeMovie as String),
      // 1
      let url = info[UIImagePickerController.InfoKey.mediaURL] as? URL,
      // 2
      UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
      else { return }
    
    // 3
    UISaveVideoAtPathToSavedPhotosAlbum(
      url.path,
      self,
      #selector(video(_:didFinishSavingWithError:contextInfo:)),
      nil)
  }

}

// MARK: - UINavigationControllerDelegate
extension RecordViewController: UINavigationControllerDelegate {
}

