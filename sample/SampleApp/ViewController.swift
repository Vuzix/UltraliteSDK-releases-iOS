//Copyright 2023, Vuzix Corporation
//All rights reserved.
//
//Redistribution and use in source and binary forms, with or without
//modification, are permitted provided that the following conditions
//are met:
//
//*  Redistributions of source code must retain the above copyright
//   notice, this list of conditions and the following disclaimer.
//
//*  Redistributions in binary form must reproduce the above copyright
//   notice, this list of conditions and the following disclaimer in the
//   documentation and/or other materials provided with the distribution.
//
//*  Neither the name of Vuzix Corporation nor the names of
//   its contributors may be used to endorse or promote products derived
//   from this software without specific prior written permission.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
//THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
//PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
//CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
//EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
//PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
//OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
//WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
//OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  ViewController.swift
//  SampleApp
//
//  The single biggest pitfall is forgetting to call commit().
//
//  Created by Vuzix on 9/19/23.
//



import UIKit
import UltraliteSDK

// Sample app that shows some basic drawing on the Vuzix Smart Glasses.
// Extends UltraliteBaseViewController, which makes it much easier to call simple things, like taking an Ultralite control, taps, on application leaving, disconnections, etc.  You dont have to extend UltraliteBaseViewController, it is just a quick and easy way to listen for all the callbacks.
class ViewController: UltraliteBaseViewController {
    
    // Handles to the text objects we create. Save reference handles to move, update, remove.
    private var textHandle: Int?
    private var tapTextHandle: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // timeout of the glasses display
        displayTimeout = 60
    }
    
    override func onAppLeave() {
        stopControl()
    }
    
    @IBAction func showPicker() {
        // show a pairing picker for user to connect to glasses
        showPairingPicker()
    }
    
    // Take control of the glasses.  Remember there could be another 3rd party app currently controlling the glasses.  The app in the foreground can take control away from someone else.
    override func startControl() {
        //UltraliteManager.shared.currentDevice?.setLayout(layout: .canvas, timeout: displayTimeout)
        // OR convience method startControl() on UltraliteBaseViewContoller
        
        if !isActive {
            super.startControl()
        }
    }
    
    // creates a text object with the text "Hello World" at dead center of display
    @IBAction func createHelloWorld(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        startControl()
        
        if let textHandle = textHandle {
           _ = device.canvas.removeText(id: textHandle)
        }
        
        self.textHandle = device.canvas.createText(text: "Hello World", textAlignment: .center, textColor: .white, anchor: .center, xOffset: 0, yOffset: 0)
        device.canvas.commit()
    }
    
    // move created text object to a random point
    @IBAction func moveHelloWorld(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice, let textHandle = textHandle else {
            return
        }
        
        let random = randomPoint()
        _ = device.canvas.moveText(id: textHandle, x: Int(random.x), y: Int(random.y))
        device.canvas.commit()
    }
    
    // removes created text object
    @IBAction func removeHelloWorld(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice, let textHandle = textHandle else {
            return
        }
        
        if device.canvas.removeText(id: textHandle) {
            self.textHandle = nil
        }
        device.canvas.commit()
    }
    
    // creates an animation in bottom right corner.  Three frames is the max.  Duration of the animation is 3 seconds.
    @IBAction func createAnimation(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        startControl()
        
        // SDK v0.5
        guard let image1 = UIImage(named: "wait1"), let image2 = UIImage(named: "wait2"), let image3 = UIImage(named: "wait3") else {
            return
        }
        // SDK v0.6
//        guard let image1 = UIImage(named: "wait1")?.cgImage, let image2 = UIImage(named: "wait2")?.cgImage, let image3 = UIImage(named: "wait3")?.cgImage else {
//            return
//        }
        let images = [image1, image2, image3]
        
        if device.canvas.createAnimation(images: images, anchor: .bottomRight, xOffset: 0, yOffset: 0, duration: 3000) {
            device.canvas.commit()
        }
    }
    
    
    // moves the animation to a random point
    @IBAction func moveAnimation(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        let randomPoint = randomPoint()
        if device.canvas.moveAnimation(x: Int(randomPoint.x), y: Int(randomPoint.y)) {
            device.canvas.commit()
        }
    }
    
    // remove the animation
    @IBAction func removeAninimation(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        if device.canvas.removeAninimation() {
            device.canvas.commit()
        }
    }
    
    // draws an image (glasses) and draws a rounded rectangle.
    @IBAction func drawBackground(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        startControl()
        
        let midx = (device.canvas.WIDTH / 2)
        let midy = (device.canvas.HEIGHT / 2)
        let rectWidth = 200
        let rectHeight = 40
        let rectX = midx - (rectWidth / 2)
        let rectY = midy - (rectHeight / 2)
        
        // SDK v0.5
        let color = UIColor.green
        // SDK v0.7
        //let color = UIColor.green.cgColor
        device.canvas.drawRect(x: rectX, y: rectY, width: rectWidth, height: rectHeight, cornerRadius: 6, borderWidth: 3, borderColor: color, fillColor: nil)
        
        //SDK V0.7
        //if let cgImage = UIImage(named: "glasses")?.cgImage {
        if let image = UIImage(named: "glasses"), let cgImage = image.cgImage {
            device.canvas.drawBackground(image: image, x: midx - (cgImage.width/2), y: midy + 100)
        }
        
        device.canvas.commit()
    }
    
    // clears all the screen from everything including background
    @IBAction func clearAll(sender: Any) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        startControl()
        
        device.canvas.clear(shouldClearBackground: true)
        device.canvas.commit()
    }
    
    // on detection of a single tap, displays the words "tap detected" for 4 seconds.
    override func onTap(notification: Notification) {
        guard let device = UltraliteManager.shared.currentDevice else {
            return
        }
        
        if let taps = notification.userInfo?["tap"] as? Int, taps == 1 {
            
            if let tapTextHandle = tapTextHandle {
                _ = device.canvas.removeText(id: tapTextHandle)
            }
            
            tapTextHandle = device.canvas.createText(text: "tap detected", textAlignment: .center, textColor: .white, anchor: .bottomCenter, xOffset: 0, yOffset: 0)
            device.canvas.commit()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4)) { [weak self] in
                if let tapTextHandle = self?.tapTextHandle {
                    _ = device.canvas.removeText(id: tapTextHandle)
                    device.canvas.commit()
                    self?.tapTextHandle = nil
                }
            }
        }
    }
    
    // random point
    func randomPoint() -> CGPoint {
        let x = Int.random(in: 0..<(640 - 100))
        let y = Int.random(in: 0..<(480 - 100))
        return CGPoint(x: x, y: y)
    }
}

