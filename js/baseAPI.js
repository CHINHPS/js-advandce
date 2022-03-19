function baseAPI() {

  this.url = 'http://localhost:3000';
  this.get = function (endPoint) {
    return fetch(`${this.url}/${endPoint}`);
  }

  this.post = function (endPoint, data) {
    return fetch(`${this.url}/${endPoint}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(data)
    });
  }
  this.getOne = function (endpoint,id) {
      return fetch(`${this.url}/${endpoint}/${id}`);
  }
  this.put = function (endpoint, dataPost, id) {
    return fetch(`${this.url}/${endpoint}/${id}`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(dataPost),
    })
  }
  this.delete = function (endpoint, id) {
    return fetch(`${this.url}/${endpoint}/${id}`, {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(),
    })
  }

}