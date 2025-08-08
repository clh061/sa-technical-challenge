//
//  ContentView.swift
//  CHoskinsTechChallenge
//
//  Created by Christopher Hoskins on 8/6/25.
//

import SwiftUI
import IterableSDK

struct ContentView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Iterable Tech Challenge")
                .font(.title)
                .padding()

            // Button 1 - Update user data
                Button("Update User Data") {
                    setCustomUserData()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)

                // Button 2 - Track custom event
                Button("Send Custom Event") {
                    trackCustomEvent()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }

    func setCustomUserData() {
        let dataField: [String: Any] = [
            "firstName": "Chris",
            "isRegisteredUser": true,
            "SA_User_Test_Key": "completed"
        ]

        IterableAPI.updateUser(dataField,
                               mergeNestedObjects: false,
                               onSuccess: myUserUpdateSuccessHandler,
                               onFailure: myUserUpdateFailureHandler)
    }
    
    func trackCustomEvent() {
          let event = "mobileSATestEvent"
          let dataFields: [String: Any] = [
              "platform": "iOS",
              "isTestEvent": true,
              "url": "https://iterable.com/sa-test/Chris",
              "secret_code_key": "Code_123"
          ]

        IterableAPI.track(event: event, dataFields: dataFields)
      }
    
    func myUserUpdateSuccessHandler(data: [AnyHashable: Any]?) -> () {
        print("Successfully sent user update request to Iterable")
    }

    func myUserUpdateFailureHandler(reason: String?, data: Data?) -> () {
        print("Failure sending user update request to Iterable")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
