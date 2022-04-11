function getRegexCount(regex, testString){
    var count = 0;
    if(testString != null && testString != "")
    {
        var results = testString.match(regex);
        if(results != null)
        {
            count = results.length
        }
    }
    
    return count;
}

function conformsToPattern(inpString, numOfUpper, numOfLower, numOfNumerics, numOfSymbols, minLength, maxLength, numOfMatchesRequired)
{
    var matchCount = 0
    var upperCaseRegex = new RegExp("[A-Z]", "g");
    var ucaseCount = getRegexCount(upperCaseRegex, inpString);
    var lowerCaseRegex = new RegExp("[a-z]", "g");
    var lcaseCount = getRegexCount(lowerCaseRegex, inpString);
    var numericRegex = new RegExp("[0-9]", "g");
    var numCount = getRegexCount(numericRegex, inpString);
    var symbolRegex = new RegExp("[^a-z,A-Z,0-9,x20]", "g");
    var symCount = getRegexCount(symbolRegex, inpString);
    var valid = true;
    
    if (minLength > 0 && maxLength > 0)
    {
        valid = inpString.length >= minLength && inpString.Length <= maxLength;
    }
    else if (minLength > 0)
    {
        valid = inpString.length >= minLength;
    }
    else if (maxLength > 0)
    {
        valid = inpString.length <= maxLength;
    }
    
    if(numOfUpper > 0 && ucaseCount >= numOfUpper)
        matchCount++;
    if(numOfLower > 0 && lcaseCount >= numOfLower)
        matchCount++;
    if(numOfNumerics > 0 && numCount >= numOfNumerics)
        matchCount++;
    if(numOfSymbols > 0 && symCount >= numOfSymbols)
        matchCount++;
    return  valid && (matchCount >= numOfMatchesRequired);
}