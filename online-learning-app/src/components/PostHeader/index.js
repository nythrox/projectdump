// src/components/PostHeader/index.js  
import React from "react";

class PostHeader extends React.Component{
    render(){
      console.log(this.props.image)
      if (this.props.image === null) {
         console.log(true)
      }
      
        return (
           <div><div className="hero-title">
           <h1>{this.props.title}</h1>
        </div>
        {
           (this.props.quote !== undefined) ? 
           (
              <div className="hero-subtitle">
                 <p>"... And then there were five"</p>
              </div>
           ) : 
           (null)
        }
        <div className="blog-author">
            {this.props.author}
        </div>
        {
           (this.props.image === undefined || this.props.image === null) ? (null) : (
           <img src={this.props.image} alt="this.props.alt"/>
         )
        }
         </div>
  );
    }   
}
export default PostHeader;