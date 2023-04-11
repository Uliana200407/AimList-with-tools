//
//  ArtView.swift
//  AimList
//
//  Created by mac on 04.04.2023.
//

import SwiftUI


struct Line {
   
    var points = [CGPoint]()
    var color: Color = .red
    var lineWidth: Double = 1.0
}
struct ArtView: View {
    @State private var currentLine = Line()
    @State private var lines: [Line]=[]
    @State private var thickness: Double = 0.0
    var body: some View {
        VStack{
            Canvas{ context, size in
                for line in lines{
                    var path = Path()
                    path.addLines(line.points)
                    context.stroke(path, with: .color(line.color), lineWidth:
                                    line.lineWidth)
                }
            }.frame(minWidth: 400,minHeight: 700)
                .gesture(DragGesture(minimumDistance: 0,coordinateSpace: .local)
                    .onChanged({value in
                        let newPoint = value.location
                        currentLine.points.append(newPoint)
                        self.lines.append(currentLine)
                    })
                        .onEnded({ value in
                            self.lines.append(currentLine)
                            self.currentLine = Line(points: [], color: currentLine.color, lineWidth: thickness)
                        })
                )
            HStack {
                Slider(value: $thickness, in: 1...20) {
                    Text("Thickness")
                }.frame(maxWidth: 50)
                    .onChange(of: thickness) { newThickness in
                        currentLine.lineWidth = newThickness
                        
                    }
                Divider()
                Colours(selectedColor: $currentLine.color)
                    . onChange (of: currentLine.color) { newColor in
                        print(newColor)
                        currentLine.color = newColor}
                
                        Button(action: {
                            lines.removeAll()
                            print("Clear button pressed")
                        }, label: {
                            Image(systemName: "trash")
                                .font(.system(size: 24)).foregroundColor(.black)
                        })
                        
                    
            }
        }  .padding()
            
       
    }
}

struct ArtView_Previews: PreviewProvider {
    static var previews: some View {
        ArtView()
    }
}
