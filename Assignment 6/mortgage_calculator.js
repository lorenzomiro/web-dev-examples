function value(input) {

    var uni = input.charCode? input.charCode : input.keyCode;

    if ((uni != 8) && (uni != 46)) {

        if (uni < 48 || uni > 57) {

            return false;

        }
    }

}

function payments() {

    document.getElementById('loan_error').innerHTML = '';

    document.getElementById('years_error').innerHTML = '';

    document.getElementById('rates_error').innerHTML = '';

if((document.calculator.loan.value === null) || (document.calculator.loan.value.length === 0) || (isNaN(document.calculator.loan.value) === true))

    document.getElementById('mon_pay').innerHTML = "Please enter the missing info.";

    document.getElementById('loan_error').innerHTML = "Numeric value is needed. EX: 420.69"; 

} else if ((document.calculator.years.value === null) || (document.calculator.years.value.length === 0) || isNaN(document.calculator.years.value === true)) {

    document.getElementById('mon_pay').innerHTML = "Please enter the missing info.";

    document.getElementById('loan_error').innerHTML = "Numeric value is needed. EX: 24"; 

} else if((document.calculator.rate.value === null) || (document.calculator.rate.value.length === 0) || (isNaN(document.calculator.rate.value) === true)) {

    document.getElementById('mon_pay').innerHTML = "Please enter the missing info.";

    document.getElementById('loan_error').innerHTML = "Numeric value is needed. EX: 8.25"; 

} else  {

    var loan_p = document.calculator.loan.value;

    var mo = document.calculator.years.value * 12;

    var roi = document.calculator.rate.value / 1200;

    document.getElementById('mo').innerHTML = "Monthly Mortage: $" + (loan_p * roi / (1 - Math.pow(1/(1 + roi, mo)))).toFixed(2)+".";

}

function reset_payments(){

    document.getElementById('mo').innerHTML = 'Values reset';

    document.getElementById('remind').style.display = 'none';
    
    document.getElementById('loan_error').innerHTML = '';
    
    document.getElementById('years_error').innerHTML = '';
    
    document.getElementById('rates_error').innerHTML = '';

}