// src/components/Card/index.js
import "./Card.css";
import { Link } from "react-router-dom";
import React from "react";
class Card extends React.Component {
  render() {
    const title = this.props.title;
    const id = this.props.id;
    const img = this.props.img;
    const author = this.props.author;
    const description = this.props.description;
    let url = this.props.url;
    let image = img;
    if (url === undefined) {
      url = "/";
    }
    if (img === undefined) {//if the image isnt loadad, use a placeholder
      image = require("../img/placeholder.jpg");
    }
    else {//if it is laoded, use the image from the database
      image = require("../img/"+img);
    }
    return (
      <div className="item" post-id={id}>
        <Link to={url}>
          <div className="thumb">
            <div className="thumb-img">
              <img src={image} alt=""/>
            </div>
            <div className="thumb-details">
              <h1>{title}</h1>
              <p>{author}</p>
              <span>{description}</span>
            </div>
          </div>
          </Link>
      </div>
    );
  }
}
export default Card;
