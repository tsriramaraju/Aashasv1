import React from 'react';

const Productcard = ({ name, img, price, size }) => {
  return (
    <div className="catalog-card">
      <div className="catalog-card-top">
        <img className="catalog-card-img" src={img} alt={name} />

        <div className="catalog-card-img-info">
          <div className="catalog-card-info-inner">
            <span className="catalog-card-p-name">{name}</span>
          </div>
          <div className="catalog-card-a-size">
            Available sizes : <span className="catalog-card-size">{size}</span>
          </div>
        </div>
      </div>
      <div className="catalog-card-down">
        <div className="catalog-card-h-bg">
          <div className="catalog-card-h-bg-inner"></div>
        </div>

        <a className="catalog-card-cart" href="#">
          <span className="catalog-card-price">{'$' + price}</span>
          <span className="catalog-card-add-to-cart">
            <span className="catalog-card-txt">View Product </span>
          </span>
        </a>
      </div>
    </div>
  );
};

export default Productcard;
