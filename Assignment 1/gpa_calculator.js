var calculator = {
    //create a calculator array that holds data for grade points, gpa + courses 

    gpa_data: [],

    //add school data as objects to array
    add_course: function(course_name, grade, hours) {

        var running_pt_count = 0;

        var running_hr_count = 0;

        var user_data = window.prompt("Enter course name, grade, and credit hours [i.e. 'CSC551 B+ 3'] or click OK with no data to terminate.");

        var split_data = user_data.split("\s");

        this.gpa_data.push(split_data);

        var curr_hours = 0;
        
        for (var grade in gpa_data) {

        if (grade == "A") {

            running_pt_count += 4;

            running_hr_count += Number(user_data[2]);

        } else if (grade == "B+") {

            running_pt_count += 3.5;

            running_hr_count += Number[user_data[2]];

        } else if (grade == "B") {

            running_pt_count += 3;

            running_hr_count += Number[user_data[2]];

        } else if (grade == "C+") {

            running_pt_count += 2.5;

            running_hr_count += Number[user_data[2]];

        } else if (grade == "C") {

            running_pt_count += 2;

            running_hr_count += Number[user_data[2]];

        } else if (grade == "D") {

            running_pt_count += 1;

            running_hr_count += Number[user_data[2]];

        } else if (grade == "F" || grade == "AF" || grade == "WF") {

            running_hr_count += Number[user_data[2]];

        } else {

            console.log("Entry not recognized!")

        }

        var gpa = running_pt_ct / running_hr_count;

        var text = "<br/>Total grade points: " + running_pt_count + "<br/>";

        text += "Number of hours: " + running_hr_count + "<br/>";

        text += "GPA = " + gpa; 

        document.getElementById('text').innerHTML = text;

    }

    }




}