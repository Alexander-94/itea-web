<%! private int number = 0;%>

<h1>Table Generator.</h1>
<table>
    <form action='login.jsp'>
     <tr><td>Cols Amt:</td><td><input type='text' name='cols' /></td></tr>
     <tr><td>Rows Amt:</td><td><input type='text' name='rows' /></td></tr>
     <tr><td></td><td><input type='submit' value='SEND' /></td></tr>   
    </form>
</table>

<%    
  boolean isShowForm = true;
  String result = "";  
  int cols = 0;
  int rows = 0;
  
  try{
    cols = Integer.parseInt(request.getParameter("cols"));
    rows = Integer.parseInt(request.getParameter("rows"));
    if(cols == 0 || rows == 0){
        throw new NumberFormatException();
    }
  }
  catch(NumberFormatException ex){
    isShowForm = false;  
    result += "Wrong parameters";
  }

  if(isShowForm){
    int counter = 1;
    result+="<table>";
    for(int i = 0; i < rows; i++){
        result+="<tr>";
        for(int j = 0; j < cols; j++){
           result+="<td width='40' height='40' align='center' bgcolor='DarkKhaki'>"+counter+"</td>";
           counter++;
        }
        result+="</tr>";
    }
    result+="</table>";
  }

  if(number==0){
    result="";
  }
  number++;
  out.write("<center>"+result+"</center>");
%>