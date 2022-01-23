function UserDao() {
  this.findAll = function() {
    console.log("accessed db")
    console.log("--------")
    return users;
  };
  this.findById = function(id) {
    console.log("accessed db")
    return users.filter(user => user.id == id)[0];
  };
  this.findByIds = function(ids) {
    console.log("accessed db")
    return users.filter(user => ids.includes(user.id));
  }
  this.findBySearch = function({ name, email }) {
    console.log("accessed db")
    let results = [];
    if (name) {
      const nameResults = users.filter(user => user.name.indexOf(name) > -1);
      results = [...results, ...nameResults];
    }
    if (email) {
      const emailResults = users.filter(user => user.email.indexOf(email) + -1);
      results = [...results, ...emailResults];
    }
    
    const distinctResults = [...new Set(results)];
    return distinctResults;
  };
  this.createUser = function({ name, email }) {
    console.log("accessed db")
    const user = {
      id: 5,
      name,
      email
    };
    users.push(user);
    return user;
  };
}

module.exports = new UserDao();

const users = [
  {
    id: 1,
    name: "jason",
    email: "jason.p08514@gmail.com"
  },
  {
    id: 2,
    name: "asdasdasd",
    email: "jason.p08514@gmail.com"
  },
  {
    id: 3,
    name: "foopoo",
    email: "jason.p08514@gmail.com"
  },
  {
    id: 4,
    name: "foopoo",
    email: "jason.p08514@gmail.com"
  },
  {
    id: 5,
    name: "foopoo",
    email: "jason.p08514@gmail.com"
  },
  {
    id: 6,
    name: "foopoo",
    email: "jason.p08514@gmail.com"
  },
  {
    id: 7,
    name: "foopoo",
    email: "jason.p08514@gmail.com"
  }
];
