// src/components/Slider/index.js
import "./Slider.css";
import React from "react";
import Card from "../Card";
import $ from 'jquery';

// function orderByAlphabeticOrder() {
//   return;
// }
// function orderByLikes() {}
class Slider extends React.Component {
  //usually you should be getting this from a database/api, that way its synchornized with the Post.js
  state = {
    posts: [
      {},
      {},
      {},
      {},
      {},
      {},
      {},
      {}

    ] 
  };

  componentDidMount() {
    this.getList();
    this.load();
  }

  getList = () => {
    fetch("/getPosts/8")
      .then(res => res.json())
      .then(posts => this.setState({posts}));
  };

  render() {
    const title = this.props.title;
    return (
      <section>
        <img
          className="leftLst"
          alt=""
          src="https://www.materialui.co/materialIcons/image/navigate_next_grey_192x192.png"
        />
        <img
          className="rightLst"
          alt=""
          src="https://www.materialui.co/materialIcons/image/navigate_next_grey_192x192.png"
        />
        <div className="container">
          <div className="section-title">
            <h1>{title}</h1>
          </div>
          <div className="section-tier" />
          <div className="section-container">
            <div className="row section-inner">
              {this.state.posts.map((
                post,
                index //counter is each element in counters with the info
              ) => (
                <Card
                  key={"myKey" + index}
                  id={post.id}
                  img={post.image}
                  title={post.title}
                  author={post.author}
                  description={post.description}
                  url={post.url}
                />
              ))}
            </div>
          </div>
        </div>
        <script src="./mySlider.js"></script>
    </section>
      
    );
  }
  load = () => {

    $(document).ready(function () {
      var itemsMainDiv = ('.section-container');
      var itemsMainDivWidth = $(itemsMainDiv).width();
      var itemsDiv = ('.section-inner');
      var itemClass = ('.item');
      var itemWidth = "";
      var itemsPerRow;
      function ResCarouselSize() {
          $(itemsDiv).each(function () {
                  $(itemsDiv).css( { "transition" : '0s all' } );
          
              var sectionWidth = $(this).width();
              
              var numItems = $(this).find(itemClass).length;
              
              ItemsPerRow();
              numItemsGlobal = numItems
              itemWidthGlobal = itemWidth;
              
              $(this).css({ 'width': itemWidth * numItems});
              $(this).css({ 'margin-left': '0px'});
              $(this).find(itemClass).each(function () {
                  $(this).css({'width':itemWidth});
              });
      
          });    
      }
      function ItemsPerRow() {
          var bodyWidth = $('body').width();
          if (bodyWidth >= 1200) {
              itemWidth = $(itemsMainDiv).width() / 4;
              itemsPerRow = 4;
          }
          else if (bodyWidth >= 992) {
              itemWidth = $(itemsMainDiv).width() / 3;     
              itemsPerRow = 3;       
          }
          else if (bodyWidth >= 768) {
              itemWidth = $(itemsMainDiv).width() / 3;
              itemsPerRow =3;
          }
          else  if (bodyWidth >= 530){
              itemWidth = $(itemsMainDiv).width() / 2 ;
              itemsPerRow = 2;
          }
          else {
  
              itemWidth = $(itemsMainDiv).width();
              itemsPerRow = 1;
          }
          return itemsPerRow
      }
      let itemWidthGlobal;
      let numItemsGlobal;
      
      $('.leftLst').on( "click", function() {
          moveCarousel(-1,this);
       });
       
      $('.rightLst').on( "click", function() {
          moveCarousel(1,this);
       });
  
      function moveCarousel (i,button) {
        
          let pai = $(button).parent()
          let items = pai.find(itemClass);
          pai.find(itemsDiv).css( { "transition" : '.5s all' } );
          if (i > 0) {
              let marginLeft = pai.find(itemsDiv).css('margin-left');
              let marginLeftFinal = parseFloat(marginLeft,10); //the reason you have to turn it into a float is because the original text is 0px not 0 so you cant add
              ItemsPerRow()
              if (itemsPerRow = 4 && marginLeftFinal - itemWidthGlobal < (itemWidthGlobal * numItemsGlobal * -1 )+ (itemWidthGlobal * (itemsPerRow ))) {
                  pai.find(itemsDiv).css( { "margin-left" : 0 } );
              }  
              else if (itemsPerRow = 1 && marginLeftFinal - itemWidthGlobal < (itemWidthGlobal * numItemsGlobal * -1 )+ (itemWidthGlobal * (itemsPerRow + 1))) {
                  pai.find(itemsDiv).css( { "margin-left" : 0 } );
              }  
              else {pai.find(itemsDiv).css( { "margin-left" : marginLeftFinal - itemWidthGlobal } );}
                  
              
          }
          else {
  
              let marginLeft = pai.find(itemsDiv).css('margin-left');
              let marginLeftFinal = parseFloat(marginLeft,10); //the reason you have to turn it into a float is because the original text is 0px not 0 so you cant add
              ItemsPerRow()
              if (marginLeftFinal + itemWidthGlobal > 0) {
                  ItemsPerRow()
                  pai.find(itemsDiv).css( { "margin-left" : (itemWidthGlobal * numItemsGlobal * -1 ) + itemWidthGlobal * itemsPerRow} );
              }
              else {
                  pai.find(itemsDiv).css( { "margin-left" : marginLeftFinal + itemWidthGlobal } );}
              
          }
      }
  
  
      ResCarouselSize();
  
  
  
  
  });
  }
}

export default Slider;
