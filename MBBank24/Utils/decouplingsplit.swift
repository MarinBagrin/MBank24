struct FormatterUtills {
    static func decoupleNumber(accountInDouble:Double) ->String {
        let account = String(Int(accountInDouble))
        var strAccount: String = ""
        for (index,elem) in account.reversed().enumerated() {
            if (index % 3 == 0 && index != 0 ) {
                strAccount += " "
            }
            strAccount += String(elem)
        }
        let arrayAccount = Array(String(accountInDouble).reversed())
        strAccount = String(strAccount.reversed())
        if arrayAccount[2] == "." {
            strAccount += "." + String(arrayAccount[0]) + String(arrayAccount[1])
        }
        else {
            strAccount +=  "." + String(arrayAccount[0]) + "0"
        }
        return strAccount + " MDL"
    }
}
