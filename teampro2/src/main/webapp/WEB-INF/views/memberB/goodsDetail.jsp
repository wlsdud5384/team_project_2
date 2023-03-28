<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품상세 페이지</title>
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

/* 버튼 */
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

/* Responsive styles */
@media (max-width: 767px) {
form {
margin: 1rem;
padding: 1rem;
}
}
</style>

<script>
function goodsMod() {
	location.href = "./goodsMod";
}
function goodsDel() {
	if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
		return false;
	}
}
function goodsList() {
	location.href = "./goodsList";
}
</script>

<body>
<div>
    <div>
        <h1>상품 상세</h1>
    </div>

    <div class="goodsDetail">
        <form>
        <div>
        <label form="goods_img1">매물 사진</label>
        <input type="file" id="goods_img1" name="goods_img1" class="file-upload" accept="image/*" required multiple>
        </div>
            <div>
                <label form="goods_name">매물 이름</label>
                <input type="text" id="goods_name" name="goods_name">
            </div>
            <div>
                <label form="goods_floor">건물 층수</label>
                <input type="text" id="goods_floor" name="goods_floor">
            </div>
            <div>
                <label form="goods_area">공급 면적</label>
                <input type="text" id="goods_area" name="goods_area">
            </div>
            <div>
                <label form="goods_adr">주소</label>
                <input type="text" id="goods_adr" name="goods_adr">
            </div>

            <hr>
            
            <div class="row">
				<div class="col">
					<button class="btn" type="submit" onclick="goodsMod()">수정하기</button>
				</div>
				<div class="col">
					<button class="btn" type="submit" onclick="goodsDel()">삭제하기</button>
				</div>
				<div class="col">
					<button class="btn" onclick="goodsList()">목록으로</button>
				</div>
			</div>
        </form>
    </div>
</div>
</body>
</html>