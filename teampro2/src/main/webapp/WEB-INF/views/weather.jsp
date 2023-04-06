<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.net.URL"%>
<%@ page import="javax.xml.parsers.*"%>
<%@ page import="org.w3c.dom.*"%>
<%@page import="javax.xml.xpath.*"%>
<%@ page import="org.xml.sax.InputSource"%>
<%
    //weather.jsp -> 지역 선택. 서브밋 액션. 날씨 정보 확인 및 출력.
    //절대경로 확인
    String path = request.getContextPath();
 
    String stnId = request.getParameter("stnId");
    if (stnId == null) {
        stnId = "108";
    }
 
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();
    Document doc = null;
 
    String str = String.format("http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=%s", stnId);
    System.out.println(str);
    URL url = new URL(str);
    InputSource is = new InputSource(url.openStream());
    doc = builder.parse(is);
 
    // XPath에 의한 XML 엘리먼트 탐색
    XPath xpath = XPathFactory.newInstance().newXPath();
 
    // 루트 엘리먼트 접근
    //Node rootNode = (Node) xpath.compile("/rss").evaluate(doc, XPathConstants.NODE);
    // System.out.println(rootNode.getNodeName()); //rss
 
    //특정 엘리먼트의 텍스트 접근  rss/channel/item/title 뽑아오기
    String title = xpath.compile("/rss/channel/item/title").evaluate(doc);
    
    // rss/channel/item/description/header/wf
    String headerWf = xpath.compile("/rss/channel/item/description/header/wf").evaluate(doc);
    
    // rss/channel/item/description/body/location -> 복수개 존재하므로 NodeList로 받아온다.
    NodeList locationList = (NodeList)xpath.compile("/rss/channel/item/description/body/location").evaluate(doc, XPathConstants.NODESET);
 
    StringBuilder sb = new StringBuilder();
    
    for (int i=0; i < locationList.getLength(); i++) {
        Node location = (Node)xpath.compile(String.format("/rss/channel/item/description/body/location[%s]", i+1)).evaluate(doc, XPathConstants.NODE);
        
        String city = xpath.compile("city").evaluate(location);
        
        sb.append(String.format("<h3>%s</h3>", city));
        sb.append(String.format("<table class=\"table\">"));
        sb.append(String.format("<thead><tr><th>날짜</th><th>날씨</th><th>최저/최고 기온</th><th>신뢰도</th></tr></thead>"));
        sb.append(String.format("<tbody>"));
        
        NodeList dataList = (NodeList)xpath.compile("data").evaluate(location, XPathConstants.NODESET);
        for (int k=0; k < dataList.getLength(); k++) {                                   //부모 -> 하나밖에 없어야 된다?(->Node)
            Node dataNode = (Node)xpath.compile(String.format("data[%s]", k+1)).evaluate(location, XPathConstants.NODE);
            
            // // -> 자손 탐색
            // / -> 루트
            String tmEf = xpath.compile(String.format("tmEf", k+1)).evaluate(dataNode);
            String wf = xpath.compile(String.format("wf", k+1)).evaluate(dataNode);
            String tmn = xpath.compile(String.format("tmn", k+1)).evaluate(dataNode);
            String tmx = xpath.compile(String.format("tmx", k+1)).evaluate(dataNode);
            String reliability = xpath.compile(String.format("reliability", k+1)).evaluate(dataNode);
            
            sb.append(String.format("<tr>"));
            sb.append(String.format("<td>%s</td>", tmEf));
            String img = "";
//             switch(wf){
//             case "맑음": img = "1.png"; break;
//             case "흐림": img = "W_DB04.png"; break;
//             case "비": img = "W_DB05.png"; break;
//             case "비,눈": img = "W_DB06.png"; break;
//             case "눈": img = "W_DB08.png"; break;
//             case "구름조금": img = "W_NB02.png"; break;
//             case "구름많음": img = "W_NB03.png"; break;
//             case "흐리고 비": img = "W_NB08.png"; break;
//             case "구름많고 비": img = "W_NB20.png"; break;
//             }
            sb.append(String.format("<img src=\""+ path +"/resources/img/%s\">", img));
            sb.append(String.format("<td>%s / %s</td>", tmn, tmx));
            sb.append(String.format("<td>%s</td>", reliability));
            sb.append(String.format("</tr>"));
        }            
        sb.append(String.format("</tbody>"));
        
    }
%>
<!DOCTYPE html>
<html>
<head>
<title>쌍용교육센터</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 
<!-- jQuery library -->
<script
    src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 
<!-- Latest compiled JavaScript -->
<script
    src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<script>
    $(document).ready(function() {
        $("input[value='<%=stnId%>']").attr("checked", "checked");
    });
</script>
 
</head>
<body>
 
    <div class="container">
        <h1>
            기상청 육상 중기예보 <small>v1.0 by XML</small>
        </h1>
        <div class="panel-group">
            <div class="panel panel-default">
                <div class="panel-heading">지역 선택</div>
                <div class="panel-body">
                    <form role="form" method="POST">
                        <input type="radio" name="stnId" value="108" checked="checked">
                        전국 <input type="radio" name="stnId" value="109"> 서울,경기 <input
                            type="radio" name="stnId" value="105"> 강원 <input
                            type="radio" name="stnId" value="131"> 충청북도 <input
                            type="radio" name="stnId" value="133"> 충청남도 <input
                            type="radio" name="stnId" value="146"> 전라북도 <input
                            type="radio" name="stnId" value="156"> 전라남도 <input
                            type="radio" name="stnId" value="143"> 경상북도 <input
                            type="radio" name="stnId" value="159"> 경상남도 <input
                            type="radio" name="stnId" value="184"> 제주특별자치도
 
                        <button type="submit" class="btn btn-default">Submit</button>
                    </form>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">기상 정보 출력</div>
                <div class="panel-body">
 
                    <p>
                        <b><%=title%></b>
                    </p>
 
                    <p>
                        <%=headerWf%>
                    </p>
                    
                    <%=sb.toString()%>
 
 
                </div>
            </div>
        </div>
 
    </div>
 
</body>
</html>
 
 
 
</div>
 
</body>
</html>
