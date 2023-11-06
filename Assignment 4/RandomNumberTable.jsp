<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>

<head>

        <meta charset="ISO-8859-1">

      <title>Example 2</title>

        <style>

                table, th, td {

                        border: 1px solid black;

                }

               

                table th, table td {

                        padding-left: 5px;

                        padding-right: 5px;

                }

        </style>

</head>

<body>

        <table>

                <tr>

                        <th>Trial 1</th>

                        <th>Trial 2</th>

                        <th>Trial 3</th>

                        <th>Horizontal Sum</th>

                        <th>Horizontal Average</th>

                </tr>

                <!-- store all rows for vertical calculations later -->

                <% float[] rows[] = new float[28][5]; %>

               

              <!-- 25 rows of numbers -->

                <% for(int i=0; i<25; i++) { %>

                        <!-- build the data for the row -->

                        <%

                                float row[] = new float[5];

                                Random rand = new Random();

                                       

                                row[0] = rand.nextInt(10);

                                row[1] = rand.nextInt(10);

                                row[2] = rand.nextInt(10);

                                row[3] = (row[0] + row[1] + row[2]); //sum

                                row[4] = (row[0] + row[1] + row[2]) / 3; //average

                               

                                // store the row for later

                                rows[i] = row;

                        %>

                        <tr style="background-color: <% if(i % 2 == 0) { %>#A5A5A5<% } else { %>lightgray<% } %>;">

                        <!-- 5 columns -->

                        <% for(int k=0; k<5; k++) { %>

                                <!-- set formatting for columns -->

                                <td>

                                        <% if(k < 4) { %>

                                                <%= new DecimalFormat("#").format(row[k]) %>

                                        <% } else { %>

                                                <%= new DecimalFormat("#.000").format(row[k]) %>

                                        <% } %>

                                </td>

                       

                        <% } %>

                        </tr>

                <% } %>

               

                <!-- Last two rows -->

                <tr style="background-color: lightgray;">

                        <td></td><td></td><td></td>

                        <td><strong>Vertical Sum</strong></td>

                        <td>

                                <%

                                        float sum = 0;

                                        for(int i=0; i<25; i++) {

                                                sum += rows[i][3];

                                %>

                                <% } %>

                                <%= new DecimalFormat("#").format(sum) %>

                        </td>

                </tr>

                <tr style="background-color: #A5A5A5;">

                        <td></td><td></td><td></td>

                        <td><strong>Vertical Average</strong></td>

                        <td>

                                <%

                                        float avg = 0;

                                        for(int i=0; i<25; i++) {

                                                avg += rows[i][4];

                                %>

                                <% }

                                        avg = avg / 25;

                                %>

                                <%= new DecimalFormat("#.00").format(avg) %>

                        </td>

                </tr>

        </table>

</body>

</html>

<%--Exercise 2, Part B  --%>

import java.io.PrintWriter;

import java.io.IOException;

import java.text.DecimalFormat;

import java.util.Random;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;


@WebServlet("/ExampleServlet")

public class ExampleServlet extends HttpServlet {

        private static final long serialVersionUID = 1L;

      


