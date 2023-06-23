class PlayerModel{
    var currentPlayer : Int = 0
    var boardArray = [[String]]()
    
    init(){
        let row1 = ["1", "2", "3"]
        let row2 = ["4", "5", "6"]
        let row3 = ["7", "8", "9"]
        boardArray.append(row1)
        boardArray.append(row2)
        boardArray.append(row3)
    }
    
    func SwitchPlayer() -> String{
        currentPlayer+=1
        let player = currentPlayer % 2 == 1 ? "X" : "O"
        return player
    }
    
    
    func updateGameBoardArray(row : Int, column : Int, playerSymbol : String) {
        boardArray[row][column] = playerSymbol
    }
    
    func checkWinCondition() -> Bool {
        var rowCount = 0
        var columnCount = 0
        var diagCount = 0
        var revDiagCount = 0
        var player = ""
        for m in 0..<boardArray.count-1
        {
            for n in 0..<boardArray[m].count-1{
                if((boardArray[m][n] == boardArray[m][n+1]) &&
                   (n<boardArray.count-1)){
                    rowCount+=1
                }
                if((boardArray[n][m] == boardArray[n+1][m]) &&
                   (n<boardArray.count-1)){
                    columnCount+=1
                }
                if((boardArray[m][n] == boardArray[m+1][n+1]) &&
                   (m == n)){
                    diagCount+=1
                }
            }
            if(rowCount == boardArray.count-1){
                return true
            }
            if(columnCount == boardArray.count-1){
                return true
            }
            if(diagCount == boardArray.count-1){
                return true
            }
            rowCount = 0
            columnCount = 0
        }
        
        for i in 0..<boardArray.count-1
        {
            for x in stride(from: boardArray.count-1, through: 1, by: -1) {
                if((boardArray[i][x] == boardArray[i+1][x-1]) &&
                   (i+x == boardArray.count-1)){
                    revDiagCount+=1
                }
            }
            if(revDiagCount == boardArray.count-1){
                return true
            }
        }
        return false
    }
    
}
