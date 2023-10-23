<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.scheme}://${req.serverName}:${req.serverPort}${req.contextPath}" />
<section class="breadcrumb-section set-bg" data-setbg="<c:url value='/resource/image/baner/reviewbanner.jpg'/>" style="background-image: url(&quot;img/breadcrumb.jpg&quot;);">
    <div class="container" >
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2 style="background-color: rgba(73, 70, 70, 0.6);border-radius: 10px"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Đánh giá</font></font></h2>

                </div>
            </div>
        </div>
    </div>
</section>
<section style="margin-top: 40px;margin-bottom: 20px">
    <div class="container">
        <div class="card">
            <div class="card-header">
                <div class="row">
                    <div class="col-md-6 ">
                        <img style="height: 300px; margin-left: 50%; transform: translateX(-50%)"  class="img-thumbnail" src="<c:url value='/resource/image/products/'/><c:forEach var="img" items="${billtype.type.product.imgProducts}"  begin="0" step="1" end="0">${img.img}</c:forEach>">
                    </div>
                    <div class="col-md-6" style="">
                        <ul class="list-group">
                            <li class="list-group-item"><strong>Sản phẩm: </strong> ${billtype.type.product.ten}</li>
                            <li class="list-group-item"><strong>Loại: </strong> ${billtype.type.ten}</li>
                            <li class="list-group-item"><strong>Giá: </strong> ${billtype.type.price}</li>
                            <li class="list-group-item"><strong>Mô tả: </strong> ${billtype.type.mota}</li>
                        </ul>
                    </div>
                </div>
            </div>
            
            <div class="card-body">
              <div class="rate">
                    <c:url value="${baseURL}/product/review/${billtype.id}" var="action" />
                    <form action="${action}" method="post" enctype="multipart/form-data" acceptCharset="UTF-8">
                        <h4><strong>Đánh giá</strong></h4>
                      <div class="form-floating">

                          <textarea class="form-control" name="comment" id="floatingTextarea"></textarea>
                          <label for="floatingTextarea">Đánh giá của bạn:</label>
                      </div>
                      <div class="rating"> 
                          <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label> <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label> <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label> <input type="radio" name="rating" value="1" id="1" checked><label for="1">☆</label>
                      </div>
                      <div class="mb-3">
                          <label for="formFileMultiple" class="form-label">Hình ảnh đánh giá:</label>
                          <input class="form-control" name="img[]" type="file" id="formFileMultiple" multiple>
                      </div>
                        <input type="submit" class="site-btn" value="Submit">
                    </form>
                </div>
            </div>
            <div >           
        </div>
    </div>
</section>
    <style>
        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center
        }

        .rating>input {
            display: none
        }

        .rating>label {
            position: relative;
            width: 1em;
            font-size: 30px;
            font-weight: 300;
            color: #FFD600;
            cursor: pointer
        }

        .rating>label::before {
            content: "\2605";
            position: absolute;
            opacity: 0
        }

        .rating>label:hover:before,
        .rating>label:hover~label:before {
            opacity: 1 !important
        }

        .rating>input:checked~label:before {
            opacity: 1
        }

        .rating:hover>input:checked~label:before {
            opacity: 0.4
        }


        .buttons{
            top: 36px;
            position: relative;
        }
        .rating-submit{
            border-radius: 15px;
            color: #fff;
            height: 49px;
        }
        .rating-submit:hover{
            color: #fff;
        }
    </style>