    public ExampleServlet() {

        super();

    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {          

                long time;

                boolean prevSess = false;

                HttpSession session = request.getSession(false);

       

                //previous session exists

                if (session != null) {

                        prevSess = true;

            time = (long)session.getAttribute("time");

        }

        else { //create a new session

                session = request.getSession(true);

                time = System.currentTimeMillis();

                session.setAttribute("time", time);

        }

        Random rand = new Random(time);

       

                PrintWriter out = response.getWriter();

        out.println (

                  "<!DOCTYPE html>\r\n" +

                  "<html>\r\n" +

                  "<head>\r\n" +

                  "     <meta charset=\"ISO-8859-1\">\r\n" +

                  "     <title>Example 2</title>\r\n" +

                  "     <style>\r\n" +

                 "             table, th, td {\r\n" +

                  "                     border: 1px solid black;\r\n" +

                  "             }\r\n" +

                  "             \r\n" +

                  "             table th, table td {\r\n" +

                  "                     padding-left: 5px;\r\n" +

                  "                     padding-right: 5px;\r\n" +

                  "             }\r\n" +

                  "     </style>\r\n" +

                  "</head>\r\n" +

                  "<body>\r\n");

        out.println ("<strong>Session Seed: " + time + "</strong>");

        if(prevSess)

                out.println("<em>(previous session used)</em>");

        out.println (

                        "       <table>\r\n" +

                  "             <tr>\r\n" +

                  "                     <th>Trial 1</th>\r\n" +

                  "                     <th>Trial 2</th>\r\n" +

                  "                     <th>Trial 3</th>\r\n" +

                 "                     <th>Horizontal Sum</th>\r\n" +

                  "                     <th>Horizontal Average</th>\r\n" +

                  "             </tr>"

                );

       

       // store all rows for vertical calculations later

                float[] rows[] = new float[28][5];

               

                // 25 rows of numbers

                for(int i=0; i<25; i++) {

                        // build the data for the row`

                        float row[] = new float[5];

                              

                        row[0] = rand.nextInt(10);

                        row[1] = rand.nextInt(10);

                        row[2] = rand.nextInt(10);

                        row[3] = (row[0] + row[1] + row[2]); //sum

                        row[4] = (row[0] + row[1] + row[2]) / 3; //average

                       

                        // store the row for later

                        rows[i] = row;

                       

                        out.println ("<tr style=\"background-color: ");

                        if(i % 2 == 0) {

                                out.print("#A5A5A5");

                        } else {

                                out.print("lightgray");

                        }

                        out.print (";\">");

                       

                        // 5 columns

                        for(int k=0; k<5; k++) {

                                // set formatting for columns

                                out.println ("<td>");

                                        if(k < 4) {

                                                out.println (new DecimalFormat("#").format(row[k]));

                                        } else {

                                               out.println (new DecimalFormat("#.000").format(row[k]));

                                        }

                                        out.println ("</td>");

                       

                        }

                        out.println ("</tr>");

                }

                // Last two rows

                out.println ("<tr style=\"background-color: lightgray;\">");

                out.println ("<td></td><td></td><td></td>");

                out.println ("<td><strong>Vertical Sum</strong></td>");

                out.println ("<td>");

                                

                float sum = 0;

                for(int i=0; i<25; i++) {

                        sum += rows[i][3];

                }

                out.println (new DecimalFormat("#").format(sum));

                out.println ("</td>");

                out.println ("</tr>");

                out.println ("<tr style=\"background-color: #A5A5A5;\">");

                out.println ("<td></td><td></td><td></td>");

                out.println ("<td><strong>Vertical Average</strong></td>");

                out.println ("<td>");

                               

                float avg = 0;

                for(int i=0; i<25; i++) {

                        avg += rows[i][4];

               

                }

               

                avg = avg / 25;

                       

                out.println (new DecimalFormat("#.00").format(avg));

                out.println ("</td>");

                out.println ("</tr>");

                out.println ("</table>");

                out.println ("</body>");

                out.println ("</html>");

        }

        /**

         * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

         */

        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

                doGet(request, response);

        }

}

<%--Exercise 2, Part C  --%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

    pageEncoding="ISO-8859-1"%>

   

<%@page import="java.util.Random" %>

<%@page import="java.text.DecimalFormat" %>


        <meta charset="ISO-8859-1">

        <title>Example 2</title>

        <style>

                table, th, td {

                        border: 1px solid black;

                }

               

                table th, table td {

                        padding-left: 5px;

                        padding-right: 5px;

                }

        </style>

</head>

<body>

        <table>

                <tr>

                        <th>Trial 1</th>

                        <th>Trial 2</th>

                        <th>Trial 3</th>

                        <th>Horizontal Sum</th>

                        <th>Horizontal Average</th>

                </tr>

                <!-- store all rows for vertical calculations later -->

                <% float[] rows[] = new float[28][5]; %>

              

                <!-- 25 rows of numbers -->

                <% for(int i=0; i<25; i++) { %>

                        <!-- build the data for the row -->

                        <%

                                float row[] = new float[5];

                                Random rand = new Random();

                                       

                                row[0] = rand.nextInt(10);

                                row[1] = rand.nextInt(10);

                                row[2] = rand.nextInt(10);

                                row[3] = (row[0] + row[1] + row[2]); //sum

                                row[4] = (row[0] + row[1] + row[2]) / 3; //average

                               

                                // store the row for later

                                rows[i] = row;

                        %>

                        <tr style="background-color: <% if(i % 2 == 0) { %>#A5A5A5<% } else { %>lightgray<% } %>;">

                        <!-- 5 columns -->

                        <% for(int k=0; k<5; k++) { %>

                                <!-- set formatting for columns -->

                                <td>

                                        <% if(k < 4) { %>

                                                <%= new DecimalFormat("#").format(row[k]) %>

                                        <% } else { %>

                                                <%= new DecimalFormat("#.000").format(row[k]) %>

                                        <% } %>

                                </td>

                       

                        <% } %>

                        </tr>

                <% } %>

               

                <!-- Last two rows -->

                <tr style="background-color: lightgray;">

                        <td></td><td></td><td></td>

                        <td><strong>Vertical Sum</strong></td>

                        <td>

                                <%

                                        float sum = 0;

                                        for(int i=0; i<25; i++) {

                                                sum += rows[i][3];

                                %>

                                <% } %>

                                <%= new DecimalFormat("#").format(sum) %>

                        </td>

                </tr>

                <tr style="background-color: #A5A5A5;">

                        <td></td><td></td><td></td>

                        <td><strong>Vertical Average</strong></td>

                        <td>

                                <%

                                        float avg = 0;

                                        for(int i=0; i<25; i++) {

                                                avg += rows[i][4];

                                %>

                                <% }

                                        avg = avg / 25;

                                %>

                                <%= new DecimalFormat("#.00").format(avg) %>

                        </td>

                </tr>

        </table>

</body>

</html>