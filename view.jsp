<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    twi.Model model = new twi.Model();
    String token="";
    String stoken="";
    token = request.getParameter("oauth_token");
    stoken = request.getParameter("oauth_verifier");
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Twitter OAuth認証開始</title>
  </head>
  </style>
  <body background="http://imgur.com/SFDwdTE.png">
      <% if (token==null || stoken==null){ %>
      <p><a href="<%=model.getAuth()%>">Twitter OAuth認証開始</a></p>
      <% }else{ %>
      <dt>Access Token</dt><dd><%=token%></dd>
      <dt>Token Secret</dt><dd><%=stoken%></dd>
      <% model.registerToken(token, stoken);
      model.twi4j();
      model.getTimeline();%>
      <Div Align="center">
          <h6>ミ<font color="red">★</font>あなたと仲の良いユーザーランキング<font color="red">★</font>ミ</h6><br><br>
          <% for(int i=0;i<5;i++){%>
          <font size=<%=7-i%> color="#99ff00">
          <%=i+1%>位：
          <img src=<%=model.pics[i]%> />
          <%=model.ranking[i]+"      "%>
          Score：<%=model.ranknum[i]%><br></font>
      <% }model.kaiseki(model.text); %>
      <form action="example.cgi">
          <p><input type="submit" value="結果をツイートする！"></p>
      </form>
      </Div>
      <form action="example.cgi">
          <p>ついーとする<input type="text" name="name"></p>
          <p><input type="submit" value="送信する"></p>
      </form>
      <table border=1><th><font size="5"><%=model.rtxt %></font></th></table>
      <% } %>
  </body>
</html>
