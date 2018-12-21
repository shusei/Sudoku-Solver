//
//  ViewController.swift
//  Sudoku Solver
//
//  Created by SHENG CHUN LIN on 2018/12/18.
//  Copyright © 2018 SHENG CHUN LIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnA1: UIButton!
    @IBOutlet weak var btnA2: UIButton!
    @IBOutlet weak var btnA3: UIButton!
    @IBOutlet weak var btnA4: UIButton!
    @IBOutlet weak var btnA5: UIButton!
    @IBOutlet weak var btnA6: UIButton!
    @IBOutlet weak var btnA7: UIButton!
    @IBOutlet weak var btnA8: UIButton!
    @IBOutlet weak var btnA9: UIButton!
    
    @IBOutlet weak var btnB1: UIButton!
    @IBOutlet weak var btnB2: UIButton!
    @IBOutlet weak var btnB3: UIButton!
    @IBOutlet weak var btnB4: UIButton!
    @IBOutlet weak var btnB5: UIButton!
    @IBOutlet weak var btnB6: UIButton!
    @IBOutlet weak var btnB7: UIButton!
    @IBOutlet weak var btnB8: UIButton!
    @IBOutlet weak var btnB9: UIButton!
    
    @IBOutlet weak var btnC1: UIButton!
    @IBOutlet weak var btnC2: UIButton!
    @IBOutlet weak var btnC3: UIButton!
    @IBOutlet weak var btnC4: UIButton!
    @IBOutlet weak var btnC5: UIButton!
    @IBOutlet weak var btnC6: UIButton!
    @IBOutlet weak var btnC7: UIButton!
    @IBOutlet weak var btnC8: UIButton!
    @IBOutlet weak var btnC9: UIButton!
    
    @IBOutlet weak var btnD1: UIButton!
    @IBOutlet weak var btnD2: UIButton!
    @IBOutlet weak var btnD3: UIButton!
    @IBOutlet weak var btnD4: UIButton!
    @IBOutlet weak var btnD5: UIButton!
    @IBOutlet weak var btnD6: UIButton!
    @IBOutlet weak var btnD7: UIButton!
    @IBOutlet weak var btnD8: UIButton!
    @IBOutlet weak var btnD9: UIButton!
    
    @IBOutlet weak var btnE1: UIButton!
    @IBOutlet weak var btnE2: UIButton!
    @IBOutlet weak var btnE3: UIButton!
    @IBOutlet weak var btnE4: UIButton!
    @IBOutlet weak var btnE5: UIButton!
    @IBOutlet weak var btnE6: UIButton!
    @IBOutlet weak var btnE7: UIButton!
    @IBOutlet weak var btnE8: UIButton!
    @IBOutlet weak var btnE9: UIButton!
    
    @IBOutlet weak var btnF1: UIButton!
    @IBOutlet weak var btnF2: UIButton!
    @IBOutlet weak var btnF3: UIButton!
    @IBOutlet weak var btnF4: UIButton!
    @IBOutlet weak var btnF5: UIButton!
    @IBOutlet weak var btnF6: UIButton!
    @IBOutlet weak var btnF7: UIButton!
    @IBOutlet weak var btnF8: UIButton!
    @IBOutlet weak var btnF9: UIButton!
    
    @IBOutlet weak var btnG1: UIButton!
    @IBOutlet weak var btnG2: UIButton!
    @IBOutlet weak var btnG3: UIButton!
    @IBOutlet weak var btnG4: UIButton!
    @IBOutlet weak var btnG5: UIButton!
    @IBOutlet weak var btnG6: UIButton!
    @IBOutlet weak var btnG7: UIButton!
    @IBOutlet weak var btnG8: UIButton!
    @IBOutlet weak var btnG9: UIButton!
    
    @IBOutlet weak var btnH1: UIButton!
    @IBOutlet weak var btnH2: UIButton!
    @IBOutlet weak var btnH3: UIButton!
    @IBOutlet weak var btnH4: UIButton!
    @IBOutlet weak var btnH5: UIButton!
    @IBOutlet weak var btnH6: UIButton!
    @IBOutlet weak var btnH7: UIButton!
    @IBOutlet weak var btnH8: UIButton!
    @IBOutlet weak var btnH9: UIButton!
    
    @IBOutlet weak var btnI1: UIButton!
    @IBOutlet weak var btnI2: UIButton!
    @IBOutlet weak var btnI3: UIButton!
    @IBOutlet weak var btnI4: UIButton!
    @IBOutlet weak var btnI5: UIButton!
    @IBOutlet weak var btnI6: UIButton!
    @IBOutlet weak var btnI7: UIButton!
    @IBOutlet weak var btnI8: UIButton!
    @IBOutlet weak var btnI9: UIButton!
    
    
    
    let rows = ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
    let cols = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    let squareR = [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"]]
    let squareC = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
    
    // boxes: individual squares at the intersection of rows and columns
    var boxes: [String] = []
    var row_units: [[String]] = []
    var column_units: [[String]] = []
    var square_units: [[String]] = []
    var unitlist: [[String]] = []
    // units: complete rows, columns, and 3x3 squares
    var units: Dictionary<String, [[String]]> = [:]
    // peers: those that belong to the same row, column, or 3x3 square
    var peers: Dictionary<String, [String]> = [:]
    
    // puzzle sudoku grid
    var grid: Dictionary<String, [String]> = [:]
    
    // boxes selected
    var cursor: String = ""
    
    var newTemp: Dictionary<String, [String]> = [:]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // def boxes
        boxes = cross(a: rows, b: cols)
        
        // def row units
        for r in rows {
            row_units.append(cross(a: r, b: cols))
        }
        
        // def column units
        for c in cols {
            column_units.append(cross(a: rows, b: c))
        }
        
        // def square units
        for rs in squareR {
            for cs in squareC {
                square_units.append(cross(a: rs, b: cs))
            }
        }
        
        // def unitlist
        unitlist = row_units + column_units + square_units
        
        // def units
        var temp: [[String]] = []
        for s in boxes {
            temp = []
            for u in unitlist {
                for x in u {
                    if s == x {
                        temp.append(u)
                        //NSLog(x)
                        break
                    }
                }
            }
            units[s] = temp
        }

        // def peers
        var temp2: [String] = []
        for s in boxes {
            temp2 = []
            temp2 = set(a: sum(a: units[s]!,b: []))
            var tmp = Set(temp2)
            tmp.remove(s)
            peers[s] = Array(tmp)
        }
        
        // def grid
        for s in boxes {
            grid[s] = [""]
        }
        
        
        
        /*
        for aa in peers["A1"] ?? [] {
            //for key in aa{
                NSLog(aa)
            //}
        }
        
        
        for ttt in unitlist {
            for pp in ttt {
                NSLog("unitlist="+pp)
            }
            NSLog("==================")
        }
        
        
        row_units = [cross(r, cols) for r in rows]
        column_units = [cross(rows, c) for c in cols]
        square_units = [cross(rs, cs) for rs in ('ABC','DEF','GHI') for cs in ('123','456','789')]
        unitlist = row_units + column_units + square_units
        units = dict((s, [u for u in unitlist if s in u]) for s in boxes)
        peers = dict((s, set(sum(units[s],[]))-set([s])) for s in boxes)
        */
    }
    
    // MARK: tool function
    func cross(a: Array<String>, b: Array<String>) -> Array<String> {
        var temp: [String] = []
        for s in a {
            for t in b {
                //NSLog("S="+s+" T="+t)
                temp.append(s+t)
            }
        }
        return temp
    }
    
    
    func cross(a: String, b: Array<String>) -> Array<String> {
        var temp: [String] = []
        for t in b {
            //NSLog("A="+a+" T="+t)
            temp.append(String(a)+t)
        }
        return temp
    }
    
    func cross(a: Array<String>, b: String) -> Array<String> {
        var temp: [String] = []
        for s in a {
            //NSLog("S="+s+" B="+b)
            temp.append(s+String(b))
        }
        return temp
    }
    
    func sum(a: [[String]], b: [String]) -> [String] {
        var temp: [String] = []
        for s in a {
            for t in s {
                temp.append(t)
            }
        }
        return temp
    }
    
    func set(a: [String]) -> [String] {
        return Array(Set(a))
    }
    
    func grid_values(values: Dictionary<String, [String]>) -> Dictionary<String, [String]> {
        var temp: Dictionary<String, [String]> = values
        for s in boxes {
            if temp[s] == [""] {
                temp[s] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
            }
        }
        return temp
    }
    
    func eliminate(values: Dictionary<String, [String]>) -> Dictionary<String, [String]> {
        var temp: Dictionary<String, [String]> = values
        var solved_values: [String] = []
        var digit: String = ""
        for box in temp.keys {
            if temp[box]!.count == 1 {
                
                //NSLog("temp["+box+"]="+temp[box]![0])
                
                solved_values.append(box)
            }
        }
        //NSLog("============================")
        for box in solved_values {
            //NSLog(box+":"+String(temp[box]!.count))
            
            if temp[box]!.count == 0 {
                temp = [:]
                NSLog("return empty in eliminate()")
                return temp
            }
            digit = temp[box]![0]
            for peer in peers[box]! {
                //if temp[peer]?.count != 1 {
                    temp[peer]!.removeAll { $0 == digit }
                //}
            }
        }
        return temp
    }
    /*
    solved_values = [box for box in values.keys() if len(values[box]) == 1]
    for box in solved_values:
    digit = values[box]
    for peer in peers[box]:
    values[peer] = values[peer].replace(digit,'')
    return values */
    
    func only_choice(values: Dictionary<String, [String]>) -> Dictionary<String, [String]> {
        var temp: Dictionary<String, [String]> = values
        var dplaces: [String] = []
        let tmp = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        /*
        if temp == [:] {
            NSLog("return empty in only_choice()")
            return temp
        } */
        
        for unit in unitlist {
            for digit in tmp {
                for box in unit {
                    for s in temp[box]! {
                        if digit == s {
                            dplaces.append(box)
                        }
                    }
                }
                if dplaces.count == 1 {
                    temp[dplaces[0]] = [digit]
                }
            }
        }
        return temp
    }
    /*
 for unit in unitlist:
 for digit in '123456789':
 dplaces = [box for box in unit if digit in values[box]]
 if len(dplaces) == 1:
 values[dplaces[0]] = digit
 return values */
    
    
    func reduce_puzzle(values: Dictionary<String, [String]>) -> Dictionary<String, [String]> {
        var temp: Dictionary<String, [String]> = values
        var temp2: Dictionary<String, [String]> = [:]
        var solved_values_before: Int = 0
        var solved_values_after: Int = 0
        var stalled = false
        
        while !stalled {
            solved_values_before = 0
            solved_values_after = 0
            
            for box in temp.keys {
                if temp[box]?.count == 1 {
                    solved_values_before += [box].count
                }
            }
            temp2 = eliminate(values: temp)
            if temp2 != [:] {
                temp = temp2
            }
            else {
                return [:]
            }
            temp = only_choice(values: temp)
            for box in temp.keys {
                if temp[box]?.count == 1 {
                    solved_values_after += [box].count
                }
            }
            //NSLog("before="+String(solved_values_before)+", after="+String(solved_values_after))
            if solved_values_before == solved_values_after {
                stalled = true
            }
            
            for box in values.keys {
                if values[box]?.count == 0 {
                    return [:]
                }
            }
        }
        
        
        return temp
    }
    /*
    solved_values = [box for box in values.keys() if len(values[box]) == 1]
    stalled = False
    while not stalled:
     solved_values_before = len([box for box in values.keys() if len(values[box]) == 1])
     values = eliminate(values)
     values = only_choice(values)
     solved_values_after = len([box for box in values.keys() if len(values[box]) == 1])
     stalled = solved_values_before == solved_values_after
     if len([box for box in values.keys() if len(values[box]) == 0]):
        return False
    return values */
    
    
    func search(values: Dictionary<String, [String]>) -> Bool {
        var temp: Dictionary<String, [String]> = [:]
        var solved_values: Int = 0
        var minKey: String = ""
        var minValue: Int = 9
        
        temp = reduce_puzzle(values: values)
        if temp != [:] {
            grid = temp
        }
        else {
            NSLog("reduce_puzzle() false")
            return false
        }
        
        solved_values = 0
        for box in grid.keys {
            if grid[box]?.count == 1 {
                solved_values += [box].count
            }
        }
        NSLog("solved values = "+String(solved_values))
        if solved_values == 81 {
            NSLog("true")
            return true
        }
        
        for s in boxes {
            if (grid[s]?.count)! > 1 {
                if grid[s]!.count < minValue {
                    minValue = grid[s]!.count
                    minKey = s
                }
            }
        }
        
        NSLog("n="+String(minValue)+" s="+minKey)
        for value in grid[minKey]! {
            newTemp = grid
            newTemp[minKey] = [value]
            if search(values: newTemp) {
                grid = newTemp
                NSLog("true")
                return true
            }
            
            /*
            solved_values = 0
            for box in grid.keys {
                if grid[box]?.count == 1 {
                    solved_values += [box].count
                }
            }
            if solved_values == 81 {
                NSLog("true")
                return true
            }*/
        }
        NSLog("false")
        return false
    }
    /*
    n,s = min((len(values[s]), s) for s in boxes if len(values[s]) > 1)
    # Now use recurrence to solve each one of the resulting sudokus, and
    for value in values[s]:
    new_sudoku = values.copy()
    new_sudoku[s] = value
    attempt = search(new_sudoku)
    if attempt:
    return attempt */

    func display() -> Void {
        btnA1.setTitle(grid["A1"]![0], for: .normal)
        btnA2.setTitle(grid["A2"]![0], for: .normal)
        btnA3.setTitle(grid["A3"]![0], for: .normal)
        btnA4.setTitle(grid["A4"]![0], for: .normal)
        btnA5.setTitle(grid["A5"]![0], for: .normal)
        btnA6.setTitle(grid["A6"]![0], for: .normal)
        btnA7.setTitle(grid["A7"]![0], for: .normal)
        btnA8.setTitle(grid["A8"]![0], for: .normal)
        btnA9.setTitle(grid["A9"]![0], for: .normal)
        
        btnB1.setTitle(grid["B1"]![0], for: .normal)
        btnB2.setTitle(grid["B2"]![0], for: .normal)
        btnB3.setTitle(grid["B3"]![0], for: .normal)
        btnB4.setTitle(grid["B4"]![0], for: .normal)
        btnB5.setTitle(grid["B5"]![0], for: .normal)
        btnB6.setTitle(grid["B6"]![0], for: .normal)
        btnB7.setTitle(grid["B7"]![0], for: .normal)
        btnB8.setTitle(grid["B8"]![0], for: .normal)
        btnB9.setTitle(grid["B9"]![0], for: .normal)
        
        btnC1.setTitle(grid["C1"]![0], for: .normal)
        btnC2.setTitle(grid["C2"]![0], for: .normal)
        btnC3.setTitle(grid["C3"]![0], for: .normal)
        btnC4.setTitle(grid["C4"]![0], for: .normal)
        btnC5.setTitle(grid["C5"]![0], for: .normal)
        btnC6.setTitle(grid["C6"]![0], for: .normal)
        btnC7.setTitle(grid["C7"]![0], for: .normal)
        btnC8.setTitle(grid["C8"]![0], for: .normal)
        btnC9.setTitle(grid["C9"]![0], for: .normal)
        
        btnD1.setTitle(grid["D1"]![0], for: .normal)
        btnD2.setTitle(grid["D2"]![0], for: .normal)
        btnD3.setTitle(grid["D3"]![0], for: .normal)
        btnD4.setTitle(grid["D4"]![0], for: .normal)
        btnD5.setTitle(grid["D5"]![0], for: .normal)
        btnD6.setTitle(grid["D6"]![0], for: .normal)
        btnD7.setTitle(grid["D7"]![0], for: .normal)
        btnD8.setTitle(grid["D8"]![0], for: .normal)
        btnD9.setTitle(grid["D9"]![0], for: .normal)
        
        btnE1.setTitle(grid["E1"]![0], for: .normal)
        btnE2.setTitle(grid["E2"]![0], for: .normal)
        btnE3.setTitle(grid["E3"]![0], for: .normal)
        btnE4.setTitle(grid["E4"]![0], for: .normal)
        btnE5.setTitle(grid["E5"]![0], for: .normal)
        btnE6.setTitle(grid["E6"]![0], for: .normal)
        btnE7.setTitle(grid["E7"]![0], for: .normal)
        btnE8.setTitle(grid["E8"]![0], for: .normal)
        btnE9.setTitle(grid["E9"]![0], for: .normal)
        
        btnF1.setTitle(grid["F1"]![0], for: .normal)
        btnF2.setTitle(grid["F2"]![0], for: .normal)
        btnF3.setTitle(grid["F3"]![0], for: .normal)
        btnF4.setTitle(grid["F4"]![0], for: .normal)
        btnF5.setTitle(grid["F5"]![0], for: .normal)
        btnF6.setTitle(grid["F6"]![0], for: .normal)
        btnF7.setTitle(grid["F7"]![0], for: .normal)
        btnF8.setTitle(grid["F8"]![0], for: .normal)
        btnF9.setTitle(grid["F9"]![0], for: .normal)
        
        btnG1.setTitle(grid["G1"]![0], for: .normal)
        btnG2.setTitle(grid["G2"]![0], for: .normal)
        btnG3.setTitle(grid["G3"]![0], for: .normal)
        btnG4.setTitle(grid["G4"]![0], for: .normal)
        btnG5.setTitle(grid["G5"]![0], for: .normal)
        btnG6.setTitle(grid["G6"]![0], for: .normal)
        btnG7.setTitle(grid["G7"]![0], for: .normal)
        btnG8.setTitle(grid["G8"]![0], for: .normal)
        btnG9.setTitle(grid["G9"]![0], for: .normal)
        
        btnH1.setTitle(grid["H1"]![0], for: .normal)
        btnH2.setTitle(grid["H2"]![0], for: .normal)
        btnH3.setTitle(grid["H3"]![0], for: .normal)
        btnH4.setTitle(grid["H4"]![0], for: .normal)
        btnH5.setTitle(grid["H5"]![0], for: .normal)
        btnH6.setTitle(grid["H6"]![0], for: .normal)
        btnH7.setTitle(grid["H7"]![0], for: .normal)
        btnH8.setTitle(grid["H8"]![0], for: .normal)
        btnH9.setTitle(grid["H9"]![0], for: .normal)
        
        btnI1.setTitle(grid["I1"]![0], for: .normal)
        btnI2.setTitle(grid["I2"]![0], for: .normal)
        btnI3.setTitle(grid["I3"]![0], for: .normal)
        btnI4.setTitle(grid["I4"]![0], for: .normal)
        btnI5.setTitle(grid["I5"]![0], for: .normal)
        btnI6.setTitle(grid["I6"]![0], for: .normal)
        btnI7.setTitle(grid["I7"]![0], for: .normal)
        btnI8.setTitle(grid["I8"]![0], for: .normal)
        btnI9.setTitle(grid["I9"]![0], for: .normal)
    }

    // MARK: button function
    // Button start&clear
    @IBAction func btnStart(_ sender: UIButton) {
        cursor = ""
        
        grid = grid_values(values: grid)
        
        if search(values: grid) {
            display()
        }
        
        /*
        for s in grid["A1"]! {
            NSLog(s)
        } */
        
        //NSLog(grid["A2"]![0]+" "+grid["A2"]![01])
    }
    @IBAction func btnClear(_ sender: UIButton) {
        for s in boxes {
            grid[s] = [""]
        }
        display()
    }
    @IBAction func btnExample1(_ sender: UIButton) {
        grid["A3"] = ["3"]
        grid["A5"] = ["2"]
        grid["A7"] = ["6"]
        grid["B1"] = ["9"]
        grid["B4"] = ["3"]
        grid["B6"] = ["5"]
        grid["B9"] = ["1"]
        grid["C3"] = ["1"]
        grid["C4"] = ["8"]
        grid["C6"] = ["6"]
        grid["C7"] = ["4"]
        grid["D3"] = ["8"]
        grid["D4"] = ["1"]
        grid["D6"] = ["2"]
        grid["D7"] = ["9"]
        grid["E1"] = ["7"]
        grid["E9"] = ["8"]
        grid["F3"] = ["6"]
        grid["F4"] = ["7"]
        grid["F6"] = ["8"]
        grid["F7"] = ["2"]
        grid["G3"] = ["2"]
        grid["G4"] = ["6"]
        grid["G6"] = ["9"]
        grid["G7"] = ["5"]
        grid["H1"] = ["8"]
        grid["H4"] = ["2"]
        grid["H6"] = ["3"]
        grid["H9"] = ["9"]
        grid["I3"] = ["5"]
        grid["I5"] = ["1"]
        grid["I7"] = ["3"]
        display()
    }
    @IBAction func btnExample2(_ sender: UIButton) {
        grid["A1"] = ["4"]
        grid["A7"] = ["8"]
        grid["A9"] = ["5"]
        grid["B2"] = ["3"]
        grid["C4"] = ["7"]
        grid["D2"] = ["2"]
        grid["D8"] = ["6"]
        grid["E5"] = ["8"]
        grid["E7"] = ["4"]
        grid["F5"] = ["1"]
        grid["G4"] = ["6"]
        grid["G6"] = ["3"]
        grid["G8"] = ["7"]
        grid["H1"] = ["5"]
        grid["H4"] = ["2"]
        grid["I1"] = ["1"]
        grid["I3"] = ["4"]
        display()
    }
    
    
    // Button A
    @IBAction func bntA1(_ sender: UIButton) {
        //NSLog("boxes[20]="+boxes[20])
        cursor = "A1"
    }
    @IBAction func bntA2(_ sender: UIButton) {
        cursor = "A2"
    }
    @IBAction func bntA3(_ sender: UIButton) {
        cursor = "A3"
    }
    @IBAction func bntA4(_ sender: UIButton) {
        cursor = "A4"
    }
    @IBAction func bntA5(_ sender: UIButton) {
        cursor = "A5"
    }
    @IBAction func bntA6(_ sender: UIButton) {
        cursor = "A6"
    }
    @IBAction func bntA7(_ sender: UIButton) {
        cursor = "A7"
    }
    @IBAction func bntA8(_ sender: UIButton) {
        cursor = "A8"
    }
    @IBAction func bntA9(_ sender: UIButton) {
        cursor = "A9"
    }
    
    // Button B
    @IBAction func btnB1(_ sender: Any) {
        cursor = "B1"
    }
    @IBAction func btnB2(_ sender: Any) {
        cursor = "B2"
    }
    @IBAction func btnB3(_ sender: Any) {
        cursor = "B3"
    }
    @IBAction func btnB4(_ sender: Any) {
        cursor = "B4"
    }
    @IBAction func btnB5(_ sender: Any) {
        cursor = "B5"
    }
    @IBAction func btnB6(_ sender: Any) {
        cursor = "B6"
    }
    @IBAction func btnB7(_ sender: Any) {
        cursor = "B7"
    }
    @IBAction func btnB8(_ sender: Any) {
        cursor = "B8"
    }
    @IBAction func btnB9(_ sender: Any) {
        cursor = "B9"
    }
    
    // Button C
    @IBAction func btnC1(_ sender: Any) {
        cursor = "C1"
    }
    @IBAction func btnC2(_ sender: Any) {
        cursor = "C2"
    }
    @IBAction func btnC3(_ sender: Any) {
        cursor = "C3"
    }
    @IBAction func btnC4(_ sender: Any) {
        cursor = "C4"
    }
    @IBAction func btnC5(_ sender: Any) {
        cursor = "C5"
    }
    @IBAction func btnC6(_ sender: Any) {
        cursor = "C6"
    }
    @IBAction func btnC7(_ sender: Any) {
        cursor = "C7"
    }
    @IBAction func btnC8(_ sender: Any) {
        cursor = "C8"
    }
    @IBAction func btnC9(_ sender: Any) {
        cursor = "C9"
    }
    
    // Button D
    @IBAction func btnD1(_ sender: Any) {
        cursor = "D1"
    }
    @IBAction func btnD2(_ sender: Any) {
        cursor = "D2"
    }
    @IBAction func btnD3(_ sender: Any) {
        cursor = "D3"
    }
    @IBAction func btnD4(_ sender: Any) {
        cursor = "D4"
    }
    @IBAction func btnD5(_ sender: Any) {
        cursor = "D5"
    }
    @IBAction func btnD6(_ sender: Any) {
        cursor = "D6"
    }
    @IBAction func btnD7(_ sender: Any) {
        cursor = "D7"
    }
    @IBAction func btnD8(_ sender: Any) {
        cursor = "D8"
    }
    @IBAction func btnD9(_ sender: Any) {
        cursor = "D9"
    }
    
    // Button E
    @IBAction func btnE1(_ sender: Any) {
        cursor = "E1"
    }
    @IBAction func btnE2(_ sender: Any) {
        cursor = "E2"
    }
    @IBAction func btnE3(_ sender: Any) {
        cursor = "E3"
    }
    @IBAction func btnE4(_ sender: Any) {
        cursor = "E4"
    }
    @IBAction func btnE5(_ sender: Any) {
        cursor = "E5"
    }
    @IBAction func btnE6(_ sender: Any) {
        cursor = "E6"
    }
    @IBAction func btnE7(_ sender: Any) {
        cursor = "E7"
    }
    @IBAction func btnE8(_ sender: Any) {
        cursor = "E8"
    }
    @IBAction func btnE9(_ sender: Any) {
        cursor = "E9"
    }
    
    // Button F
    @IBAction func btnF1(_ sender: Any) {
        cursor = "F1"
    }
    @IBAction func btnF2(_ sender: Any) {
        cursor = "F2"
    }
    @IBAction func btnF3(_ sender: Any) {
        cursor = "F3"
    }
    @IBAction func btnF4(_ sender: Any) {
        cursor = "F4"
    }
    @IBAction func btnF5(_ sender: Any) {
        cursor = "F5"
    }
    @IBAction func btnF6(_ sender: Any) {
        cursor = "F6"
    }
    @IBAction func btnF7(_ sender: Any) {
        cursor = "F7"
    }
    @IBAction func btnF8(_ sender: Any) {
        cursor = "F8"
    }
    @IBAction func btnF9(_ sender: Any) {
        cursor = "F9"
    }
    
    // Button G
    @IBAction func btnG1(_ sender: Any) {
        cursor = "G1"
    }
    @IBAction func btnG2(_ sender: Any) {
        cursor = "G2"
    }
    @IBAction func btnG3(_ sender: Any) {
        cursor = "G3"
    }
    @IBAction func btnG4(_ sender: Any) {
        cursor = "G4"
    }
    @IBAction func btnG5(_ sender: Any) {
        cursor = "G5"
    }
    @IBAction func btnG6(_ sender: Any) {
        cursor = "G6"
    }
    @IBAction func btnG7(_ sender: Any) {
        cursor = "G7"
    }
    @IBAction func btnG8(_ sender: Any) {
        cursor = "G8"
    }
    @IBAction func btnG9(_ sender: Any) {
        cursor = "G9"
    }
    
    // Button H
    @IBAction func btnH1(_ sender: Any) {
        cursor = "H1"
    }
    @IBAction func btnH2(_ sender: Any) {
        cursor = "H2"
    }
    @IBAction func btnH3(_ sender: Any) {
        cursor = "H3"
    }
    @IBAction func btnH4(_ sender: Any) {
        cursor = "H4"
    }
    @IBAction func btnH5(_ sender: Any) {
        cursor = "H5"
    }
    @IBAction func btnH6(_ sender: Any) {
        cursor = "H6"
    }
    @IBAction func btnH7(_ sender: Any) {
        cursor = "H7"
    }
    @IBAction func btnH8(_ sender: Any) {
        cursor = "H8"
    }
    @IBAction func btnH9(_ sender: Any) {
        cursor = "H9"
    }
    
    // Button I
    @IBAction func btnI1(_ sender: Any) {
        cursor = "I1"
    }
    @IBAction func btnI2(_ sender: Any) {
        cursor = "I2"
    }
    @IBAction func btnI3(_ sender: Any) {
        cursor = "I3"
    }
    @IBAction func btnI4(_ sender: Any) {
        cursor = "I4"
    }
    @IBAction func btnI5(_ sender: Any) {
        cursor = "I5"
    }
    @IBAction func btnI6(_ sender: Any) {
        cursor = "I6"
    }
    @IBAction func btnI7(_ sender: Any) {
        cursor = "I7"
    }
    @IBAction func btnI8(_ sender: Any) {
        cursor = "I8"
    }
    @IBAction func btnI9(_ sender: Any) {
        cursor = "I9"
    }
    
    
    // Button Number
    
    @IBAction func btn1(_ sender: UIButton) {
        grid[cursor] = ["1"]
        display()
    }
    @IBAction func btn2(_ sender: UIButton) {
        grid[cursor] = ["2"]
        display()
    }
    @IBAction func btn3(_ sender: UIButton) {
        grid[cursor] = ["3"]
        display()
    }
    @IBAction func btn4(_ sender: UIButton) {
        grid[cursor] = ["4"]
        display()
    }
    @IBAction func btn5(_ sender: UIButton) {
        grid[cursor] = ["5"]
        display()
    }
    @IBAction func btn6(_ sender: UIButton) {
        grid[cursor] = ["6"]
        display()
    }
    @IBAction func btn7(_ sender: UIButton) {
        grid[cursor] = ["7"]
        display()
    }
    @IBAction func btn8(_ sender: UIButton) {
        grid[cursor] = ["8"]
        display()
    }
    @IBAction func btn9(_ sender: UIButton) {
        grid[cursor] = ["9"]
        display()
    }
    @IBAction func btnX(_ sender: UIButton) {
        grid[cursor] = [""]
        display()
    }
    

    // MARK: test function
    func myTestUI() -> Void {
        let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

