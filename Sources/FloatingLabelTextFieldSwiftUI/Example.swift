    //
    //  ContentView.swift
    //  Example
    //
    //  Created by KISHAN_RAJA on 10/05/20.
    //  Copyright © 2020 KISHAN_RAJA. All rights reserved.
    //

import SwiftUI


struct ContentView: View {

    @State private var firstName: String = ""
    @State private var isValidFirstName: Bool = true
    
    @State private var lastName: String = ""
    @State private var isValidLastName: Bool = false

    @State private var mobileNumber: String = ""
    @State private var email: String = ""
    @State private var isValidEmail: Bool = false
    @State private var password: String = ""
    @State private var date: Date = Date()
    @State private var birthDate: String = ""
    @State private var showDatePicker: Bool = false
    
    @State private var isPasswordShow: Bool = false
    
    @State private var notes: String = ""
    
    private var selectedDate: Binding<Date> {
        Binding<Date>(get: { self.date}, set : {
            self.date = $0
            self.setDateFormatterString()
        })
    }
    
    private func setDateFormatterString() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd - MMMM, yyyy"
        
        self.birthDate = formatter.string(from: self.date)
    }
    
    
    var body: some View {
        VStack {
            
                FloatingLabelTextField($firstName, validtionChecker: $isValidFirstName, placeholder: "First Name")
                //.addDisableEditingAction([.all])
                .isShowError(true)
                .addValidations([
                    .init(condition: !firstName.isEmpty, errorMessage: "Invalid Name"),
                    .init(condition: firstName.count >= 2, errorMessage: "Minimum two character long")
                ])
        
                .isRequiredField(true, with: "Name field is required")
                //.floatingStyle(ThemeTextFieldStyle())
                //.modifier(ThemeTextField())
            FloatingLabelTextField($lastName, validtionChecker: $isValidLastName, placeholder: "First Name")
            
            
            Button(action: {
                if firstName.isEmpty{
                    isValidFirstName = false
                }
               // self.endEditing(true)
                
                print("First Name--->", isValidFirstName)
                print("Last Name--->", isValidLastName)
                print("Email--->", isValidEmail)
                
                if isValidFirstName {
                    print("Valid field")
                    
                } else {
                    print("Invalid field")
                }
                
            }) {
                Text("Create")
            }
            .buttonStyle(CreateButtonStyle())
            Spacer()
        }
        
        .padding()
        
    }
    
}

    //MARK: Create floating style
struct ThemeTextFieldStyle: FloatingLabelTextFieldStyle {
    func body(content: FloatingLabelTextField) -> FloatingLabelTextField {
        content.titleColor(.black)
    }
}

struct ThemeTextFieldStyle2: FloatingLabelTextFieldStyle {
    func body(content: FloatingLabelTextField) -> FloatingLabelTextField {
        content.titleColor(.black).errorColor(.init(UIColor.green))
    }
}

    //MARK: ViewModifier
struct ThemeTextField: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(height: 80)
    }
}

    //MARK: Button style
struct CreateButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding()
            .background(Color.orange)
            .cornerRadius(10.0)
    }
}

    //MARK: Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
