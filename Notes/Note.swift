//
//  Note.swift
//  AimList
//
//  Created by mac on 07.04.2023.
//

import SwiftUI

struct Note: Identifiable{
var id = UUID() . uuidString
var note: String
var date: Date
var cardColor: Color
}
func getSampleDate(offset: Int)->Date{
    let calender = Calendar.current
    let date = calender.date(byAdding: .day, value: offset, to: Date ())
    return date ?? Date()
}
var notes: [Note] = [
    Note (note: "“Your worth consists in what you are and not in what you have.☺️”", date:
    getSampleDate(offset: 1) , cardColor: Color ("Notes 1")),
    Note (note: "“Be yourself; everyone else is already taken.😜”", date:
    getSampleDate (offset: -10), cardColor: Color("Notes 2")),
    Note (note: "“What you do speaks so loudly that I cannot hear what you say.👽”", date:
    getSampleDate (offset: -15), cardColor: Color ("Notes 3")) ,
    Note (note: "There are two ways of spreading light: to be the candle or the mirror that reflects it.😎", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 4")),
    Note (note: "“As a well-spent day brings happy sleep, so a life well spent brings happy death.”😱", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 2")),
    Note (note: "Perhaps one day I will be better day", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 1")),
    Note (note: "Experience is a hard teacher because she gives the test first, the lesson afterwards.", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 5")),
    Note (note: "I never dreamed about success. I worked for it.", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 3")),
    Note (note: "Learn as if you will live forever, live like you will die tomorrow.", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 4")),
    Note (note: "When you change your thoughts, remember to also change your world.", date:
    getSampleDate(offset: 10), cardColor: Color ("Notes 2")),
    Note (note: "“If you tell the truth, you don’t have to remember anything.”🫣", date: getSampleDate (offset:
    -3), cardColor: Color ("Notes 5")),
  

]
