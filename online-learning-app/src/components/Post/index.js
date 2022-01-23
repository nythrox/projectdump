// src/components/Post/index.js
import React from "react";
import PostHeader from "../PostHeader";

class Post extends React.Component {
  state = {
    post_name: this.props.post_name, //post name (post unique id) is required so we can call the database acording to the post namie
    posts: [],
    post:""
  };

  componentDidMount() {
    this.getPost();
  }


  getPost = () => {
    fetch("/getPost/"+this.state.post_name)
      .then(res => res.json())
      .then(post => this.setState({post}));
  };

  render() {
    const postName = this.state.post_name;
    const post = this.state.post;
    //if has a image / image loaded, use image. Else, no image
    let image = (post.image !== undefined) ? (require("../img/"+post.image)) : (null);

    return (
      <div className="container"> 
        <PostHeader image={image} title={post.title} author={post.author}/>
        
        <div className="post-text">
             <div className="col-md-9">
        id:{postName}
        <h3>{post.description}</h3>
           
        </div></div>
        </div>
    );
  }
}
export default Post;
