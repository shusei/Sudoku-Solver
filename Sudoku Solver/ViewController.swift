//
//  ViewController.swift
//  Sudoku Solver
//
//  Created by SHENG CHUN LIN on 2018/12/18.
//  Copyright © 2018 SHENG CHUN LIN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    /*
    func cross(a: [Array<String>], b: [Array<String>]) -> Array<String> {
    }*/


    // MARK: button function
    // Button A
    @IBAction func bntA1(_ sender: UIButton) {
        NSLog("boxes[20]="+boxes[20])
    }
    @IBAction func bntA2(_ sender: UIButton) {
        
    }
    @IBAction func bntA3(_ sender: UIButton) {
        
    }
    @IBAction func bntA4(_ sender: UIButton) {
        
    }
    @IBAction func bntA5(_ sender: UIButton) {
        
    }
    @IBAction func bntA6(_ sender: UIButton) {
        
    }
    @IBAction func bntA7(_ sender: UIButton) {
        
    }
    @IBAction func bntA8(_ sender: UIButton) {
        
    }
    @IBAction func bntA9(_ sender: UIButton) {
        
    }
    
    // Button B
    @IBAction func bntB1(_ sender: UIButton) {
        
    }
    func btnB2() -> Void {
        
    }
    func btnB3() -> Void {
        
    }
    func btnB4() -> Void {
        
    }
    func btnB5() -> Void {
        
    }
    func btnB6() -> Void {
        
    }
    func btnB7() -> Void {
        
    }
    func btnB8() -> Void {
        
    }
    func btnB9() -> Void {
        
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

