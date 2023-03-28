<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품수정 페이지</title>
</head>

<style>
/* Global styles */
body {
font-size: 16px;
line-height: 1.5;
margin: 0;
padding: 0;
}

/* Form styles */
form {
border: 1px solid #ccc;
border-radius: 4px;
margin: 2rem auto;
max-width: 600px;
padding: 2rem;
}

label {
display: block;
font-size: 1rem;
font-weight: bold;
margin-bottom: 0.5rem;
}

input[type="text"],
input[type="file"] {
border: 1px solid #ccc;
border-radius: 4px;
box-sizing: border-box;
font-size: 1rem;
margin-bottom: 1.5rem;
padding: 0.5rem;
width: 100%;
}

/* 수정, 삭제버튼 */
.btn {
background-color: #112d4e;
border: none;
border-radius: 4px;
color: #fff;
cursor: pointer;
font-size: 1rem;
margin-top: 1rem;
padding: 0.5rem 1rem;
}

.btn:hover {
background-color: #3e8e41;
}

.file-upload {
display: inline-block;
margin-bottom: 1.5rem;
overflow: hidden;
position: relative;
width: 100%;
}

.file-upload input[type="file"] {
cursor: pointer;
font-size: 1rem;
height: 100%;
left: 0;
opacity: 0;
position: absolute;
top: 0;
width: 100%;
z-index: 2;
}

/* Responsive styles */
@media (max-width: 767px) {
form {
margin: 1rem;
padding: 1rem;
}
}
</style>

<script>
function goodsList() {
	location.href = "./goodsList";
}
</script>

<body>
<div>
    <div>
        <h1>상품 수정</h1>
    </div>

    <div>
        <form>
        <div>
        <label form="goods_img1">매물 사진</label>
        <input type="file" id="goods_img1" name="goods_img1" class="file-upload" accept="image/*" required multiple>
        </div>
            <div>
                <label form="goods_name">매물 이름</label>
                <input type="text" id="goods_name" name="goods_name" placeholder="이름을 입력하세요">
            </div>
            <div>
                <label form="goods_floor">건물 층수</label>
                <input type="text" id="goods_floor" name="goods_floor" placeholder="층수를 입력하세요">
            </div>
            <div>
                <label form="goods_area">공급 면적</label>
                <input type="text" id="goods_area" name="goods_area" placeholder="공급 면적을 입력하세요">
            </div>
            <div>
                <label form="goods_adr">주소</label>
                <input type="text" id="goods_adr" name="goods_adr" placeholder="주소을 입력하세요">
            </div>

            <hr>
            
            <div class="row">
                <div class="col">
                    <button class="btn" type="submit">수정완료</button>
                </div>
                <div class="col">
                    <button class="btn" type="button" onclick="goodsList()">목록으로</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>