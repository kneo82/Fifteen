//
//  GameModel.swift
//  Fifteen
//
//  Created by Voronok Vitaliy on 11/16/15.
//  Copyright © 2015 IDPGroup. All rights reserved.
//

import Foundation

struct Array2D<T> {
    let rows: Int, columns: Int
    var grid: [T]
    
    init(rows: Int, columns: Int, repeatedValue: T) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: repeatedValue)
    }
    
    func indexIsValidForRow(row: Int, column: Int) ->Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> T {
        get {
            assert(indexIsValidForRow(row, column: column), "Index is out of range")
            return grid[(row * columns) + column]
        }
        
        set {
            assert(indexIsValidForRow(row, column: column), "Index is out of range")
            return grid[(row * columns) + column] = newValue
        }
    }
    
    mutating func swap(row1: Int, column1: Int, row2: Int, column2: Int) {
        let value = self[row1, column1]
        self[row1, column1] = self[row2, column2]
        self[row2, column2] = value
    }
}

class GameModel {
    var boardModel: Array2D<Int>
    let rows = 4
    let columns = 4
    
    var emptyBlock: (row: Int, column: Int) = (0, 0)
    
    var isWin: Bool {
        for row in 0..<4 {
            for column in 0..<4 {
                var index = (row * columns) + column + 1;
                index = index < (rows * columns) ? index : 0
                
                if boardModel[row, column] != index {
                    return false
                }
            }
        }
        
        return true
    }
    
    init() {
        boardModel = Array2D(rows: rows, columns: columns, repeatedValue: 0)
        
        for row in 0..<4 {
            for column in 0..<4 {
                var index = (row * columns) + column + 1;
                index = index < (rows * columns) ? index : 0
                
                boardModel[row, column] = index
                
                if index == 0 {
                    emptyBlock = (row: row, column: column)
                }
            }
        }
    }
    
    func canMove(index: Int) -> Bool {
        let row = index / columns
        let column = index % columns
        
        return canMove(row, column: column)
    }
    
    func canMove(row: Int, column: Int) -> Bool {
        return ((row + 1 == emptyBlock.row || row - 1 == emptyBlock.row)  && column == emptyBlock.column)
            || ((column + 1 == emptyBlock.column || column - 1 == emptyBlock.column)  && row == emptyBlock.row)
    }
    
    func moveBlock(row: Int, column: Int) {
        if canMove(row, column: column) {
            boardModel.swap(row, column1: column, row2: emptyBlock.row, column2: emptyBlock.column)
            emptyBlock = (row: row, column: column)
        }
    }
}