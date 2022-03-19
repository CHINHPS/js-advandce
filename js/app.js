function Categories(){
  baseAPI.call(this);
  this.getList = function(){
    return this.get('categories').then(data => data.json());
  }
  this.addCategory = function (dataCategory){
    return this.post('categories',dataCategory);
  }
  this.updateCategory = function (dataCategory,id){
    return this.put('categories',dataCategory,id).then(data => data.json());
  }
  this.delCategory = function (id){
    return this.delete('categories',id);
  }
  this.getOneCategory = function (id){
    return this.getOne('categories',id).then(data => data.json());
  }
}

function Products(){
  baseAPI.call(this);
  this.getList = function(){
    return this.get('/api/product/list').then(data => data.json());
  }
  this.addProduct = function (dataProduct){
    return this.post('products',dataProduct);
  }
  this.updateProduct = function (dataProduct,id){
    return this.put('products',dataProduct,id).then(data => data.json());
  }
  this.delProduct = function (id){
    return this.delete('products',id);
  }
  this.getOneProduct = function (id){
    return this.getOne('products',id).then(data => data.json());
  }
}

function Orders(){
  baseAPI.call(this);
  this.getList = function(){
    return this.get('orders').then(data => data.json());
  }
  this.addOrder = function (dataOrder){
    return this.post('orders',dataOrder);
  }
  this.viewOrder = function (id){
    return this.get(`order_details?order_id=${id}`).then(data => data.json());
  }
}
