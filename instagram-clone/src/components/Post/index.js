  // src/components/Post/index.js
  
  import "./Post.css";
  
  import React, { Component } from "react";
    class Post extends Component {
        render() {
            //gets all the props that Posts.js set when instanciating this
            //and sets them all to variables for easy use 
            const nickname = this.props.nickname;
            const avatar = this.props.avatar;
            const image = this.props.image;
            const caption = this.props.caption;
            const likes = this.props.likes;
            return (
              <article className="Post" ref="Post">
                <header>
                  <div className="Post-user">
                    <div className="Post-user-avatar">
                      <img src={avatar} alt={nickname} />
                    </div>
                    <div className="Post-user-nickname">
                      <span>{nickname}</span>
                    </div>
                  </div>
                </header>
                <div className="Post-image">
                  <div className="Post-image-bg">
                    <img alt={caption} src={image} />
                  </div>
                </div>
                <div className="Post-caption">
                  <strong>{nickname}</strong> {caption}
                  <hr></hr>
                  {likes} Likes!
                </div>
                
              </article>
            );
          }
    }

    export default Post;