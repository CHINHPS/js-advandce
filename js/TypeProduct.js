let categoriService = new Categories();

function showCategories(){
  let listTypes = document.querySelector('#listTypes');
  listTypes.innerHTML = '';
  categoriService.getList().then(res => {
    res.forEach(element => {

      listTypes.innerHTML += `
      <tr>
          <td>#${element.id}</td>
          <td>${element.name}</td>
          <td>${element.stt}</td>
          <td>
              <a href="changeType.html?id=${element.id}"
                  class="btn btn-outline-warning btn-fw">Sửa</a>
              <a onclick="delType(${element.id})"
                  class="btn btn-outline-danger btn-fw">Xóa</a>
          </td>
      </tr>
      `;
    });
  })
}

function delType(id) {
  if (confirm('Bạn có chắc muốn xoá?')) {
    categoriService.delCategory(id);
    showCategories();
  }
}

function showDetailCategory(id){
  let name = document.querySelector('#name');
  let stt = document.querySelector('#stt');

  categoriService.getOneCategory(id).then(data => {
    name.value = data.name;
    stt.value = data.stt;
  });
}

function editCategory(id){
  let name = document.querySelector('#name').value;
  let stt = document.querySelector('#stt').value;

  data = {
    "name": name,
    "stt": stt,
  }
  categoriService.updateCategory(data,id);
}

function themLoai() {
  let name = document.querySelector('#name').value;
  let stt = document.querySelector('#stt').value;

  if (name == '' || stt == '') {
    alert('Bạn chưa nhập đủ thông tin');
    return;
  }

  categoriService.addCategory({
    "name": name,
    "stt": stt,
  });

  alert(`Đăng loại sản phẩm ${name} thành công`);
  window.location = 'listTypes.html';
}