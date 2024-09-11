//
//  QRView.swift
//  smac
//
//  Created by Sean Velasco on 9/11/24.
//

import SwiftUI

struct QRCodeView: View {
    let context = CIContext() // Core Image context to process images
    let filter = CIFilter.qrCodeGenerator() // QR Code generator filter
    
    var qrCodeImage: UIImage {
        // Input data for the QR code (e.g., a string)
        let data = Data("https://www.example.com".utf8)
        
        // Set the message to encode (data) into the filter
        filter.setValue(data, forKey: "inputMessage")
        
        // Generate the QR code as a CIImage
        if let outputImage = filter.outputImage {
            // Scale up the QR code to make it more readable
            let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10))
            
            // Convert the CIImage to a CGImage
            if let cgimg = context.createCGImage(transformedImage, from: transformedImage.extent) {
                // Finally, create a UIImage from the CGImage
                return UIImage(cgImage: cgimg)
            }
        }
        
        // If something goes wrong, return an empty image
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    var body: some View {
        // Use an Image view to display the generated QR code
        ZStack {
            RoundedRectangle(cornerRadius: 12.5)
                .fill(.white)
            Image(uiImage: qrCodeImage)
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .padding(4)
        }
        .aspectRatio(1, contentMode: .fit)
    }
}
