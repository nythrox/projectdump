const { GraphQLServer } = require("graphql-yoga");
const path = require("path");
const resolvers = require("./src/resolvers");
const DataLoader = require("dataloader");
const UserDao = require("./src/dao/UserDao")
const PostDao = require("./src/dao/PostDao")

const server = new GraphQLServer({
  typeDefs: path.resolve(__dirname, "src/schema.graphql"),
  context: () => {
    return {
      loaders : {
        user: new DataLoader(async keys => UserDao.findByIds(keys)),
        post: new DataLoader(async keys => PostDao.findByIds(keys)),
        postByAuthorId: new DataLoader(async keys => PostDao.findByAuthorIds(keys))
      }
    };
  },
  resolvers
});

const port = 8080;

server.start({
  port: port
});

console.log("Starting at port...: " + port);
