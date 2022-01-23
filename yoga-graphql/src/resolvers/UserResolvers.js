const UserDao = require("../dao/UserDao");
const PostDao = require("../dao/PostDao");
module.exports.UserTypeResolver = {
  friends: (parent, args) => {
    return [];
  },
  posts: (parent, args, {loaders}) => {
    console.log("--")
    return loaders.postByAuthorId.load(parent.id)
    // return PostDao.findByAuthorId(parent.id);
  }
};

module.exports.FindAllUsersResolver = {
  users: (parent, args, { usersLoader }, info) => {
    return UserDao.findAll();
  }
};

module.exports.FindUserResolver = {
  user: (_, { id }, { loaders }) => {
    // return loaders.user.load(id)
    return UserDao.findById(id)
  }
};
module.exports.CreateUserResolver = {
  createUser: (_, { name, email }) => UserDao.createUser({ name, email })
};

module.exports.SearchUserResolver = {
  searchUser: (_, { name, email }) => UserDao.findBySearch({ name, email })
};
