function PostDao() {
  this.findAll = function() {
    console.log("accessed db")
    return posts;
  };
  this.findPostById = function(id) {
    console.log("accessed db")
    return posts.filter(post => post.id == id)[0];
  };  
  this.findByIds = function(ids) {
    console.log("accessed db")
    console.log("POST")
    console.log("batch loding" + ids) 
    console.log(posts.filter(post => ids.includes(post.id)))
    return posts.filter(post => ids.includes(post.id));
  }
  this.createPost = function({ content, title, authorId }) {
    console.log("accessed db")
    const post = {
      id: 2,
      content,
      title,
      authorId
    };
    posts.push(post);
    return post;
  };
  this.findByAuthorId = function (authorId) {
    console.log("accessed db")
    return posts.filter(post => post.authorId == authorId)
  }
  this.findByAuthorIds = function(ids) {
    console.log("accessed db")
    return ids.map(id => posts.filter(post => post.authorId == id));
  }
}
module.exports = new PostDao();

const posts = [
  { id: 1, content: "graphql cool", title: "adfawwww", authorId: 1 },
  { id: 6, content: "asdasd cool", title: "adfawwww", authorId: 2 },
  { id: 9, content: "asdasd cool", title: "adfawwww", authorId: 3 }
];
