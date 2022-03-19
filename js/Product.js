let productService = new Products();

function showListProducts() {
  let listProducts = document.querySelector('#listProducts');
  listProducts.innerHTML = '';
  productService.getList().then(res => {
    res.forEach(element => {

      listProducts.innerHTML += `
      <tr>
          <td>${element.id}</td>
          <td><img src="${element.image}"></td>
          <td>${element.name}</td>
          <td>
            ${(element.status == 1) ? '<label class="badge badge-primary">Còn hàng</label>' : '<label class="badge badge-danger">Hết hàng</label>'}
          </td>
          <td>${element.price}đ</td>
          <td>
              <a href="changeProduct.html?id=${element.id}"
                  class="btn btn-outline-warning btn-fw">Sửa</a>
              <a onclick="delpd(${element.id})"
                  class="btn btn-outline-danger btn-fw">Xóa</a>
          </td>
      </tr>
      `;
    });
  })
}

function delpd(id) {
  if (confirm('Bạn có chắc muốn xoá?')) {
    let delProduct = function (id) {
      productService.delProduct(id);
    }
    delProduct(id);
    showListProducts();
  }
}

function showDetailProduct(id){
  let name = document.querySelector('#name');
  let price = document.querySelector('#price');
  let cate_id = document.querySelector('#cate_id');
  let detail = document.querySelector('#detail');
  let image = document.querySelector('#image');

  productService.getOneProduct(id).then(data => {
    name.value = data.name;
    price.value = data.price;
    cate_id.value = data.cate_id;
    detail.value = data.detail;
    image.value = data.image;
  });
}

function editProduct(id){
  let name = document.querySelector('#name').value;
  let price = document.querySelector('#price').value;
  let cate_id = document.querySelector('#cate_id').value;
  let detail = document.querySelector('#detail').value;
  let image = document.querySelector('#image').value;

  data = {
    "name": name,
    "cate_id": cate_id,
    "price": price,
    "detail": detail,
    "image": image
  }
  productService.updateProduct(data,id);
}

function dangSP() {
  let name = document.querySelector('#name').value;
  let price = document.querySelector('#price').value;
  let cate_id = document.querySelector('#cate_id').value;
  let detail = document.querySelector('#detail').value;
  let image = document.querySelector('#image').value;
  let addProduct = function (data) {
    productService.addProduct(data);
  }

  if (name == '' || price == '' || cate_id == '' || detail == '' || image == '') {
    alert('Bạn chưa nhập đủ thông tin');
    return;
  }


  addProduct({
    "name": name,
    "status": 1,
    "cate_id": cate_id,
    "price": price,
    "detail": detail,
    "image": image
  });

  alert(`Đăng sản phẩm ${name} thành công`);
}



