let ordersService = new Orders();
let productService = new Products();

function showOrders(){
  let listOthers = document.querySelector('#listOthers');
  listOthers.innerHTML = '';
  ordersService.getList().then(res => {
    res.forEach(element => {

        listOthers.innerHTML += `
      <tr>
          <td>#${element.id}</td>
          <td>${element.customer_name}</td>
          <td>${element.customer_address}</td>
          <td>${element.customer_email}</td>
          <td>${element.customer_phone_number}</td>
          <td>
          ${(element.status == 1) ? '<label class="badge badge-primary">Đã xử lý</label>' : '<label class="badge badge-danger">Chưa xử lý</label>'}
          </td>
          <td>${element.created_date}</td>
          <td>
            <a href="otherView.html?id=${element.id}"
            class="btn btn-outline-warning btn-fw">Chi tiết</a>
          </td>
      </tr>
      `;
    });
  })
}


function detailOrders(id){
  let listViewOthers = document.querySelector('#listViewOthers');
  listViewOthers.innerHTML = '';
  ordersService.viewOrder(id).then(res => {
    console.log(res);
    res.forEach(element => {

      listViewOthers.innerHTML += `
      <tr>
          <td>#${element.order_id}</td>
          <td>${element.name}</td>
          <td>${element.quantity}</td>
          <td>${element.unit_price}đ</td>
          <td>${element.quantity * element.unit_price}đ</td>
      </tr>
      `;
    });
  })
}

function getNameProduct(id){
  let name = productService.getOneProduct(id).then(data => {
     return data.name;
  });
  const printName = () => {
    name.then((a) => {
      console.log(a);
    });
  };
  return printName();
}