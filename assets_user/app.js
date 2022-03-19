
$(function () {
    var includes = $('[data-include]')
    $.each(includes, function () {
        var file = '../site_user/globals/' + $(this).data('include') + '.html'
        $(this).load(file)
    })
})

var data_user = JSON.parse(sessionStorage.getItem('user'));
var data_cart = JSON.parse(sessionStorage.getItem('cart'));
var link = 'http://localhost:3000';
let token = localStorage.getItem('token');

function getAPI2(endPoint, callback) {
    fetch(link + endPoint)
    .then((data) => data.json())
    .then((data) => callback(data))
}

function postAPI(endPoint,data,callback){
    fetch(link + endPoint, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data)
    })
    .then(data => data.json())
    .then(data => callback(data))
}

function setCookie(cname, cvalue, exdays) {
    const d = new Date();
    d.setTime(d.getTime() + (exdays*24*60*60*1000));
    let expires = "expires="+ d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    let name = cname + "=";
    let decodedCookie = decodeURIComponent(document.cookie);
    let ca = decodedCookie.split(';');
    for(let i = 0; i <ca.length; i++) {
      let c = ca[i];
      while (c.charAt(0) == ' ') {
        c = c.substring(1);
      }
      if (c.indexOf(name) == 0) {
        return c.substring(name.length, c.length);
      }
    }
    return "";
}

function deleteAllCookies() {
    var cookies = document.cookie.split(";");

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}

const product = (data) =>{
    return `
        <div class="ltn__product-item ltn__product-item-3 text-left">
            <div class="product-img">
                <a href="../site_user/view_product.html?id=${data.id}"><img src="${data.anhSP}" alt="#"></a>
                <div class="product-badge">
                    <ul>
                        <li class="sale-badge">Mới</li>
                    </ul>
                </div>
            </div>
            <div class="product-info">
                <h2 class="product-title"><a href="../site_user/view_product.html?id=${data.id}">${data.tenSP.slice(0, 21)}</a></h2>
                <div class="product-price">
                    <span>${new Intl.NumberFormat().format(data.gia)}đ</span>
                    <del>${new Intl.NumberFormat().format(data.gia * (100+data.giamGia) / 100)}đ</del>
                </div>
            </div>
        </div>
    `
}