//
//  CharacteristicPropertyView.swift
//  BleFrame
//
//  Created by Jack Phan on 8/24/23.
//

import SwiftUI
import Foundation
import CoreBluetooth

struct CharacteristicPropertyView: View {
    
    @StateObject public var oneChar: UserBleCharacteristic
    
    var body: some View {
        
        Text("Chars: \(oneChar.characteristicName)")
        Text(" \(oneChar.uuid.uuidString)")

        Spacer().frame(height: 20)
        // MARK: - Chars property permission
        Grid(horizontalSpacing: 70, verticalSpacing: 10) {
                    
            GridRow {
                Text("Readable").gridColumnAlignment(.trailing)
                if isCharsReadable() { Text("Yes") }
                else { Text("No") }

            }

            GridRow {
                Text("Writeable").gridColumnAlignment(.trailing)
                if isCharsWriteable() { Text("Yes") }
                else { Text("No") }

            }
            
            GridRow {
                Text("Notification").gridColumnAlignment(.trailing)
                if isCharsNotification() { Text("Yes") }
                else { Text("No") }

            }

        }
        
        // MARK: - end: Chars properties
        
        Spacer()
    }
    
    func isCharsReadable() -> Bool {
        
        if(oneChar.characteristic.properties.rawValue &
           CBCharacteristicProperties.read.rawValue) == 0 {
            return false
        }
        else {
            return true
        }
    }
    
    func isCharsWriteable() -> Bool {
        
        if(oneChar.characteristic.properties.rawValue &
           CBCharacteristicProperties.write.rawValue) == 0 {
            return false
        }
        else {
            return true
        }
    }
    
    func isCharsNotification() -> Bool {
        
        if(oneChar.characteristic.properties.rawValue &
           CBCharacteristicProperties.notify.rawValue) == 0 {
            return false
        }
        else {
            return true
        }
    }
}

