//
//  ContentView.swift
//  DemoCharts
//
//  Created by Rahat Pasha on 11/02/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    @State private var landscapeOrientation = false
    var data: [MountPrice] = [
            MountPrice(mount: "1", value: 10000),
            MountPrice(mount: "2", value: 30000),
            MountPrice(mount: "3", value: 15000),
            MountPrice(mount: "4", value: 19000),
            MountPrice(mount: "5", value: 22000),
            MountPrice(mount: "6", value: 35000),
            MountPrice(mount: "7", value: 40000)
        ]
            
    var body: some View {
        
        NavigationView{
            
            VStack {
                HStack {
                    
                    if landscapeOrientation {
                        Button(action: {
                            AppDelegate.orientationLock = .portrait
                            landscapeOrientation.toggle()
                        }) {
                            // Button label with just an image
                            Image("cut")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .padding()
                        }
                    }
                    Text(!landscapeOrientation ? "Welcome to Charts" : "Charts Detail")
                        .padding()
                }
                Chart(data) {
                    BarMark(
                        x: .value("Mount", $0.mount),
                        y: .value("Value", $0.value),
                        width: 10
                        
                    )
                    .foregroundStyle(
                        Color(hex: "#1590B7")!
                    )
                    .annotation(position: .overlay, alignment: .center) {
                        Image("rectangle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 10)
                    }
                }
                .padding(30)
                .lineSpacing(30)
                .chartForegroundStyleScale([
                    "Total amount" : Color(hex: "#1590B7")!,
                    "Avarege price": Color(hex: "#7AAE50")!])
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                //.chartYScale(domain: 0...50000)
                
                .frame(height: 300)
                if !landscapeOrientation {
                    Button("view the details"){
                        AppDelegate.orientationLock = .landscape
                        landscapeOrientation.toggle()
                    }
                    .frame(width: 140,height: 40)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(10)
                }
            }
            .border(.gray, width: 0.5)
            .cornerRadius(5)
            .padding(10)
        }
        .safeAreaPadding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .navigationBarHidden(false)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView()
}

