PHRASES = [["hello", "ahoy"], ["hi", "yo-ho-ho"], ["pardon me", "avast"],
 ["excuse me", "arrr"],
 ["my", "me"], ["friend", "me bucko"], ["sir", "matey"],
 ["madam", "proud beauty"], ["miss", "comely wench"],
 ["stranger", "scurvy dog"], ["officer", "foul blaggart"],
 ["where", "whar"], ["is", "be"], ["the", "th'"], ["you", "ye"],
 ["tell", "be tellin'"], ["know", "be knowin'"],
 ["how far", "how many leagues"], ["old", "barnacle-covered"],
 ["attractive", "comely"], ["happy", "grog-filled"],
 ["nearby", "broadside"], ["restroom", "head"], ["restaurant",
"galley"],
 ["hotel", "fleabag inn"], ["pub", "Skull & Scuppers"],
 ["bank", "buried trasure"]
 ];

 function Capitalize(str)
 // Returns: a copy of str with the first letter capitalized
 {
 return str.charAt(0).toUpperCase() + str.substring(1);
 }

 function Translate(text)
 // Returns: a copy of text with English phrases replaced by piratey equivalemts
 {
 for (var i = 0; i < PHRASES.length; i++) {
 var toReplace = new RegExp("\\b"+PHRASES[i][0]+"\\b", "i");
 
 var index = text.search(toReplace);
 while (index != -1) {
 if (text.charAt(index) >= "A" && text.charAt(index) <= "Z") {
 text = text.replace(toReplace, Capitalize(PHRASES[i][1]));
 }
 else {
 text = text.replace(toReplace, PHRASES[i][1]);
 }
 index = text.search(toReplace);
 }
 }
 return text;
 }


 //function that returns a copy of text w/English phrases, replaced with pirate-phrase equivalents 
function Convert(text) {

    for (var x = 0; x < PHRASES.length; x++) {

        var old_text = new RegExp("\\b" + PHRASES[x][0] + "\\b", "x");

        var searcher = text.search(old_text);

        while (searcher != -1) { //while index can be found

            if(text.charAt(index) >= "A" && text.charAt(index) <= "Z") {

                text = text.replace(old_text, Capitalize(PHRASES[x][1]));

            } else { //if letters are capitalized, just convert text

                text = text.replace(old_text, PHRASES[x][1]);

            }

            index = text.search(old_text);

        } 

    }

    return text;

 }

//helper function used to get text from from text area, translate + update text in output

function convert_text() {

    //get input text

    var in_text = document.getElementsByName("in-text")[0].value;

    //translate text

    var result = Translate(in_text);

    //set output text to the result

    document.getElementsByName("out-text")[0].value = result;

}