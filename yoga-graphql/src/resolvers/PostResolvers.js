const PostDao = require("../dao/PostDao");
const UserDao = require("../dao/UserDao");

module.exports.FindPostResolver = {
  post: (_, { id }, {loaders}) => {
    // return loaders.post.load(id);
    return PostDao.findPostById(id);
  }
};
module.exports.PostTypeResolver = {
  author: (parent, args, { loaders }, info) => {
    return loaders.user.load(parent.authorId);
    // return UserDao.findById(parent.authorId);
  }
};
module.exports.FindAllPostsResolver = {
  posts: () => PostDao.findAll()
};
module.exports.CreatePostResolver = {
  createPost: (_, { content, title, authorId }) =>
    PostDao.createPost({ content, title, authorId })
};
